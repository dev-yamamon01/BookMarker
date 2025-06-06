import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/main.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:bookmarker/utils/my_colors.dart';


class MyAppbar extends StatelessWidget {
  final String widgetTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyAppbar({super.key,required this.widgetTitle,required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              widgetTitle,
              style: TextStyle(color: MyColors.primary
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
    );
  }

  void OnMenu(){
    print("menu-button pressed");
    scaffoldKey.currentState?.openDrawer();
  }

  void OnSecret() async{
    await resetDatabase();
  }

  Future<void> resetDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dbFolder.path, 'bookmaker.sqlite')); // 実際のファイルのパスを取得
    if (await dbFile.exists()) {
      await dbFile.delete(); // ファイル削除でリセット完了！
      print('-------DBリセット完了-------');
    }
  }

}
