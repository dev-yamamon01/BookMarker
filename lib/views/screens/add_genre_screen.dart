import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddGenreScreen extends ConsumerStatefulWidget {
  const AddGenreScreen({super.key,required this.parentContext});
  final BuildContext parentContext;

  @override
  ConsumerState<AddGenreScreen> createState() => _AddGenreScreenState();
}

class _AddGenreScreenState extends ConsumerState<AddGenreScreen> {
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

            //await insertGenre(genreController.text);
            try {
              await ref.read(genreViewModelProvider.notifier).addGenre(
                  genreController.text);
              showToast('追加しました');
            }catch(e){
              showToast('エラー：$e');
            }
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
          child: Text("追加する"),
        ),
      ],
    );
  }
}
