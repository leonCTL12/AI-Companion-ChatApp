// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedImage)
final selectedImageProvider = SelectedImageProvider._();

final class SelectedImageProvider
    extends $NotifierProvider<SelectedImage, String?> {
  SelectedImageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedImageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedImageHash();

  @$internal
  @override
  SelectedImage create() => SelectedImage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedImageHash() => r'11af611d3a323aa6b33a4e2c605ce80862d9a283';

abstract class _$SelectedImage extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
