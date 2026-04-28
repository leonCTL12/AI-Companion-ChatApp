import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/user_chat_message_bubble.dart';

import '../../providers/chat_provider.dart';

class ChatArea extends ConsumerWidget {
  const ChatArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatProvider);
    return ListView.builder(
      reverse: true,
      //The reason I have to do this is because I want it to scroll to bottom when new message is added
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index]; //reverse access
        if (message.fromUser) {
          return UserChatMessageBubble(message: message);
        } else {
          return AiChatMessageBubble(message: message);
        }
      },
    );
  }
}
