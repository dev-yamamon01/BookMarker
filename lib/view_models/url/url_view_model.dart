import 'package:bookmarker/data/usecase/check_domain_id_usecase.dart';
import 'package:bookmarker/data/usecase/check_sub_title_id_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/data/models/tables.dart';
import 'package:drift/drift.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/views/components/my_snack_bar.dart';

import '../../utils/my_utils.dart';

part 'url_view_model.g.dart';

@riverpod
Future<Url> urlById(UrlByIdRef ref, int id) async {
  final viewModel = ref.read(urlViewModelProvider.notifier);
  return viewModel.getUrlById(urlId: id);
}


@riverpod
class UrlViewModel extends _$UrlViewModel {
  late final AppDatabase _db;

  @override
  Stream<List<Url>?> build(){
    _db=ref.watch(databaseProvider);
    return _db.select(_db.urls).watch();
  }

  Future<Url> getUrlById({required int urlId}) async {
    final _db=ref.watch(databaseProvider);
    final query = _db.select(_db.urls)..where((tbl) => tbl.id.equals(urlId));

    final result = await query.getSingle();
    return result;
  }

  Future<List<Url>> getUrl(int genreId) async{
    final query =_db.select(_db.urls)..where((tbl) => tbl.genreId.equals(genreId));

    final result = await query.get();
    return result;
  }

  Future<void> addUrl(
      UrlsCompanion url, //フォームからテーブルへそのまま保存されるものはこれに格納
      String inputDomainName, //idを取得してからテーブル挿入するものは各変数渡す
      String inputSubTitleName) async {

    try {
      // トランザクションを使用して処理を一括管理
      await _db.transaction(() async {
        final domainId = await ref.read(checkDomainIdUsecaseProvider).execute(
            domainName: inputDomainName);
        final subTitleId = await ref
            .read(checkSubTitleIdUsecaseProvider)
            .execute(subTitle: inputSubTitleName);

        // urlsテーブルに取得してきたdomainIdとsubTitleIdを添えて挿入
        await _db.into(_db.urls).insert(UrlsCompanion(
            domainId: Value(domainId),
            directory: Value(url.directory.value ?? ""),
            title: Value(url.title.value ?? ""),
            subTitleId: Value(subTitleId),
            genreId: Value(url.genreId.value),
            evaluation: Value(url.evaluation.value ?? 0),
            numOfViews: Value(0),
            comment: Value(url.comment.value ?? ""),
            imageResDir: Value(url.imageResDir.value ?? "")
        ));
      });
      showToast('URLを追加しました');
    }catch(e,_){
      showToast('URL追加エラー：$e');
    }

  }

  Future<void> updateUrl(
      int urlId,
      UrlsCompanion url, //フォームからテーブルへそのまま保存されるものはこれに格納
      String inputDomainName, //idを取得してからテーブル挿入するものは各変数渡す
      String inputSubTitleName) async {

    // トランザクションを使用して処理を一括管理
    await _db.transaction(() async {

      final domainId = await ref.read(checkDomainIdUsecaseProvider).execute(domainName:inputDomainName);
      final subTitleId = await ref.read(checkSubTitleIdUsecaseProvider).execute(subTitle: inputSubTitleName);


      // urlsテーブルに取得してきたdomainIdとsubTitleIdを添えて挿入
       await (_db.update(_db.urls)
        ..where((tbl) => tbl.id.equals(urlId))).write(
           UrlsCompanion(
               domainId: Value(domainId),
               directory: Value(url.directory.value ?? ""),
               title: Value(url.title.value ?? ""),
               subTitleId: Value(subTitleId),
               genreId: Value(url.genreId.value),
               evaluation: Value(url.evaluation.value ?? 0),
               numOfViews: Value(0),
               comment: Value(url.comment.value ?? ""),
               imageResDir: Value(url.imageResDir.value ?? "")
           ),
      );

    });

  }

  Future<void> deleteUrl(int id) async {
    try {
      await (_db.delete(_db.urls)..where((tbl) => tbl.id.equals(id))).go();
      showToast("削除しました");
    } catch (e) {
      showToast("エラー：$e");
    }
  }
}

