import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screens/category_more_screen.dart';
import 'screens/category_listview_screen.dart';
import 'components/my_tabbar.dart';

void main() {
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer( // 🔹 `Drawer` の設定
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
              ),
            ],
          ),
        ),
          appBar: AppBar(
            automaticallyImplyLeading: false, // デフォルトのハンバーガーメニューを削除
            title: Center(
              child: Row(
                children: [
                  // IconButton(onPressed: (){}, icon: Icons.menu,color: Color(0xFFCC0000),),
                  IconButton(
                    onPressed: OnMenu,
                    icon:
                    SvgPicture.asset('assets/menu.svg', width: 30, height: 30),
                  ),
                  Row(children: [
                    SvgPicture.asset(
                        'assets/bookmark.svg', width: 30, height: 30),
                    Text('  '),
                    Text(
                      widget.title,
                      style: TextStyle(color: Color(0xFFCC0000) //AARRGGBB形式のHex
                      ),
                    )
                  ]),
                  IconButton(
                      onPressed: OnSecret,
                      icon:
                      SvgPicture.asset('assets/key.svg', width: 30, height: 30))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            bottom: MyTabBar(tabController: _tabController),
          ),
            body: TabBarView(
            controller: _tabController, // コントローラーを指定
            children: [
              CategoryListView(items: ["item-T1", "item-T2", "item-T3"]),
              CategoryListView(items: ["item-J1-1", "item-J1-2", "item-J1-3"]),
              CategoryListView(items: ["item-J2-1", "item-J2-2", "item-J2-3"]),
              CategoryListView(items: ["item-J3-1", "item-J3-2", "item-J3-3"]),
              CategoryMoreScreen(),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xAACC0000),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }

  void OnMenu(){
    print("menu-button pressed");
    _scaffoldKey.currentState?.openDrawer();
  }

  void OnSecret(){
    print("secret-button pressed");
  }

}





