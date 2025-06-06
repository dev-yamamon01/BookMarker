import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/utils/my_colors.dart';

class MyModalBottomSheet extends StatelessWidget {
  final title;
  final urlId;

  const MyModalBottomSheet({super.key,required this.title,required this.urlId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("編集"),
            onTap: () {
              // 編集処理
              print("$urlIdの編集");
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("削除"),
            onTap: () {
              // 削除処理
              print("$urlIdの削除");
            },
          ),
        ],
      ),
    );
  }
}
