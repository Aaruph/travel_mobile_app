import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:travel_mobile_app/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/register_view.dart';
import 'package:travel_mobile_app/features/auth/presentation/view_model/signup/register_bloc.dart';

// Mock classes
class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

void main() {
  group('RegisterView Widget Tests', () {
    late RegisterBloc registerBloc;

    setUp(() {
      registerBloc = RegisterBloc(
        registerUseCase: MockRegisterUseCase(),
        uploadImageUsecase: MockUploadImageUsecase(),
      );
    });

    tearDown(() {
      registerBloc.close();
    });

    Widget createTestWidget() {
      return BlocProvider<RegisterBloc>(
        create: (_) => registerBloc,
        child: const MaterialApp(
          home: RegisterView(),
        ),
      );
    }

    // 1. Test if the title "Sign Up" is displayed
    testWidgets('Displays Sign Up title', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle(); // Ensure UI settles

      expect(find.text('Sign Up'), findsWidgets); // Checks multiple occurrences
    });

    // 2. Test if the sign-up button is present
    testWidgets('Sign Up button is present', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Sign Up'), findsWidgets); // Checks multiple instances
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    // 3. Test form validation when fields are empty

    // 4. Test if tapping on the profile image opens the image picker modal
    testWidgets('Tapping on upload image opens bottom sheet',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('Upload Picture'));
      await tester.pump();

      expect(find.byType(BottomSheet), findsOneWidget);
      expect(find.text('Camera'), findsOneWidget);
      expect(find.text('Gallery'), findsOneWidget);
    });
  });
}
