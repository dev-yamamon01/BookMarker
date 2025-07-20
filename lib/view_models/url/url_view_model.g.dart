// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$urlByIdHash() => r'87ed169f53d87aa1d705d74c6a5c6f993f34aa6f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [urlById].
@ProviderFor(urlById)
const urlByIdProvider = UrlByIdFamily();

/// See also [urlById].
class UrlByIdFamily extends Family<AsyncValue<Url>> {
  /// See also [urlById].
  const UrlByIdFamily();

  /// See also [urlById].
  UrlByIdProvider call(
    int id,
  ) {
    return UrlByIdProvider(
      id,
    );
  }

  @override
  UrlByIdProvider getProviderOverride(
    covariant UrlByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'urlByIdProvider';
}

/// See also [urlById].
class UrlByIdProvider extends AutoDisposeFutureProvider<Url> {
  /// See also [urlById].
  UrlByIdProvider(
    int id,
  ) : this._internal(
          (ref) => urlById(
            ref as UrlByIdRef,
            id,
          ),
          from: urlByIdProvider,
          name: r'urlByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$urlByIdHash,
          dependencies: UrlByIdFamily._dependencies,
          allTransitiveDependencies: UrlByIdFamily._allTransitiveDependencies,
          id: id,
        );

  UrlByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Url> Function(UrlByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UrlByIdProvider._internal(
        (ref) => create(ref as UrlByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Url> createElement() {
    return _UrlByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UrlByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UrlByIdRef on AutoDisposeFutureProviderRef<Url> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UrlByIdProviderElement extends AutoDisposeFutureProviderElement<Url>
    with UrlByIdRef {
  _UrlByIdProviderElement(super.provider);

  @override
  int get id => (origin as UrlByIdProvider).id;
}

String _$urlViewModelHash() => r'711984b80acee6dcc15079072bc6f698cc369b87';

/// See also [UrlViewModel].
@ProviderFor(UrlViewModel)
final urlViewModelProvider =
    AutoDisposeStreamNotifierProvider<UrlViewModel, List<Url>?>.internal(
  UrlViewModel.new,
  name: r'urlViewModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$urlViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UrlViewModel = AutoDisposeStreamNotifier<List<Url>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
