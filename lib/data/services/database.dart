import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:bookmarker/data/models/tables.dart'; // ここでテーブル定義をインポート
import 'package:drift/src/runtime/executor/executor.dart';

part 'database.g.dart';// 「flutter pub run build_runner build --delete-conflicting-outputs」により、テーブル作成コードが自動生成される


@DriftDatabase(tables: [Domains,SubTitles,Genres,Urls])// ここでテーブルを登録
class AppDatabase extends _$AppDatabase {

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //以下でジャンルテーブルのseederを設定する
  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();

          // 🎯 Seederのような初期データをここで挿入！
          await into(genres).insert(GenresCompanion(
            genreName: Value('ジャンル1'),
          ));
          await into(genres).insert(GenresCompanion(
            genreName: Value('ジャンル2'),
          ));
          await into(genres).insert(GenresCompanion(
            genreName: Value('ジャンル3'),
          ));
        },
      );

}

LazyDatabase _openConnection() {
  //SQLiteのデータベースファイルを開く
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bookmaker.sqlite'));
    print("DB Opened");
    print(dbFolder.path);
    return NativeDatabase(file);
  });
}