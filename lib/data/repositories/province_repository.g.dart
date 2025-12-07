// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(provinceRepository)
const provinceRepositoryProvider = ProvinceRepositoryProvider._();

final class ProvinceRepositoryProvider
    extends
        $FunctionalProvider<
          ProvinceRepository,
          ProvinceRepository,
          ProvinceRepository
        >
    with $Provider<ProvinceRepository> {
  const ProvinceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'provinceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$provinceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProvinceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProvinceRepository create(Ref ref) {
    return provinceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProvinceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProvinceRepository>(value),
    );
  }
}

String _$provinceRepositoryHash() =>
    r'1c2dcb6ceb61b875dcf2842468d9a67a1d06fab5';
