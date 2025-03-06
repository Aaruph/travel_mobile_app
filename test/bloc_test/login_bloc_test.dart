import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_mobile_app/core/error/failure.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:travel_mobile_app/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:travel_mobile_app/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:travel_mobile_app/features/home/presentation/view/home_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view_model/home_cubit.dart';

// Mock classes
class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late LoginBloc loginBloc;
  late MockRegisterBloc mockRegisterBloc;
  late MockHomeCubit mockHomeCubit;
  late MockLoginUseCase mockLoginUseCase;
  late MockBuildContext mockContext;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();
    mockHomeCubit = MockHomeCubit();
    mockLoginUseCase = MockLoginUseCase();
    mockContext = MockBuildContext();

    loginBloc = LoginBloc(
      registerBloc: mockRegisterBloc,
      homeCubit: mockHomeCubit,
      loginUseCase: mockLoginUseCase,
    );

    // Register fallback values to prevent missing stub errors
    registerFallbackValue(LoginParams(email: '', password: ''));
    when(() => mockContext.mounted).thenReturn(true);
  });

  test('Initial state should be LoginState.initial()', () {
    expect(loginBloc.state, LoginState.initial());
  });

  blocTest<LoginBloc, LoginState>(
    'Emits [loading, success] when login is successful',
    build: () {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => Right('mock_token'),
      );
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginCustomerEvent(
      email: 'test@example.com',
      password: 'password123',
      context: mockContext,
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
    verify: (_) {
      verify(() => mockLoginUseCase(any())).called(1);
    },
  );

  blocTest<LoginBloc, LoginState>(
    'Emits [loading, failure] when login fails due to invalid credentials',
    build: () {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => Left(ApiFailure(message: 'Invalid Credentials')),
      );
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginCustomerEvent(
      email: 'wrong@example.com',
      password: 'wrongpassword',
      context: mockContext,
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
    verify: (_) {
      verify(() => mockLoginUseCase(any())).called(1);
    },
  );

  blocTest<LoginBloc, LoginState>(
    'Triggers navigation to Register Screen',
    build: () => loginBloc,
    act: (bloc) => bloc.add(NavigateRegisterScreenEvent(
      context: mockContext,
      destination: Container(), // Mock widget as a placeholder
    )),
    verify: (_) {
      verify(() => mockContext.mounted).called(1);
    },
  );

  blocTest<LoginBloc, LoginState>(
    'Triggers navigation to Home Screen',
    build: () => loginBloc,
    act: (bloc) => bloc.add(NavigateHomeScreenEvent(
      context: mockContext,
      destination: HomeView(),
    )),
    verify: (_) {
      verify(() => mockContext.mounted).called(1);
    },
  );

  test('closes LoginBloc properly', () {
    expect(loginBloc.close(), completes);
  });
}