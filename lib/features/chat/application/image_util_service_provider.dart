import 'package:llm_chatbot/features/chat/infrastructure/services/image_util_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_util_service_provider.g.dart';

@riverpod
ImageUtilService imageUtilService(Ref ref) {
  return ImageUtilService();
}
