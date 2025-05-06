import 'package:flutter/material.dart';
import 'package:bookmarker/main.dart';
import 'package:bookmarker/utils/my_colors.dart';

void showToastMessage(BuildContext context, String message) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          message,
      style: TextStyle(
          color: MyColors.primary,
      ),),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

void showDeleteDialog(BuildContext context,String title ,String message ,VoidCallback onYes) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
          title,
        style: TextStyle(
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // No
          child: Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // ダイアログを閉じる
            onYes(); // YESの処理を実行！
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // ← 文字色
            backgroundColor: MyColors.primary,
            side: BorderSide(color: MyColors.primary, width: 1), // ← 枠線
            shape: RoundedRectangleBorder(
              // ← 枠の角を丸く
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ← 余白
          ),
          child: Text('削除する'),
        ),
      ],
    ),
  );
}

//必ずユニークになるタイムスタンプを返す。例(20250504T173510115282)
String getTimeStamp(){
  return DateTime.now().toIso8601String().replaceAll(":", "").replaceAll(".", "");
}