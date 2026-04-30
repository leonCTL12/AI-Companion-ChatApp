import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      actions: [
        TextButton(
          onPressed: () {
            //TODO: Implement the logic for Sign in
          },
          child: Text('Sign in'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //default height of material app bar
}
