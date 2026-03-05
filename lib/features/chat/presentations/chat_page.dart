import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(child: Text('This is the Chat Page')),
    );
  }
}
