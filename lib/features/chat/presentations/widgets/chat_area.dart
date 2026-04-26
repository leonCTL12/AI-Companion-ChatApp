import 'package:flutter/cupertino.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/user_chat_message_bubble.dart';

class ChatArea extends StatelessWidget {
  final List<String> messages;

  const ChatArea({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        // --- Day 1 Morning ---
        UserChatMessageBubble(
          message:
              "Hey, I've been feeling a bit overwhelmed lately with the job hunt. It's tougher than I expected.",
        ),
        AiChatMessageBubble(
          message:
              "I hear you. That process can be incredibly draining. Remember to be kind to yourself today—you're working hard on something big.",
        ),

        // --- Follow up ---
        UserChatMessageBubble(
          message: "Thanks. I just feel like I'm not doing enough, you know?",
        ),
        AiChatMessageBubble(
          message:
              "It’s very common to feel that way, but productivity doesn't define your worth. What's one small thing you did today that you're proud of? Even if it's just taking a break.",
        ),

        // --- Testing long vs short bubbles ---
        UserChatMessageBubble(message: "I finished my Flutter UI prototype!"),
        AiChatMessageBubble(
          message:
              "That's fantastic! 🥳 The first step is always the hardest. How does it feel to see it finally coming together on the screen?",
        ),

        // --- Testing multi-line wrapping ---
        UserChatMessageBubble(
          message:
              "It feels great! Though I'm still tweaking the chat bubbles to make sure they handle long sentences without breaking the layout or looking weirdly stretched out on wider screens.",
        ),
        AiChatMessageBubble(
          message:
              "Attention to detail like that is what makes an app feel polished. By the way, I'm right here whenever you need to vent or just share an update on your progress. You've got this!",
        ),
      ],
    );
  }
}
