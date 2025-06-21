
import 'package:bookmarker/data/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bookmarker/data/models/urls_by_genre_name.dart';

//-------------------------------------------------
//このファイルはリファクタリングが完全に完了したら消す予定
//-------------------------------------------------

final urlMapProvider = StreamProvider<Map<int, UrlsByGenreName>>((ref) {
  final db = AppDatabase();

  // genresとurlsをリアクティブに監視
  final genreStream = db.select(db.genres).watch();
  final urlStream = db.select(db.urls).watch();

  return Rx.combineLatest2(
    genreStream,
    urlStream,
        (List<Genre> genres, List<Url> urls) {
      final Map<int, UrlsByGenreName> genreMap = {};
      genreMap[0]=UrlsByGenreName(name: "All", urls: urls);

      for (final genre in genres) {

        genreMap[genre.id] = UrlsByGenreName(
            name: genre.genreName,
            urls: urls.where((url) => url.genreId == genre.id).toList());

      }

      return genreMap;
    },
  );
});