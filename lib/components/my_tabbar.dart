import 'package:flutter/material.dart';
import 'package:bookmarker/data/database.dart';

//AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
//StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
class MyTabBar extends StatelessWidget implements PreferredSizeWidget{
  final TabController tabController;
  final Map<int,List<Url>?> genreMap;

  const MyTabBar({super.key,required this.tabController,required this.genreMap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController, // カスタムコントローラーを指定
      overlayColor: MaterialStateProperty.all(Colors.transparent), // リップルエフェクトを非表示
      indicator: BoxDecoration(
        color: Colors.grey.withOpacity(0.1), // 背景色（タブの背景全体に適用）
        border: Border(
          bottom: BorderSide(color: Color(0xFFCC0000), width: 4), // 下線のカスタマイズ
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab, // ラベルのサイズに合わせたインジケーター,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xFFCC0000),

      ),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      tabs: [
        ...genreMap.entries.map((entry) {
          return Tab(text: entry.key.toString() ?? "",height: 40,);
        }).toList(),
        Tab(icon: Icon(Icons.more_horiz),height: 40,),
      ],
    );
  }
  //AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
  //StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
