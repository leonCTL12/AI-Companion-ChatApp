import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/media_button.dart';

class MediaBottomSheet extends StatelessWidget {
  MediaBottomSheet({super.key});

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        imageQuality: 80,
      );

      // 1. Check if the widget is still in the tree before using context
      if (!context.mounted) return;
      if (pickedFile != null) {
        Navigator.pop(context, pickedFile.path);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height * 0.2; //20% of the screen height

    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MediaButton(
              iconData: Icons.camera_alt,
              label: "camera",
              onPressed: () => _pickImage(context, ImageSource.camera),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: MediaButton(
              iconData: Icons.photo_library,
              label: "Photos",
              onPressed: () => _pickImage(context, ImageSource.gallery),
            ),
          ),
        ],
      ),
    );
  }
}
