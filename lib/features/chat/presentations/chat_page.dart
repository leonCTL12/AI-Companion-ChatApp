import 'package:flutter/material.dart';
import 'package:llm_chatbot/features/chat/domain/message.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/chat_area.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/chat_input_field.dart';

import 'widgets/app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use your smart constructors for testing!
    final List<Message> testMessages = [
      // 1. Shortest possible message
      Message.user("K"),

      // 2. Multi-line AI support
      Message.ai("I'm here for you.\n\n Let's take a deep breath together."),

      // 3. The "Wall of Text" (Test wrapping and max-width)
      Message.user(
        "This is a really long sentence intended to see how the bubble expands horizontally until it hits the maximum width constraint, at which point it should ideally wrap to a new line instead of overflowing the screen edges or stretching the bubble awkwardly across the entire width of a tablet screen.",
      ),

      // 4. Emoji Stress (Check if emojis are cut off at the top/bottom)
      Message.ai("That sounds wonderful! 🚀✨🌈🥳🙌"),

      // 5. Single giant emoji (Common in messaging apps)
      Message.user("👍"),

      // 6. The "Non-Breaking" String (Crucial test for overflow)
      Message.ai(
        "Check this out: https://www.thisisaverylongurlthatmightbreakthelayoutifnotmanagedcorrectly.com/flutter-dev-diary-emotional-support-ai",
      ),

      // 7. Narrow text vs Wide text
      Message.user("Wait..."),
      Message.ai(
        "I'm listening... go on... I have all the time in the world for you.",
      ),

      // 8. Trailing whitespace and special chars
      Message.user("How does it look?     \n(Checking spacing)     "),
      Message.ai(";)"),
    ];
    return Scaffold(
      appBar: ChatAppBar(),
      body: Column(
        children: [
          Expanded(child: ChatArea(messages: testMessages)),
          ChatInputField(),
        ],
      ),
    );
  }
}
