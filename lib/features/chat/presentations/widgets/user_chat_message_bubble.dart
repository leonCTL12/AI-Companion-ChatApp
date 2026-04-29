import 'package:flutter/material.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/base_chat_message_bubble.dart';

import '../../domain/models/message.dart';

class UserChatMessageBubble extends StatelessWidget {
  final Message message;

  const UserChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BaseChatMessageBubble(
      message: message,
      alignment: Alignment.centerRight,
      backgroundColor: colorScheme.surfaceContainerHighest,
      textColor: colorScheme.onSurfaceVariant,
    );
  }
}
