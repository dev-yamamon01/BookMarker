import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart'; // ← データベースをインポート
import 'package:bookmarker/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//  グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Flutter の初期化を保証
  print("Database is open: ${database.executor.ensureOpen(database)}"); // DBが開かれているかチェック

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), //iPhone16を基準にする
      minTextAdapt: true, //小さい画面でのフォントサイズの下限値を決めて可読性を向上
      splitScreenMode: true, //画面分割で使用される際はデバイスのスクリーンサイズではなく実際のウィンドウサイズで調整する
      builder: (context, child){
        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: router,//router.dartで定義している変数
        );
      },
    );
  }
}







