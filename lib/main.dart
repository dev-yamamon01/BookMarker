import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart'; // ← データベースをインポート
import 'package:bookmarker/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//  グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Flutter の初期化を保証
  print("Database is open: ${database.executor.ensureOpen(database)}"); // DBが開かれているかチェック

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,//router.dartで定義している変数
    );
  }
}







