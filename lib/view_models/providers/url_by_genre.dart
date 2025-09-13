import 'package:bookmarker/data/models/urls_by_genre_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/data/models/tables.dart';
import 'package:drift/drift.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';
import 'package:bookmarker/view_models/genre/genre_view_model.dart';

part 'url_by_genre.g.dart';

@riverpod
Future<(List<Genre>?, Map<int, UrlsByGenreName>?)> urlByGenre(UrlByGenreRef ref) async {
  final genres = await ref.watch(genreViewModelProvider.future);
  final urls = await ref.watch(urlViewModelProvider.future);

  if (genres == null || urls == null) return (null, null);

  final entries = await Future.wait(genres.map((genre) async {
    final urlsById = await ref.read(urlViewModelProvider.notifier).getUrl(genre.id);
    return MapEntry(genre.id, UrlsByGenreName(name: genre.genreName, urls: urlsById));
  }));

  final urlsByGenreNameMap = {
    0: UrlsByGenreName(name: "All", urls: urls),
    ...Map.fromEntries(entries),
  };

  return (genres, urlsByGenreNameMap);
}
