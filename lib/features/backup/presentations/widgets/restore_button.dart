import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/auth/application/auth_state_provider.dart';
import 'package:llm_chatbot/features/backup/application/backup_repository_provider.dart';
import 'package:llm_chatbot/features/chat/application/chat_provider.dart';

class RestoreButton extends ConsumerWidget {
  const RestoreButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);

    final authUser = authStateAsync.value;
    if (authUser == null) return const SizedBox.shrink(); //just for safety

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          onPressed: () async {
            final confirmed = await _showWarningDialog(context);

            if (!confirmed) return;

            //This line is just get rid of warning, coz it is impossible to unmount the drawer (thus the restore button) before the warning dialog got dismissed
            if (!context.mounted) return;

            final messenger = ScaffoldMessenger.of(context);
            _showLoadingDialog(context);

            final authUser = ref.read(authStateProvider).value;
            String result = "";

            try {
              await ref
                  .read(backupRepositoryProvider)
                  .restoreBackup(authUser!.uid);
              await ref.read(chatProvider.notifier).reloadFromLocalDb();
              result = 'Backup restored successfully!';
            } catch (e) {
              result = 'Restore failed: ${e.toString()}';
            } finally {
              if (context.mounted) {
                // Close the loading dialog modal
                Navigator.of(context).pop();
                // Close the side drawer overlay panel cleanly
                Navigator.of(context).pop();
                messenger.showSnackBar(SnackBar(content: Text(result)));
              }
            }
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          label: const Text('Restore Backup'),
          icon: const Icon(Icons.restore),
        ),
      ),
    );
  }

  Future<bool> _showWarningDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
              SizedBox(width: 8),
              Text('Overwrite Warning'),
            ],
          ),
          content: const Text(
            'Are you sure you want to restore? This will completely replace your current local chat history with your cloud backup. This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
              child: const Text('Restore'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    return result ?? false; //fallback if user tap outside to dismiss the dialog
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
              Text('Restoring...'),
            ],
          ),
        );
      },
    );
  }
}
