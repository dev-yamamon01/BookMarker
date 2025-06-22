import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/data/models/tables.dart';
import 'package:drift/drift.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';

part 'url_view_model.g.dart';

@riverpod
class UrlViewModel extends _$UrlViewModel {
  late final AppDatabase _db;

  @override
  Stream<List<Url>?> build(){
    _db=ref.watch(databaseProvider);
    return _db.select(_db.urls).watch();
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

    // トランザクションを使用して処理を一括管理
    await _db.transaction(() async {
      // ① domainName がすでに存在するか確認
      final domainId=await ref.read(domainViewModelProvider.notifier)
          .checkExistDomain(inputDomainName)
      //②　domainName がない場合は新たに追加する
          //TODO:下記のinsertは何が返ってくる？？理想は追加したドメインidを代入したいんだけど
      ?? await _db.into(_db.domains).insert(DomainsCompanion(
          domainName: Value(inputDomainName ?? ""),
        ));


      //subTitlesに挿入しようとしているサブタイトルがすでにあるか確認
      final existingSubTitle = await (_db.select(_db.subTitles)
        ..where((d) => d.subTitleName.equals(inputSubTitleName)))
          .getSingleOrNull();

      int subTitleId;

      if (existingSubTitle != null) {
        // 既存のドメインがある場合、そのIDを取得
        subTitleId = existingSubTitle.id;
      } else {
        // ドメインがなければ新規追加し、IDを取得
        subTitleId = await _db.into(_db.subTitles).insert(SubTitlesCompanion(
          subTitleName: Value(inputSubTitleName),
        ));
      }

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

  }

  Future<void> deleteUrl(int id) async {
    await (_db.delete(_db.urls)
      ..where((tbl) => tbl.id.equals(id))).go();
  }

}