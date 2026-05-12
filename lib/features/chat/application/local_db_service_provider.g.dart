// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localDbService)
final localDbServiceProvider = LocalDbServiceProvider._();

final class LocalDbServiceProvider
    extends $FunctionalProvider<LocalDbService, LocalDbService, LocalDbService>
    with $Provider<LocalDbService> {
  LocalDbServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDbServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDbServiceHash();

  @$internal
  @override
  $ProviderElement<LocalDbService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalDbService create(Ref ref) {
    return localDbService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDbService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDbService>(value),
    );
  }
}

String _$localDbServiceHash() => r'999d40788d43bf1ad29907044bfa0c157cc2ebc8';
