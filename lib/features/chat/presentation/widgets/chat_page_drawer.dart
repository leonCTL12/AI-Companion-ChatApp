import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/auth/application/auth_state_provider.dart';

class ChatPageDrawer extends ConsumerWidget {
  const ChatPageDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);
    final authUser = authStateAsync.value;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'History',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            const Expanded(
              child: Center(child: Text('History items placeholder')),
            ),
            if (authUser != null) ...[
              const Divider(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton.icon(
                    onPressed: () {
                      //TODO: back up logic
                    },
                    label: const Text('Back up'),
                    icon: const Icon(Icons.backup),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
