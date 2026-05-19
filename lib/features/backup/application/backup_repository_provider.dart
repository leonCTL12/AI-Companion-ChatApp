import 'package:llm_chatbot/features/backup/application/cloud_storage_service_provider.dart';
import 'package:llm_chatbot/features/backup/infrastructure/repositories/backup_repository.dart';
import 'package:llm_chatbot/features/chat/application/local_db_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_repository_provider.g.dart';

@riverpod
BackupRepository backupRepository(Ref ref) {
  final localDbService = ref.watch(localDbServiceProvider);
  final cloudStorageService = ref.watch(cloudStorageServiceProvider);

  return BackupRepository(localDbService, cloudStorageService);
}
