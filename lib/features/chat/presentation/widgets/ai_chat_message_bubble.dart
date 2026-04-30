import 'package:flutter/material.dart';
import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/base_chat_message_bubble.dart';

class AiChatMessageBubble extends StatelessWidget {
  final Message message;

  const AiChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseChatMessageBubble(
      message: message,
      alignment: Alignment.centerLeft,
      backgroundColor: colorScheme.secondaryContainer,
      textColor: colorScheme.onSecondaryContainer,
    );
  }
}
