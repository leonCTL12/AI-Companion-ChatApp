import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/chat_provider.dart';
import 'media_bottom_sheet.dart';

class ChatInputField extends ConsumerWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: Colors.grey.shade200,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MediaBottomSheet();
                  },
                );
              },
              icon: Icon(Icons.add),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "What's on your mind?",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  ref
                      .read(chatProvider.notifier)
                      .addUserMessage(controller.text);
                  controller.clear();
                }
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
