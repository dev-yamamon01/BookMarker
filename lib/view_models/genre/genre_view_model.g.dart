// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$genreByIdHash() => r'd6be4b1ec63563901dcb055f6ee3256e3536c379';

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

/// See also [genreById].
@ProviderFor(genreById)
const genreByIdProvider = GenreByIdFamily();

/// See also [genreById].
class GenreByIdFamily extends Family<AsyncValue<Genre>> {
  /// See also [genreById].
  const GenreByIdFamily();

  /// See also [genreById].
  GenreByIdProvider call(
    int id,
  ) {
    return GenreByIdProvider(
      id,
    );
  }

  @override
  GenreByIdProvider getProviderOverride(
    covariant GenreByIdProvider provider,
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
  String? get name => r'genreByIdProvider';
}

/// See also [genreById].
class GenreByIdProvider extends AutoDisposeFutureProvider<Genre> {
  /// See also [genreById].
  GenreByIdProvider(
    int id,
  ) : this._internal(
          (ref) => genreById(
            ref as GenreByIdRef,
            id,
          ),
          from: genreByIdProvider,
          name: r'genreByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$genreByIdHash,
          dependencies: GenreByIdFamily._dependencies,
          allTransitiveDependencies: GenreByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GenreByIdProvider._internal(
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
    FutureOr<Genre> Function(GenreByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenreByIdProvider._internal(
        (ref) => create(ref as GenreByIdRef),
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
  AutoDisposeFutureProviderElement<Genre> createElement() {
    return _GenreByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenreByIdProvider && other.id == id;
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
mixin GenreByIdRef on AutoDisposeFutureProviderRef<Genre> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GenreByIdProviderElement extends AutoDisposeFutureProviderElement<Genre>
    with GenreByIdRef {
  _GenreByIdProviderElement(super.provider);

  @override
  int get id => (origin as GenreByIdProvider).id;
}

String _$genreViewModelHash() => r'4adcdab686fff0dcaa5eddb1058efe274f6b1ac7';

/// See also [GenreViewModel].
@ProviderFor(GenreViewModel)
final genreViewModelProvider =
    AutoDisposeStreamNotifierProvider<GenreViewModel, List<Genre>>.internal(
  GenreViewModel.new,
  name: r'genreViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$genreViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GenreViewModel = AutoDisposeStreamNotifier<List<Genre>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
