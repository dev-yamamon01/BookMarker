import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screens/category_more_screen.dart';
import 'screens/category_listview_screen.dart';
import 'components/my_drawer.dart';
import 'components/my_tabbar.dart';
import 'components/my_appbar.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:bookmarker/screens/add_url_screen.dart';
import 'package:bookmarker/data/database.dart'; // ← データベースをインポート
import 'package:bookmarker/data/models/tables.dart';
import 'package:bookmarker/screens/genre_edit_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/router.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/providers/url_provider.dart';

// ✅ グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();
final GlobalKey<MyHomePageState> globalKey = GlobalKey<MyHomePageState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Flutter の初期化を保証
  print("Database is open: ${database.executor.ensureOpen(database)}"); // DBが開かれているかチェック

  // runApp(const MyApp());
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,//router.dartで定義している変数
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> with TickerProviderStateMixin {//元々はwith SingleTickerProviderStateMixin
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Url>? genre1Urls,genre2Urls,genre3Urls,top3Urls;
  Map<int,List<Url>?> genreMap={};
  bool isItemLoaded=false;

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 5, vsync: this);//デフォルト
    //loadItems();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // データを読み込む
  // Future<void> loadItems() async {
  //
  //   List<Genre> genres = await getGenre();
  //
  //   genreMap[0]=await getAllUrl();//全てのURLを取得
  //
  //   for (int i = 1; i <= genres.length; i++) {
  //     int genreId = genres[i - 1].id;//genresテーブルからgenreIdを取得
  //     genreMap[genreId] = await getUrl(genreId);//genreIdをKeyとし、Urlsテーブルにあるレコードうち、のgenreIdがkeyと同じものをList型でvalueとする
  //   }
  //
  //     setState(() {
  //       //これがないとUI更新されないので注意
  //       _tabController = TabController(length: genreMap.length+1, vsync: this);//lenghtのデフォルトは5=(ジャンルx3+more+全ジャンル)
  //       isItemLoaded = true;
  //     });
  //
  // }

  @override
  Widget build(BuildContext context) {
    final genreMapAsync = ref.watch(urlMapProvider);

    return genreMapAsync.when(
      data: (genreMap) {
        final tabCount = genreMap.length + 1;

        // // TabControllerが未初期化、またはジャンル数が変わったら再作成
        if (_tabController == null || _tabController!.length != tabCount) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _tabController?.dispose();
            setState(() {
              _tabController = TabController(length: tabCount, vsync: this);
            });
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }


        return MaterialApp(
          home: Scaffold(
            key: _scaffoldKey,//Keyを設定すると別のファイルからscaffoldの状態を取得・操作できる
            drawer: MyDrawer(),
            appBar: AppBar(
              automaticallyImplyLeading: false, // デフォルトのハンバーガーメニューを削除
              title: MyAppbar(
                widgetTitle: widget.title,
                scaffoldKey: _scaffoldKey,
              ),
              bottom: MyTabBar(tabController: _tabController,genreMap: genreMap,),
            ),
            body: TabBarView(
                controller: _tabController, // コントローラーを指定
                children:[
                  ...genreMap.entries.map((entry) {
                    return CategoryListView(urls: entry.value ?? []);
                  }).toList(),
                  CategoryMoreScreen(),
                ]

            ),
            floatingActionButton: FloatingActionButton(
              onPressed:(){
                //showInputDialog(context);
                showDialog(context: context, builder: (BuildContext context) {
                  // return AddUrlScreen(
                  //     onConfirm:() async{
                  //       await loadItems();//新規でURLを追加したらタイミングでロードするために関数を渡す
                  //     }
                  // );
                  return AddUrlScreen();
                },
                );
              },
              backgroundColor: MyColors.secondary,
              child: Icon(Icons.add,color: Colors.white,),
            ),
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text("エラー: $e")),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   if (!isItemLoaded) {
  //     return Scaffold(
  //       body: Center(child: CircularProgressIndicator(color: MyColors.primary,)),
  //     );
  //   }
  //   return MaterialApp(
  //     home: Scaffold(
  //       key: _scaffoldKey,//Keyを設定すると別のファイルからscaffoldの状態を取得・操作できる
  //       drawer: MyDrawer(),
  //       appBar: AppBar(
  //         automaticallyImplyLeading: false, // デフォルトのハンバーガーメニューを削除
  //         title: MyAppbar(
  //           widgetTitle: widget.title,
  //           scaffoldKey: _scaffoldKey,
  //         ),
  //         bottom: MyTabBar(tabController: _tabController,genreMap: genreMap,),
  //       ),
  //       body: TabBarView(
  //           controller: _tabController, // コントローラーを指定
  //           children:[
  //           ...genreMap.entries.map((entry) {
  //             return CategoryListView(urls: entry.value ?? []);
  //           }).toList(),
  //             CategoryMoreScreen(),
  //           ]
  //
  //       ),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed:(){
  //           //showInputDialog(context);
  //           showDialog(context: context, builder: (BuildContext context) {
  //             return AddUrlScreen(
  //               onConfirm:() async{
  //                 await loadItems();//新規でURLを追加したらタイミングでロードするために関数を渡す
  //               }
  //             );
  //           },
  //           );
  //         },
  //         backgroundColor: MyColors.secondary,
  //         child: Icon(Icons.add,color: Colors.white,),
  //       ),
  //     ),
  //   );
  // }
}






