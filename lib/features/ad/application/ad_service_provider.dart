import 'package:llm_chatbot/features/ad/infrastructure/services/ad_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_service_provider.g.dart';

@riverpod
AdService adService(Ref ref) {
  return AdService();
}
