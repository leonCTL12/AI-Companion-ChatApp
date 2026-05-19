// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_storage_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cloudStorageService)
final cloudStorageServiceProvider = CloudStorageServiceProvider._();

final class CloudStorageServiceProvider
    extends
        $FunctionalProvider<
          CloudStorageService,
          CloudStorageService,
          CloudStorageService
        >
    with $Provider<CloudStorageService> {
  CloudStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudStorageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudStorageServiceHash();

  @$internal
  @override
  $ProviderElement<CloudStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CloudStorageService create(Ref ref) {
    return cloudStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudStorageService>(value),
    );
  }
}

String _$cloudStorageServiceHash() =>
    r'726eef7c302672195ab6609760f7b5b72b6fcd8a';
