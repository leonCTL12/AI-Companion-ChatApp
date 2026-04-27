import 'package:flutter/cupertino.dart';
import 'package:llm_chatbot/features/chat/domain/message.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/user_chat_message_bubble.dart';

class ChatArea extends StatelessWidget {
  final List<Message> messages;

  const ChatArea({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var message = messages[index];
        if (message.fromUser) {
          return UserChatMessageBubble(message: message);
        } else {
          return AiChatMessageBubble(message: message);
        }
      },
    );
  }
}
