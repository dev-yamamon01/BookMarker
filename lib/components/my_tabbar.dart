import 'package:flutter/material.dart';

//AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
//StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
class MyTabBar extends StatelessWidget implements PreferredSizeWidget{
  final TabController tabController;

  const MyTabBar({super.key,required this.tabController});

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
        Tab(icon: Icon(Icons.star), text: "トップ3",height: 60,),
        Tab(text: 'ジャンル1',height: 40,),
        Tab(text: "ジャンル2",height: 40,),
        Tab(text: "ジャンル3",height: 40,),
        Tab(icon: Icon(Icons.more_horiz),height: 40,),
      ],
    );
  }
  //AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
  //StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
