import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/application/chat_display_item_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/date_divider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/user_chat_message_bubble.dart';

import '../../application/chat_provider.dart';
import '../../domain/models/message.dart';
import '../models/chat_item.dart';

class ChatArea extends ConsumerWidget {
  const ChatArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayItems = ref.watch(chatDisplayItemsProvider);
    final chatState = ref.watch(chatProvider);
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

  Widget _buildMessageList(
    List<Message> messages, {
    required bool isLoading,
    String? errorMessage,
  }) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            //The reason I have to do this is because I want it to scroll to bottom when new message is added
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message =
                  messages[messages.length - 1 - index]; //reverse access
              if (message.fromUser) {
                return UserChatMessageBubble(message: message);
              } else {
                return AiChatMessageBubble(message: message);
              }
            },
          ),
        ),

        if (isLoading)
          Align(
            alignment: Alignment.centerLeft,
            child: AiChatMessageBubble(message: Message.ai("Typing...")),
          ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: CupertinoColors.destructiveRed,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
