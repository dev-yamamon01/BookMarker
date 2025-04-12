import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bookmarker/data/database.dart';
import 'package:bookmarker/utils/my_utils.dart';

class AddGenreScreen extends StatefulWidget {
  const AddGenreScreen({super.key,required this.parentContext});
  final BuildContext parentContext;

  @override
  State<AddGenreScreen> createState() => _AddGenreScreenState();
}

class _AddGenreScreenState extends State<AddGenreScreen> {
  TextEditingController genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ジャンルを追加"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: genreController,
            decoration: InputDecoration(
              hintText: "例: ジャンルAAA",
            ),
          ),

        ],
      ),
      actions: [
        TextButton(//キャンセルボタン
          onPressed: () => Navigator.pop(context), // キャンセル
          style: TextButton.styleFrom(foregroundColor: Colors.grey), // ← 文字色
          child: Text("キャンセル"),
        ),

        TextButton(//更新するボタン
          onPressed: () async{

            await insertGenre(genreController.text);
            showToastMessage(widget.parentContext ,'追加しました');
            Navigator.pop(context);

          },
          style: TextButton.styleFrom(
            foregroundColor: Color(0xFFCC0000), // ← 文字色
            side: BorderSide(color: Color(0xFFCC0000), width: 1), // ← 枠線
            shape: RoundedRectangleBorder(
              // ← 枠の角を丸く
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ← 余白
          ),
          child: Text("追加する"),
        ),
      ],
    );
  }
}
