import 'dart:convert';
import 'dart:io';

class ImageUtilService {
  Future<String?> encodeImageToBase64(String? imagePath) async {
    if (imagePath == null) {
      return null;
    }
    final file = File(imagePath);

    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      return "data:image/jpeg;base64,${base64Encode(bytes)}";
    }
    return null;
  }
}
