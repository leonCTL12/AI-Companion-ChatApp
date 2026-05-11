import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/application/chat_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/input_field.dart';

import '../../application/selected_image_provider.dart';
import '../../domain/models/message.dart';

class ImagePreviewPage extends ConsumerStatefulWidget {
  final String imagePath;

  const ImagePreviewPage({super.key, required this.imagePath});

  @override
  ConsumerState<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends ConsumerState<ImagePreviewPage> {
  late final TextEditingController _captionController;

  @override
  void initState() {
    super.initState();
    _captionController = TextEditingController();
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  void onSend() {
    final text = _captionController.text.trim();

    ref
        .read(chatProvider.notifier)
        .addUserMessage(text, imagePath: widget.imagePath);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ref.read(selectedImageProvider.notifier).clear();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        //Full Screen
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: Colors.white, size: 28),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: InteractiveViewer(
                //Allow Pinch to Zoom
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            //Caption Input Area
            InputField(
              controller: _captionController,
              onSend: onSend,
              hintText: "Write Caption Here",
            ),
          ],
        ),
      ),
    );
  }
}
