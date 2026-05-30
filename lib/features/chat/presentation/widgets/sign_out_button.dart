import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/auth/application/auth_repository_provider.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        try {
          final authRepo = ref.read(authRepositoryProvider);

          await authRepo.signOut();

          await authRepo.signInAnonymously();
        } catch (e) {
          debugPrint('❌ Error during sign out cycle: $e');
        }
      },
      child: Text('Sign out'),
    );
  }
}
