import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _page(context, 'Fast Delivery', 'Get your food delivered fast.'),
          _page(context, 'Best Restaurants', 'Pick from top-rated restaurants.'),
          _page(context, 'Easy Payments', 'Multiple payment options.'),
        ],
      ),
      bottomSheet: TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
        child: const Text('Get Started'),
      ),
    );
  }

  Widget _page(BuildContext context, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.fastfood, size: 120),
          const SizedBox(height: 24),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(subtitle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
