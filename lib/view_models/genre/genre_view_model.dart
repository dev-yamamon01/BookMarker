import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:drift/drift.dart';

part 'genre_view_model.g.dart';

@riverpod
Future<Genre> genreById(GenreByIdRef ref, int id) async {
  final viewModel = ref.read(genreViewModelProvider.notifier);
  return viewModel.getGenreById(genreId: id);
}

@riverpod
class GenreViewModel extends _$GenreViewModel {
  late final AppDatabase _db;
  @override
  Stream<List<Genre>> build(){
    _db=ref.watch(databaseProvider);
    return _db.select(_db.genres).watch();
  }

  Future<Genre> getGenreById({required int genreId}) async {
    final query = _db.select(_db.genres)
      ..where((tbl) => tbl.id.equals(genreId));
    return await query.getSingle();
  }

  Future<void> addGenre(String inputGenreName) async {
    await _db.into(_db.genres).insert(GenresCompanion(
        genreName: Value(inputGenreName)
    ));
  }

  Future<void> deleteGenre(int genreId) async {
    await (_db.delete(_db.genres)..where((tbl) => tbl.id.equals(genreId))).go();
  }

  Future<void>updateGenre(int genreId, String newGenreName) async{
    await (_db.update(_db.genres)
      ..where((tbl) => tbl.id.equals(genreId))).write(
      GenresCompanion(
        genreName: Value(newGenreName),
      ),
    );
  }
}