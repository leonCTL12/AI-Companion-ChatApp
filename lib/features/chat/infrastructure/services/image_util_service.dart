import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

  Future<String> moveImageToAppDir(String imagePath) async {
    final hash = await _hashImage(
      imagePath,
    ); //use hash to prevent storing same images twice
    final String fileExtension = p.extension(imagePath);
    final fileName = '$hash$fileExtension';

    final appDir = await getApplicationDocumentsDirectory();
    final mediaDir = Directory('${appDir.path}/media');

    if (!await mediaDir.exists()) {
      await mediaDir.create(recursive: true);
    }

    final String permanentPath = p.join(mediaDir.path, fileName);
    final File permanentFile = File(permanentPath);

    if (await permanentFile.exists()) {
      print("File already exists: $permanentPath");
      return permanentPath;
    }
    final File tempFile = File(imagePath);

    await tempFile.copy(permanentPath);
    return permanentPath;
  }

  Future<String> _hashImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final List<int> bytes = await imageFile.readAsBytes();

    final String hash = md5.convert(bytes).toString();
    return hash;
  }
}
