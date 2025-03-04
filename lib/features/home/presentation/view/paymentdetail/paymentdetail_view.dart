import 'package:flutter/material.dart';

class PaymentDetailView extends StatefulWidget {
  const PaymentDetailView({super.key});

  @override
  _PaymentDetailViewState createState() => _PaymentDetailViewState();
}

class _PaymentDetailViewState extends State<PaymentDetailView> {
  int? selectedPaymentIndex;

  final List<Map<String, String>> paymentMethods = [
    {
      'name': 'FonePay',
      'description': 'Pay using fonePay QR upon Delivery',
      'icon': 'assets/images/hiking.png'
    },
    {
      'name': 'eSewa',
      'description': 'Pay online using eSewa digital wallet',
      'icon': 'assets/images/hiking.png'
    },
    {
      'name': 'IME Pay',
      'description': 'Pay online using IME Pay digital wallet',
      'icon': 'assets/images/hiking.png'
    },
    {
      'name': 'Khalti Digital Wallet',
      'description': 'Pay online using Khalti Digital Wallet',
      'icon': 'assets/images/hiking.png'
    },
    {
      'name': 'ConnectIPS',
      'description': 'ConnectIPS - Pay Directly from Bank',
      'icon': 'assets/images/hiking.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Payment Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: paymentMethods.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Image.asset(paymentMethods[index]['icon']!, width: 30),
                    title: Text(paymentMethods[index]['name']!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    subtitle: Text(paymentMethods[index]['description']!,
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: selectedPaymentIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedPaymentIndex = value;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
