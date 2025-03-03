import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/main.dart';
import 'package:bookmarker/data/database_helper.dart';

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
    );
  }

  void OnMenu(){
    print("menu-button pressed");
    scaffoldKey.currentState?.openDrawer();
  }

  void OnSecret(){
    DatabaseHelper dbHelper=new DatabaseHelper();
    dbHelper.deleteAllItems();
  }
}
