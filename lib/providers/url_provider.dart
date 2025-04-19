import 'package:flutter/material.dart';
import 'package:bookmarker/data/database.dart';
import 'package:bookmarker/data/models/tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlMapProvider = StreamProvider<Map<int, List<Url>>>((ref) async* {
  final db = AppDatabase();

  // genresとurlsをリアクティブに監視
  final genreStream = db.select(db.genres).watch();
  final urlStream = db.select(db.urls).watch();

  // combineLatestで両方が変わるたびに実行される
  await for (final _ in urlStream) {
    final genres = await db.select(db.genres).get(); // genres再取得
    final allUrls = await db.select(db.urls).get();

    final Map<int, List<Url>> genreMap = {};
    genreMap[0] = allUrls;

    for (final genre in genres) {
      genreMap[genre.id] = allUrls.where((url) => url.genreId == genre.id).toList();
    }

    yield genreMap;
  }
});