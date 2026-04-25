import 'package:flutter/material.dart';

class MediaBottomSheet extends StatelessWidget {
  const MediaBottomSheet({super.key});

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
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Text("Camera"),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.photo_library),
              label: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Text("Photos"),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.insert_drive_file),
              label: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Text("Files"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
