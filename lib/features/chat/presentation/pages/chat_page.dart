import 'package:flutter/material.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/chat_area.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/chat_input_field.dart';

import '../widgets/app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Column(
        children: [
          Expanded(child: ChatArea()),
          ChatInputField(),
        ],
      ),
    );
  }
}
