import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import '../services/database.dart';

final checkSubTitleIdUsecaseProvider = Provider<CheckSubTitleIdUsecase>((ref) {
  final db = ref.watch(databaseProvider);
  return CheckSubTitleIdUsecase(ref, db);
});


class CheckSubTitleIdUsecase {
  final Ref ref;
  final AppDatabase _db;

  CheckSubTitleIdUsecase(this.ref, this._db);

  Future<int> execute({required String subTitle}) async {
    //subTitlesに挿入しようとしているサブタイトルがすでにあるか確認
    final existingSubTitle = await (_db.select(_db.subTitles)
      ..where((d) => d.subTitleName.equals(subTitle)))
        .getSingleOrNull();

    if (existingSubTitle != null) {
      // 既存のドメインがある場合、そのIDを取得
      return existingSubTitle.id;
    } else {
      // ドメインがなければ新規追加し、IDを取得
      return await _db.into(_db.subTitles).insert(SubTitlesCompanion(
        subTitleName: Value(subTitle),
      ));
    }
  }
}