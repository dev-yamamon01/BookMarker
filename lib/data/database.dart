import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:bookmarker/data/tables.dart'; // ここでテーブル定義をインポート
import 'package:drift/src/runtime/executor/executor.dart';

part 'database.g.dart';// 「flutter pub run build_runner build --delete-conflicting-outputs」により、テーブル作成コードが自動生成される


@DriftDatabase(tables: [Domains,SubTitles,Genres,Urls])// ここでテーブルを登録
class AppDatabase extends _$AppDatabase {

  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {//SQLiteのデータベースファイルを開く
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bookmaker.sqlite'));
    print("DBが開かれました");
    print(dbFolder.path);
    return NativeDatabase(file);
  });
}
Future<List<Url>?> getUrl(AppDatabase db,int genreId) async{
  final query = db.select(db.urls)..where((tbl) => tbl.id.equals(genreId));

  final result = await query.get();
  return result;
}

Future<void> insertUrl(AppDatabase db, UrlsCompanion url,//フォームからテーブルへそのまま保存されるものはこれに格納
    String? inputDomainName,//idを取得してからテーブル挿入するものは各変数渡す
    String inputSubTitleName) async {

  // トランザクションを使用して処理を一括管理
  await db.transaction(() async {
    // ① domainName がすでに存在するか確認
    final existingDomain = await (db.select(db.domains)
      ..where((d) => d.domainName.equals(inputDomainName ?? "")))
        .getSingleOrNull();

    int domainId;

    if (existingDomain != null) {
      // ② 既存のドメインがある場合、そのIDを取得
      domainId = existingDomain.id;
    } else {
      // ③ ドメインがなければ新規追加し、IDを取得
      domainId = await db.into(db.domains).insert(DomainsCompanion(
        domainName: Value(inputDomainName ?? ""),
      ));
    }

    //subTitlesに挿入しようとしているサブタイトルがすでにあるか確認
    final existingSubTitle = await (db.select(db.subTitles)
      ..where((d) => d.subTitleName.equals(inputSubTitleName)))
        .getSingleOrNull();

    int subTitleId;

    if (existingSubTitle != null) {
      // 既存のドメインがある場合、そのIDを取得
      subTitleId= existingSubTitle.id;
    } else {
      // ドメインがなければ新規追加し、IDを取得
      subTitleId= await db.into(db.subTitles).insert(SubTitlesCompanion(
        subTitleName: Value(inputSubTitleName),
      ));
    }

    // urlsテーブルに取得してきたdomainIdとsubTitleIdを添えて挿入
    await db.into(db.urls).insert(UrlsCompanion(
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