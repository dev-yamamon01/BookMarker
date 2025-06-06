import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/url_provider.dart';
import 'package:bookmarker/views/components/my_drawer.dart';
import 'package:bookmarker/views/components/my_tabbar.dart';
import 'package:bookmarker/views/components/my_appbar.dart';
import 'package:bookmarker/views/screens/category_listview_screen.dart';
import 'package:bookmarker/views/screens/category_more_screen.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:bookmarker/views/screens/add_url_screen.dart';

final GlobalKey<MyHomePageState> globalKey = GlobalKey<MyHomePageState>();

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> with TickerProviderStateMixin {//元々はwith SingleTickerProviderStateMixin
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isItemLoaded=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

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
                    return CategoryListView(urls: entry.value.urls ?? []);
                  }).toList(),
                  CategoryMoreScreen(),
                ]

            ),
            floatingActionButton: FloatingActionButton(
              onPressed:(){
                showDialog(context: context, builder: (BuildContext context) {
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
}