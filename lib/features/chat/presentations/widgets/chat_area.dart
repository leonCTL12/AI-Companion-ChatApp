import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/ai_chat_message_bubble.dart';
import 'package:llm_chatbot/features/chat/presentations/widgets/user_chat_message_bubble.dart';

import '../../domain/models/message.dart';
import '../../providers/chat_provider.dart';

class ChatArea extends ConsumerWidget {
  const ChatArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(chatProvider);
    return messagesAsync.when(
      skipLoadingOnRefresh: false,
      data: (messages) => _buildMessageList(messages, isLoading: false),
      error: (err, stack) => _buildMessageList(
        messagesAsync.value ?? [],
        errorMessage: "Connection lost, Please try again later",
        isLoading: false,
      ),
      loading: () =>
          _buildMessageList(messagesAsync.value ?? [], isLoading: true),
    );
  }

  Widget _buildMessageList(
    List<Message> messages, {
    required bool isLoading,
    String? errorMessage,
  }) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            //The reason I have to do this is because I want it to scroll to bottom when new message is added
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message =
                  messages[messages.length - 1 - index]; //reverse access
              if (message.fromUser) {
                return UserChatMessageBubble(message: message);
              } else {
                return AiChatMessageBubble(message: message);
              }
            },
          ),
        ),

        if (isLoading)
          Align(
            alignment: Alignment.centerLeft,
            child: AiChatMessageBubble(message: Message.ai("Typing...")),
          ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: CupertinoColors.destructiveRed,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
