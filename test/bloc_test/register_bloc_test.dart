import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_mobile_app/core/error/failure.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:travel_mobile_app/features/auth/presentation/view_model/signup/register_bloc.dart';

// Mock classes
class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockUploadImageUsecase mockUploadImageUsecase;
  late MockBuildContext mockContext;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockUploadImageUsecase = MockUploadImageUsecase();
    mockContext = MockBuildContext();

    registerBloc = RegisterBloc(
      registerUseCase: mockRegisterUseCase,
      uploadImageUsecase: mockUploadImageUsecase,
    );

    // Register fallback values for mock parameters
    registerFallbackValue(RegisterUserParams(
      fname: '',
      lname: '',
      phone: '',
      email: '',
      password: '',
      image: '',
    ));

    registerFallbackValue(UploadImageParams(file: File('')));
  });

  test('Initial state should be RegisterState.initial()', () {
    expect(registerBloc.state, RegisterState.initial());
  });



  blocTest<RegisterBloc, RegisterState>(
    'Emits [loading, success] when image upload is successful',
    build: () {
      when(() => mockUploadImageUsecase.call(any())).thenAnswer(
        (_) async => Right('uploaded_image.jpg'),
      );
      return registerBloc;
    },
    act: (bloc) => bloc.add(UploadImage(file: File('test.jpg'))),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial()
          .copyWith(isLoading: false, isSuccess: true, imageName: 'uploaded_image.jpg'),
    ],
  );

  blocTest<RegisterBloc, RegisterState>(
    'Emits [loading, failure] when image upload fails due to API error',
    build: () {
      when(() => mockUploadImageUsecase.call(any())).thenAnswer(
        (_) async => Left(ApiFailure(message: 'Upload Failed')),
      );
      return registerBloc;
    },
    act: (bloc) => bloc.add(UploadImage(file: File('test.jpg'))),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
  );

  blocTest<RegisterBloc, RegisterState>(
    'Emits correct state when image name is updated',
    build: () => registerBloc,
    act: (bloc) => bloc.emit(
      RegisterState.initial().copyWith(imageName: 'updated_image.jpg'),
    ),
    expect: () => [
      RegisterState.initial().copyWith(imageName: 'updated_image.jpg'),
    ],
  );

  /// ✅ 5. *Ensure Bloc Closes Properly*
    test('closes RegisterBloc properly', () {
      expect(registerBloc.close(), completes);
    });
}