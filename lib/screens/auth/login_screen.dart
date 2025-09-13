import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // No email/password fields for this demo; using Google-style sign-in only
  bool _isLoading = false;

  Future<void> _simulateGoogleSignIn() async {
    setState(() => _isLoading = true);
    // Simulate a short loading delay
  await Future.delayed(const Duration(milliseconds: 500));
  // Mock successful sign-in: set a fake user in auth provider
  await ref.read(authProvider.notifier).login('googleuser@example.com', '');
    setState(() => _isLoading = false);
    // Navigate to home screen
    if (mounted) Navigator.of(context).pushReplacementNamed('/google-home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            // App logo/title
            Column(
              children: const [
                Icon(Icons.delivery_dining, size: 80, color: Colors.deepOrange),
                SizedBox(height: 8),
                Text('Orderly', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
              ],
            ),

            const SizedBox(height: 24),
            // Google sign-in button
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: Image.network('https://www.gstatic.com/devrel-devsite/prod/vb7f5e6d3b0c5b5d2b0c1f6d2f6b2b7e2b77a7a7d7b1d2b7a7a7a7a7a7a7a7a7a7a7a7a7a7a7a/s/favicon.ico', width: 20, height: 20),
                    label: const Text('Continue with Google', style: TextStyle(color: Colors.black87)),
                    onPressed: _simulateGoogleSignIn,
                  ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/forgot'),
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
