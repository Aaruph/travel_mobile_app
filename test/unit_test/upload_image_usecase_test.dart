import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_mobile_app/core/error/failure.dart';
import 'package:travel_mobile_app/features/auth/domain/repository/auth_repository.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/upload_image_usecase.dart';

// Mock the IAuthRepoitory
class MockAuthRepository extends Mock implements IAuthRepository {}

// Concrete subclass of Failure for testing
class TestFailure extends Failure {
  const TestFailure({required super.message});
}

void main() {
  late UploadImageUsecase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = UploadImageUsecase(mockRepository);
  });

  // Test case for successful image upload
  test(
      'should call uploadProfilePicture with correct File and return image URL',
      () async {
    final file = File('path/to/image.jpg');
    const imageUrl = 'https://example.com/image.jpg';

    when(() => mockRepository.uploadProfilePicture(file))
        .thenAnswer((_) async => const Right(imageUrl));

    final result = await useCase(UploadImageParams(file: file));

    expect(result,
        const Right(imageUrl)); 
    verify(() => mockRepository.uploadProfilePicture(file)).called(
        1); 
    verifyNoMoreInteractions(
        mockRepository); 
  });

  // Test case for image upload failure
  test('should return a Failure when uploadProfilePicture fails', () async {
    final file = File('path/to/image.jpg');
    const failure = TestFailure(message: 'Image upload failed');

    when(() => mockRepository.uploadProfilePicture(file))
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(UploadImageParams(file: file));

    expect(
        result, const Left(failure));
    verify(() => mockRepository.uploadProfilePicture(file)).called(
        1);
    verifyNoMoreInteractions(
        mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });
}