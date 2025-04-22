import 'package:flutter/material.dart';
import 'package:bookmarker/data/database.dart';
import 'package:bookmarker/data/models/tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final urlMapProvider = StreamProvider<Map<int, List<Url>>>((ref) {
  final db = AppDatabase();

  // genresとurlsをリアクティブに監視
  final genreStream = db.select(db.genres).watch();
  final urlStream = db.select(db.urls).watch();

  return Rx.combineLatest2(
    genreStream,
    urlStream,
        (List<Genre> genres, List<Url> urls) {
      final Map<int, List<Url>> genreMap = {};
      genreMap[0] = urls;

      for (final genre in genres) {
        genreMap[genre.id] =
            urls.where((url) => url.genreId == genre.id).toList();
      }

      return genreMap;
    },
  );

  // combineLatestで両方が変わるたびに実行される
  // await for (final _ in urlStream) {
  //   final genres = await db.select(db.genres).get(); // genres再取得
  //   final allUrls = await db.select(db.urls).get();
  //
  //   final Map<int, List<Url>> genreMap = {};
  //   genreMap[0] = allUrls;
  //
  //   for (final genre in genres) {
  //     genreMap[genre.id] = allUrls.where((url) => url.genreId == genre.id).toList();
  //   }
  //
  //   yield genreMap;
  // }
});