import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/auth/application/auth_state_provider.dart';
import 'package:llm_chatbot/features/backup/application/backup_repository_provider.dart';

class BackupButton extends ConsumerWidget {
  const BackupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);

    final authUser = authStateAsync.value;
    if (authUser == null) return const SizedBox.shrink(); //just for safety

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: FilledButton.icon(
          onPressed: () async {
            _showLoadingDialog(context);
            final messenger = ScaffoldMessenger.of(context);
            String result = "";
            try {
              await ref
                  .read(backupRepositoryProvider)
                  .executeBackup(authUser.uid);
              result = 'Backup completed!';
            } catch (e) {
              result = 'Backup failed: ${e.toString()}';
            } finally {
              if (context.mounted) {
                //Pop the loading dialog
                Navigator.of(context).pop();
                //Pop the drawer
                Navigator.of(context).pop();

                messenger.showSnackBar(SnackBar(content: Text(result)));
              }
            }
          },
          label: const Text('Back up'),
          icon: const Icon(Icons.backup),
        ),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 24),
              Text('Backing up...'),
            ],
          ),
        );
      },
    );
  }
}
