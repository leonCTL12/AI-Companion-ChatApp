import 'package:llm_chatbot/features/backup/infrastructure/services/cloud_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_storage_service_provider.g.dart';

@riverpod
CloudStorageService cloudStorageService(Ref ref) {
  return CloudStorageService();
}
