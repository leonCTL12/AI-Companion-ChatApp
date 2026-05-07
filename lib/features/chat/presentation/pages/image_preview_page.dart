import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/input_field.dart';

import '../../application/selected_image_provider.dart';

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
    //Microtask is some urgent little tasks run between the event queue
    //Run immediate after this frame/lifecycle task
    //To avoid modifying state while the widget tree is still in the disposal/rebuild state
    Future.microtask(() => ref.read(selectedImageProvider.notifier).clear());
    super.dispose();
  }

  void onSend() {
    //TODO: implement send
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Image.file(File(widget.imagePath), fit: BoxFit.contain),
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
    );
  }
}
