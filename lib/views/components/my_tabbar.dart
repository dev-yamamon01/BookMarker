import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:bookmarker/data/models/urls_by_genre_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
//StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
class MyTabBar extends StatelessWidget implements PreferredSizeWidget{
  final TabController? tabController;
  final Map<int,UrlsByGenreName?> genreMap;

  const MyTabBar({super.key,required this.tabController,required this.genreMap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.symmetric(horizontal: 1.w),
      controller: tabController, // カスタムコントローラーを指定
      overlayColor: MaterialStateProperty.all(Colors.transparent), // リップルエフェクトを非表示
      indicator: BoxDecoration(
        color: Colors.grey.withOpacity(0.1), // 背景色（タブの背景全体に適用）
        border: Border(
          bottom: BorderSide(color: MyColors.primary, width: 4.w), // 下線のカスタマイズ
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab, // ラベルのサイズに合わせたインジケーター,
      labelStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: MyColors.primary,

      ),
      unselectedLabelStyle: TextStyle(fontSize: 8.sp),
      tabs: [
        ...genreMap.entries.map((entry) {
          return Tab(
            text: entry.value?.name ?? "",
            height: 40.h,
          );//ここでジャンル名を表示
        }).toList(),
        Tab(icon: Icon(Icons.more_horiz,size: 20.sp,),height: 40.h,),
      ],
    );
  }
  //AppBarには高さの制限があるため、TabBarは高さを自動的に決める必要があるが
  //StatelessWidgetはサイズの情報をも持たないのでkToolbarHeight(AppBarの高さ)を伝える
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
