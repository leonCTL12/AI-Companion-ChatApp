// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_permanent_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isPermanentUser)
final isPermanentUserProvider = IsPermanentUserProvider._();

final class IsPermanentUserProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsPermanentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPermanentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPermanentUserHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isPermanentUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPermanentUserHash() => r'4086aff8cbf2319bdb56a22c545cebd9641ee37d';
