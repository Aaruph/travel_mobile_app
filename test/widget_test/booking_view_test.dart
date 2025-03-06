import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_mobile_app/features/home/presentation/view/booking/booking_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/paymentdetail/paymentdetail_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/paymentprogress_view.dart/paymentprogress_view.dart';

void main() {
  group('BookingView Widget Tests', () {
    const title = "Beautiful Beach Resort";
    const location = "Maldives";
    const rating = 4.5;
    const price = 100.0;

    
    
    testWidgets('Navigate to PaymentDetailView when selecting payment method',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BookingView(
            title: title,
            location: location,
            rating: rating,
            price: price,
          ),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Tap on "Select Payment Method"
      await tester.tap(find.text('Select Payment Method'));
      await tester.pumpAndSettle();

      // Ensure we have navigated to PaymentDetailView
      expect(find.byType(PaymentDetailView), findsOneWidget);
    });

    testWidgets('Navigate to PaymentProgressView when clicking "Pay Now"',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BookingView(
            title: title,
            location: location,
            rating: rating,
            price: price,
          ),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Tap on the "Pay Now" button
      await tester.tap(find.text('Pay Now'));
      await tester.pumpAndSettle();

      // Ensure we have navigated to PaymentProgressView
      expect(find.byType(PaymentProgressView), findsOneWidget);
    });
  });
}
