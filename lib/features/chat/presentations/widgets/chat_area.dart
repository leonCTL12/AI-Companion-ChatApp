import 'package:flutter/cupertino.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/user_chat_message_bubble.dart';

class ChatArea extends StatelessWidget {
  final List<String> messages;

  const ChatArea({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        UserChatMessageBubble(message: "Hi"),
        UserChatMessageBubble(message: "Testing!!!!!"),
        UserChatMessageBubble(
          message:
              "I'm testing out the word wrapping for a slightly longer message to see if the constraints we set actually work properly on the screen.",
        ),
        UserChatMessageBubble(message: "Short one."),
        UserChatMessageBubble(
          message: "Can you help me render some Markdown later?",
        ),
      ],
    );
  }
}
