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

// ✅ グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();
final GlobalKey<MyHomePageState> globalKey = GlobalKey<MyHomePageState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Flutter の初期化を保証
  //databaseFactory = databaseFactoryFfi;
  print("Database is open: ${database.executor.ensureOpen(database)}"); // DBが開かれているかチェック
  //await DatabaseHelper.getDatabase();  // DB を事前に初期化(これを2回呼んでしまうとDBエラーが発生するので注意)
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,//router.dartで定義している変数
    );
    // return MaterialApp(
    //   title: 'Book Maker',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Book Maker'),
    //   //以下を定義してNavigator.pushNamed(context, '/genreEdit');でcategory_more_screenで試行したがうまくいかない
    //   routes: {
    //     '/genreEdit':(context) => GenreEditScreen()
    //   },
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Url>? genre1Urls,genre2Urls,genre3Urls,top3Urls;
  Map<int,List<Url>?> genreMap={};
  bool isItemLoaded=false;

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 5, vsync: this);//デフォルトは5=(ジャンルx3+more+全ジャンル)
    loadItems();
    //_tabController = TabController(length: 5, vsync: this);//genreMap.length+1をlengthに入れたい
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // データを読み込む
  Future<void> loadItems() async {
    List<Genre> genres = await getGenre();

    genreMap[0]=await getAllUrl();//全てのURLを取得

    for (int i = 1; i <= genres.length; i++) {
      int genreId = genres[i - 1].id;//genresテーブルからgenreIdを取得
      genreMap[genreId] = await getUrl(genreId);//genreIdをKeyとし、Urlsテーブルにあるレコードうち、のgenreIdがkeyと同じものをList型でvalueとする
    }

    print('ジャンルの数は');
    print(genreMap.length);
    print('ジャンルマップの中身は');
    print(genreMap.toString());

      //top3Urls=await getUrl(database, 0);

    //genreMapの数分のTabViewを作成し、CategoryListView(urls: genre1Urls)に動的に代入するようにする
    //   genre1Urls=genreMap[1];
    //   genre2Urls=genreMap[2];
    //   genre3Urls=genreMap[3];

      setState(() {
        //これがないとUI更新されないので注意
        _tabController = TabController(length: genreMap.length+1, vsync: this);
        isItemLoaded = true;
      });

  }


  @override
  Widget build(BuildContext context) {
    if (!isItemLoaded) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: MyColors.primary,)),
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
            //[
              // CategoryListView(urls: genre1Urls),
              // CategoryListView(urls: genre1Urls),
              // CategoryListView(urls: genre2Urls),
              // CategoryListView(urls: genre3Urls),
              //CategoryMoreScreen(),
            //]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            //showInputDialog(context);
            showDialog(context: context, builder: (BuildContext context) {
              return AddUrlScreen(
                onConfirm:() async{
                  await loadItems();//新規でURLを追加したらタイミングでロードするために関数を渡す
                }
              );
              //return AddUrlScreen(); // AddUrlScreen をダイアログとして表示
            },
            );
          },
          backgroundColor: MyColors.secondary,
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}






