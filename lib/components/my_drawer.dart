import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xAAFFFFFF),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: [
                  Text('Book Maker',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFCC0000)
                    ),
                  ),
                  SvgPicture.asset('assets/bookmark.svg', width: 80, height: 80)],
              )
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("アカウント"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("設定"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.menu_book_sharp),
            title: Text("チュートリアル"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.question_answer_outlined),
            title: Text("問い合わせ"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text("Book Makerについて"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
