import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: MyColors.background,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: [
                  Text('Book Marker',
                    style: TextStyle(
                        fontSize: 30,
                        color: MyColors.primary
                    ),
                  ),
                  SvgPicture.asset('assets/bookmark.svg', width: 80, height: 80)],
              )
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("設定"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.question_answer_outlined),
            title: Text("問い合わせ"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text("Book Markerについて"),
            onTap: () {
              context.pushNamed('aboutApp');
            },
          )
        ],
      ),
    );
  }
}
