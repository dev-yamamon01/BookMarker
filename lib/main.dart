import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screens/category_more_screen.dart';
import 'screens/category_listview_screen.dart';
import 'components/my_drawer.dart';
import 'components/my_tabbar.dart';
import 'components/my_appbar.dart';
import 'data/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'data/models/url.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Flutter の初期化を保証
  databaseFactory = databaseFactoryFfi;

  //await DatabaseHelper.getDatabase();  // DB を事前に初期化(これを2回呼んでしまうとDBエラーが発生するので注意)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Maker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Book Maker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Url> urls=[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _loadItems();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // データを追加する
  Future<void> _addItem() async {
    await DatabaseHelper.insertUrl(Url(
        subDomain: 'sampleSubDomain',
        domainId: 2,
        tldId: 3,
        directory: 'sampleDirectory',
        title: 'sampleTitle',
        subTitleId: 4,
        genreId: 5,
        evaluation: 3,
        numOfViews: 150,
        createdAt: DateTime.now().toIso8601String(),
        comment: 'sampleComment',
        imageResDir: 'sampleImageResDir'
    ));
    print("DBへのデータ挿入完了");
    _loadItems();
  }

  // データを読み込む
  Future<void> _loadItems() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      urls = data;
    });
  }


  @override
  Widget build(BuildContext context) {
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
          bottom: MyTabBar(tabController: _tabController),
        ),
        body: TabBarView(
            controller: _tabController, // コントローラーを指定
            children: [
              CategoryListView(urls: urls),
              CategoryListView(urls: urls),
              CategoryListView(urls: urls),
              CategoryListView(urls: urls),
              CategoryMoreScreen(),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: _addItem,
          backgroundColor: Color(0xAACC0000),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}





