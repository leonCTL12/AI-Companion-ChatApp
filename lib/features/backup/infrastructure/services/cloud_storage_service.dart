import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStorageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadBackup({
    required String userId,
    required Map<String, dynamic> encryptedPayload,
  }) async {
    try {
      await _firestore.collection('backups').doc(userId).set({
        'updatedAt': FieldValue.serverTimestamp(),
        'data': encryptedPayload,
      });
    } catch (e) {
      throw Exception('Failed to push backup to Firestore: $e');
    }
  }
}
