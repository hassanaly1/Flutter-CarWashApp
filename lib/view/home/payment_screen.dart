import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Text('Make a payment'),
        ),
      ),
    );
  }
}
