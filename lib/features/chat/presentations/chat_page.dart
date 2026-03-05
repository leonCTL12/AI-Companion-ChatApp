import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Center(child: Text('This is the Chat Page')),
    );
  }
}
