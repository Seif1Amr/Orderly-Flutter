import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _isLoading = false;

  Future<void> _createAccount() async {
    setState(() => _isLoading = true);
    // Accept everything and fake-create account
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(authProvider.notifier).login(_emailCtrl.text.isEmpty ? 'newuser@example.com' : _emailCtrl.text, _passCtrl.text);
    setState(() => _isLoading = false);
    if (mounted) Navigator.of(context).pushReplacementNamed('/google-home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _createAccount,
                    child: const Text('Create account'),
                  ),
          ],
        ),
      ),
    );
  }
}
