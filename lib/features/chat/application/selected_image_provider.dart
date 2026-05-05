import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_image_provider.g.dart';

@riverpod
class SelectedImage extends _$SelectedImage {
  @override
  String? build() => null;

  void updatePath(String? path) {
    state = path;
  }

  void clear() {
    state = null;
  }
}
