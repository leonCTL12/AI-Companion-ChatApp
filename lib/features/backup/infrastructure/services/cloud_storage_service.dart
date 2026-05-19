import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStorageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String collectionName = 'backups';
  static const String updatedAtField = 'updatedAt';
  static const String dataField = 'data';

  Future<void> uploadBackup({
    required String userId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(userId).set({
        updatedAtField: FieldValue.serverTimestamp(),
        dataField: payload,
      });
    } catch (e) {
      throw Exception('Failed to push backup to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> downloadBackup(String userId) async {
    try {
      final doc = await _firestore.collection(collectionName).doc(userId).get();

      final documentData = doc.data();
      if (documentData == null) {
        return null;
      }

      return documentData[dataField] as Map<String, dynamic>?;
    } catch (e) {
      throw Exception('Failed to retrieve backup from firestore: $e');
    }
  }
}
