import 'package:flutter/material.dart';

class CustomSnackBar {

  static void show(BuildContext context, {
    required String message,
    bool? isError,
    bool? isSuccess,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          (isError != null && isError) ? Icon(//失敗した時のスナックバー
            Icons.error_outline, color: Colors.red,) :
          (isSuccess != null && isSuccess) ? Icon(//成功した時のスナックバー
            Icons.check_circle_outline, color: Colors.green,)
              : Icon(Icons.info_outline),//何でもない時のスナックバー
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}