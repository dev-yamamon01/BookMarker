import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:drift/drift.dart';

part 'subtitle_view_model.g.dart';

@riverpod
Future<String?> subtitleName(SubtitleNameRef ref, int id) async {
  final viewModel = ref.read(subtitleViewModelProvider.notifier);
  return viewModel.getSubtitleName(subtitleId: id);
}

@riverpod
class SubtitleViewModel extends _$SubtitleViewModel {
  late final AppDatabase _db;

  @override
  Future<List<Subtitle>?> build() async {
    _db = ref.read(databaseProvider);
    return ref.watch(databaseProvider)
        .select(_db.subTitles)
        .get(); //テーブルすべてのデータを状態監視
  }


  Future<String?> getSubtitleName({required int subtitleId}) async {
    final query = _db.select(_db.subTitles)
      ..where((tbl) => tbl.id.equals(subtitleId));
    final result = await query.getSingle();

    return result.subTitleName;
  }
}