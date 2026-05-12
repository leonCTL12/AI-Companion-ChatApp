import 'package:llm_chatbot/features/chat/infrastructure/services/local_db_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_db_service_provider.g.dart';

@riverpod
LocalDbService localDbService(Ref ref) {
  return LocalDbService();
}
