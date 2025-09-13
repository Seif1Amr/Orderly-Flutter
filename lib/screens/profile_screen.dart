import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? Column(
                children: [
                  const Text('Not logged in'),
                  ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/login'), child: const Text('Login')),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}'),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: 12),
                  ElevatedButton(onPressed: () => ref.read(authProvider.notifier).logout(), child: const Text('Logout')),
                ],
              ),
      ),
    );
  }
}
