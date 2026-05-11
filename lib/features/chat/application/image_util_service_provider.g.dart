// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_util_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageUtilService)
final imageUtilServiceProvider = ImageUtilServiceProvider._();

final class ImageUtilServiceProvider
    extends
        $FunctionalProvider<
          ImageUtilService,
          ImageUtilService,
          ImageUtilService
        >
    with $Provider<ImageUtilService> {
  ImageUtilServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageUtilServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageUtilServiceHash();

  @$internal
  @override
  $ProviderElement<ImageUtilService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImageUtilService create(Ref ref) {
    return imageUtilService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageUtilService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageUtilService>(value),
    );
  }
}

String _$imageUtilServiceHash() => r'18db678bbf00d95f929379cdb29576a5591796b3';
