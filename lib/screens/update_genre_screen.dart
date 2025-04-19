import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bookmarker/data/database.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';

class UpdateGenreScreen extends StatefulWidget {
  const UpdateGenreScreen({super.key,required this.genre});
  final Genre genre;

  @override
  State<UpdateGenreScreen> createState() => _UpdateGenreScreenState();
}

class _UpdateGenreScreenState extends State<UpdateGenreScreen> {
  TextEditingController genreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    genreController = TextEditingController(text: widget.genre.genreName); // ← ここOK！
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("ジャンル名を編集"),
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
            await updateGenre(widget.genre.id, genreController.text);
            showToastMessage(context, '更新しました');
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: MyColors.primary, // ← 文字色
            side: BorderSide(color: MyColors.primary, width: 1), // ← 枠線
            shape: RoundedRectangleBorder(
              // ← 枠の角を丸く
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ← 余白
          ),
          child: Text("更新する"),
        ),
      ],
    );
  }
}
