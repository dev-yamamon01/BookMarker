import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// データモデル
class Item {
  final int? id;
  final String name;

  Item({this.id, required this.name});

  // Map に変換（データベース保存用）
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  // Map から Item インスタンスを生成
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(id: map['id'], name: map['name']);
  }
}

// データベース管理クラス
class DatabaseHelper {
  static Database? _database;

  // データベースを取得するメソッド
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<String> createdbPath() async{
    Directory directory= await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'example.db');

    // ディレクトリが存在しない場合は作成
    final directoryPath = dirname(path);
    if (!await Directory(directoryPath).exists()) {
    await Directory(directoryPath).create(recursive: true);
    }
    return path;
  }

  // データベース初期化
  static Future<Database> _initDatabase() async {
    // final dbPath = await getDatabasesPath();
    // final path = join(dbPath, 'example.db');

    final path=await createdbPath();

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
        );
      },
    );
  }

  // データ挿入
  static Future<void> insertItem(Item item) async {
    final db = await getDatabase();
    await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // データ取得
  static Future<List<Item>> getItems() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('items');

    return List.generate(maps.length, (i) {
      return Item.fromMap(maps[i]);
    });
  }

  //テーブルのデータを全削除
  Future<void> deleteAllItems() async {
    final db = await getDatabase();
    await db.delete('items'); // DELETE FROM items
  }

}

