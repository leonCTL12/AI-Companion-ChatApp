import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/application/chat_display_item_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/date_divider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/user_chat_message_bubble.dart';

import '../../domain/models/message.dart';
import '../models/chat_item.dart';

class ChatArea extends ConsumerWidget {
  const ChatArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayItems = ref.watch(chatDisplayItemsProvider);
    return ListView.builder(
      reverse: true, //for auto scroll to bottom
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: displayItems.length,
      itemBuilder: (context, index) {
        final item = displayItems[displayItems.length - 1 - index];
        return switch (item) {
          DateHeaderItem(date: final d) => DateDivider(dateTime: d),
          MessageItem(message: final m) =>
            m.fromUser
                ? UserChatMessageBubble(message: m)
                : AiChatMessageBubble(message: m),
          LoadingItem() => AiChatMessageBubble(
            message: Message.ai("Typing..."),
          ),
          ErrorItem(message: final msg) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                msg,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        };
      },
    );
  }
}
