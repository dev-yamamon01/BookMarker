import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:bookmarker/data/models/url.dart';

// データベース管理クラス
class DatabaseHelper {
  static Database? _database;

  // データベースを取得するメソッド
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    print('DB初期化完了');

    checkDatabaseExists(_database?.path);
    checkTables(_database?.path);

    return _database!;
  }

  static Future<void> checkDatabaseExists(String? path) async {

    if(path==null){return;}

    // データベースが存在するか確認
    var exists = await databaseExists(path);
    if (exists) {
      print(path);
      print("にデータベースは正常に作成されています！");
    } else {
      print(path);
      print("データベースが存在しません！");
    }
  }

  static Future<void> checkTables(String? path) async {
    if(path==null){return;}

    var db = await openDatabase(path);

    // データベース内のすべてのテーブル名を取得
    List<Map<String, dynamic>> tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type="table"');

    if (tables.isEmpty) {
      print("テーブルが作成されていません！");
    } else {
      print("作成されているテーブル:");
      tables.forEach((table) {
        print(table['name']);
      });
    }

    await db.close();
  }

  static Future<String> createdbPath() async{
    Directory directory= await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'bookmaker.db');

    // ディレクトリが存在しない場合は作成
    final directoryPath = dirname(path);
    if (!await Directory(directoryPath).exists()) {
    await Directory(directoryPath).create(recursive: true);
    }

    return path;
  }

  // データベース初期化
  static Future<Database> _initDatabase() async {

    final path=await createdbPath();

    print(path);
    print('にテーブルを作成します');

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async{//onCreateはDBがすでに作成されている場合は呼ばれない
          try {
            var batch = db.batch();//batchを用いて複数のSQL文を実行する

            //domainsテーブルの作成
            batch.execute('''
          CREATE TABLE IF NOT EXISTS domains(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            domain_name TEXT NOT NULL
          );
        ''');

          //tldsテーブルの作成
          batch.execute('''
              CREATE TABLE IF NOT EXISTS tlds(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
                tld_name TEXT NOT NULL
              );
            ''');

            //subtitlesテーブルの作成
            batch.execute('''
        CREATE TABLE IF NOT EXISTS subtitles(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          subtitle_name TEXT NOT NULL
        );
      '''
            );

            //genresテーブルの作成
            batch.execute('''
        CREATE TABLE IF NOT EXISTS genres(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          genre_name TEXT NOT NULL
        );
      '''
            );

            //urlsテーブルの作成
            batch.execute('''
          CREATE TABLE IF NOT EXISTS urls(
            id INTEGER PRIMARY KEY,
            sub_domain TEXT,
            domain_id INTEGER NOT NULL,
            tld_id INTEGER NOT NULL,
            directory TEXT,
            title TEXT,
            sub_title_id INTEGER,
            genre_id INTEGER,
            evaluation INTEGER,
            num_of_views INTEGER NOT NULL,
            created_at TEXT NOT NULL,
            comment TEXT,
            image_res_dir TEXT,
            FOREIGN KEY (domain_id) REFERENCES domains(id),
            FOREIGN KEY (tld_id) REFERENCES tlds(id),
            FOREIGN KEY (sub_title_id) REFERENCES subtitles(id),
            FOREIGN KEY (genre_id) REFERENCES genres(id)
        );
        ''');

            // FOREIGN KEY 制約を有効にする
            batch.execute('PRAGMA foreign_keys = ON;');

          await batch.commit();

            print("テーブル作成成功");
          } catch (e) {
            print("テーブル作成エラー: $e");
          }
        },
        onOpen: (db) async {
          print("データベースが開かれました。");
        },
      );


  }

  // データ挿入
  static Future<void> insertUrl(Url url) async {
    final db = await getDatabase();
    print('データを挿入します');
    await db.insert(
      'urls',//テーブル名
      url.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // データ取得
  static Future<List<Url>> getItems() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('urls');

    return List.generate(maps.length, (i) {
      return Url.fromJson(maps[i]);
    });
  }

  //テーブルのデータを全削除
  Future<void> deleteAllItems() async {
    final db = await getDatabase();
    await db.delete('urls'); // DELETE FROM items
  }

}

