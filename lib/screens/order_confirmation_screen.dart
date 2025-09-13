import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 96),
            const SizedBox(height: 12),
            const Text('Thank you! Your order is confirmed.'),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/main'), child: const Text('Back to Home')),
          ],
        ),
      ),
    );
  }
}
