import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/mock_data.dart';

const categoryPrefetchUrls = [
  'https://images.unsplash.com/photo-1550547660-d9450f859349', // Burger
  'https://images.unsplash.com/photo-1601924582971-d3b6f89f28b1', // Pizza
  'https://images.unsplash.com/photo-1523983303491-3c9e1d76c9f0', // Pasta
  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c', // Sushi
  'https://images.unsplash.com/photo-1512621776951-a57141f2eefd', // Salad
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _prefetchAndContinue();
  }

  Future<void> _prefetchAndContinue() async {
    // collect urls from categories and mock data
    final urls = <String>{};
    urls.addAll(categoryPrefetchUrls);
    for (var r in mockRestaurants) {
      if (r.image.startsWith('http')) urls.add(r.image);
      for (var d in r.menu) {
        if (d.image.startsWith('http')) urls.add(d.image);
      }
    }

    // precache images using CachedNetworkImageProvider
    for (var url in urls) {
      try {
        final provider = CachedNetworkImageProvider(url);
        await precacheImage(provider, context);
      } catch (_) {
        // ignore errors during prefetch
      }
    }

    // small delay so splash feels natural
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) Navigator.of(context).pushReplacementNamed('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delivery_dining, size: 96, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16),
            const Text('Orderly', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
