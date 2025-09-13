import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _addressCtrl = TextEditingController();
  String _paymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Delivery address')),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _paymentMethod,
              items: const [DropdownMenuItem(value: 'Cash', child: Text('Cash')), DropdownMenuItem(value: 'Card', child: Text('Card'))],
              onChanged: (v) => setState(() => _paymentMethod = v ?? 'Cash'),
              decoration: const InputDecoration(labelText: 'Payment method'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/order-confirmation'),
              child: const Text('Place order'),
            )
          ],
        ),
      ),
    );
  }
}
