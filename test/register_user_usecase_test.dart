import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_mobile_app/core/error/failure.dart';
import 'package:travel_mobile_app/features/auth/domain/entity/auth_entity.dart';
import 'package:travel_mobile_app/features/auth/domain/repository/auth_repository.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/register_user_usecase.dart';

// Mock the IAuthRepoitory
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late RegisterUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RegisterUseCase(mockRepository);

    registerFallbackValue(const AuthEntity(
      fName: '',
      lName: '',
      phone: '',
      email: '',
      password: '',
      image: '',
    ));
  });

  // Test case for successful register
  test('should call registerCustomer with correct AuthEntity and return void',
      () async {
    const params = RegisterUserParams(
      fname: 'Aaruph',
      lname: 'Giri',
      phone: '9841234567',
      email: 'aaruph@gmail.com',
      password: 'password123',
      image: 'profile.jpg',
    );

    const authEntity = AuthEntity(
      fName: 'Aaruph',
      lName: 'Giri',
      phone: '9841234567',
      email: 'aaruph@gmail.com',
      password: 'password123',
      image: 'profile.jpg',
    );

    // Mock the repository to return Right(null) for successful signup
    when(() => mockRepository.registerCustomer(authEntity))
        .thenAnswer((_) async => const Right(null));

    final result = await useCase(params);

    expect(result, const Right(null));
    verify(() => mockRepository.registerCustomer(authEntity)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  // Test case for failed register
  test('should return a Failure when registerCustomer fails', () async {
    const params = RegisterUserParams(
      fname: 'Aaruph',
      lname: 'Giri',
      phone: '9841234567',
      email: 'aaruph@gmail.com',
      password: 'password123',
      image: 'profile.jpg',
    );

    const authEntity = AuthEntity(
      fName: 'Aaruph',
      lName: 'Giri',
      phone: '9841234567',
      email: 'aaruph@gmail.com',
      password: 'password123',
      image: 'profile.jpg',
    );

    const failure = ApiFailure(message: 'Signup failed');

    // Mock the repository to return Left(Failure) for failed signup
    when(() => mockRepository.registerCustomer(authEntity))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(authEntity)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });

// Test case for email already in use
  test('should return a Failure when email is already in use', () async {
    // Arrange
    const params = RegisterUserParams(
      fname: 'Aaruph',
      lname: 'Giri',
      phone: '9840922949',
      email: 'aaruph@gmail.com', // Email already registered
      password: 'aaruph123',
      image: 'profile.jpg',
    );

    // const authEntity = AuthEntity(
    //   fName: 'Aaruph',
    //   lName: 'Giri',
    //   phone: '9840922949',
    //   email: 'aaruph@gmail.com',
    //   password: 'aaruph123',
    //   image: 'profile.jpg',
    // );

    const failure = ApiFailure(message: 'Email is already in use');

    // Mock the repository to return failure for this specific input
    when(() => mockRepository.registerCustomer(any(that: isA<AuthEntity>())))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(any(
        that: isA<AuthEntity>()
            .having((e) => e.email, 'email', 'aaruph@gmail.com')))).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });

  // Test case for invalid email format
  test('should return a Failure when email format is invalid', () async {
    // Arrange
    const params = RegisterUserParams(
      fname: 'Aaruph',
      lname: 'Giri',
      phone: '9840922949',
      email: 'invalid-email',
      password: 'aaruph123',
      image: 'profile.jpg',
    );

    const failure = ApiFailure(message: 'Invalid email format');

    when(() => mockRepository.registerCustomer(any(that: isA<AuthEntity>())))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(any(
        that: isA<AuthEntity>()
            .having((e) => e.email, 'email', 'invalid-email')))).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });
}
