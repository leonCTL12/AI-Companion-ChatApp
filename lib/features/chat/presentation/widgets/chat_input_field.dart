import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/application/selected_image_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/pages/image_preview_page.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/input_field.dart';

import '../../application/chat_provider.dart';
import 'media_bottom_sheet.dart';

class ChatInputField extends ConsumerStatefulWidget {
  const ChatInputField({super.key});

  @override
  ConsumerState<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends ConsumerState<ChatInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Initialized once
  }

  @override
  void dispose() {
    _controller.dispose(); // Cleaned up when the user leaves the screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(selectedImageProvider, (_, next) {
      if (next != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImagePreviewPage(imagePath: next),
          ),
        );
      }
    });

    void onSend() {
      if (_controller.text.trim().isNotEmpty) {
        ref.read(chatProvider.notifier).addUserMessage(_controller.text);
        _controller.clear();
      }
    }

    return InputField(
      leadingWidget: IconButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => MediaBottomSheet(),
        ),
        icon: Icon(Icons.add),
      ),
      controller: _controller,
      onSend: onSend,
      hintText: "What's on your mind",
    );
  }
}
