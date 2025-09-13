import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/main_screen.dart';
import 'screens/restaurant_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/order_confirmation_screen.dart';
import 'screens/google_home.dart';

void main() {
  runApp(const ProviderScope(child: OrderlyApp()));
}

class OrderlyApp extends StatelessWidget {
  const OrderlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orderly',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (c) => const SplashScreen(),
        '/onboarding': (c) => const OnboardingScreen(),
        '/login': (c) => const LoginScreen(),
        '/signup': (c) => const SignupScreen(),
        '/forgot': (c) => const ForgotPasswordScreen(),
        '/main': (c) => const MainScreen(),
        '/restaurant': (c) => const RestaurantDetailScreen(),
        '/cart': (c) => const CartScreen(),
        '/checkout': (c) => const CheckoutScreen(),
  '/order-confirmation': (c) => const OrderConfirmationScreen(),
  '/google-home': (c) => const GoogleHome(),
      },
    );
  }
}
