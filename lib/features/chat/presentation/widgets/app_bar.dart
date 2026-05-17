import 'package:flutter/material.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/sign_in_button.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.history),
        tooltip: 'ChatHistory',
        onPressed: () {
          //TODO: Implement the logic for ChatHistory
        },
      ),
      actions: [SignInButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //default height of material app bar
}
