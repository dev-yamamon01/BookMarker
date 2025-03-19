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

//以下のようにDB操作のメソッドを定義
  // Future<List<User>> getAllUsers() => select(users).get();
  // Future<int> insertUser(UsersCompanion user) => into(users).insert(use)
  //
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

Future<void> insertUrl(AppDatabase db,
    String? inputDomainName, String? inputDirectory,int inputGenreId,
    String inputTitle,String inputSubTitleName,int inputEvaluation,
    String inputComment,String inputImageResDir) async {

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
      directory: Value(inputDirectory ?? ""),
      title: Value(inputTitle),
      subTitleId: Value(subTitleId),
      genreId: Value(inputGenreId),
      evaluation: Value(inputEvaluation),
      numOfViews: Value(0),
      comment: Value(inputComment),
      imageResDir: Value(inputImageResDir)
    ));
  });
}