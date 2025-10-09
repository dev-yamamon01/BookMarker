import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//入力されたtextが空かどうかを判定するためのprovider
final inputTextProvider = StateProvider<String>((ref) => "");

///各Viewで流用するためのコンポーネント
class MyInputDialog extends ConsumerWidget {
  final TextEditingController textController;
  final String inputTitle;
  final String hintText;
  final String positiveButtonText;
  final String successMessageText;
  final List<TextInputFormatter>? inputFormatters;
  final Future<void> Function() onPressed; // コールバックを受け取る

  const MyInputDialog({super.key,
    required this.textController,
    required this.inputTitle,
    required this.hintText,
    required this.positiveButtonText,
    required this.successMessageText,
    this.inputFormatters,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputText = ref.watch(inputTextProvider);

    return AlertDialog(
      title: Text(inputTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            style: TextStyle(fontSize: 15.sp),
            decoration: InputDecoration(
              hintText: hintText,
            ),
            onChanged: (value){
              //文字が変化したらここで状態(値)を更新する
              ref.read(inputTextProvider.notifier).state = value;
            },
            inputFormatters: inputFormatters,
          ),

        ],
      ),
      actions: [
        TextButton(//キャンセルボタン
          onPressed: () => Navigator.pop(context), // キャンセル
          style: TextButton.styleFrom(foregroundColor: Colors.grey), // ← 文字色
          child: Text("キャンセル",style: TextStyle(fontSize: 15.sp)),
        ),

        TextButton(//更新するボタン
          onPressed: (inputText.isEmpty)
              ? null
              : () async {
                  try {
                    await onPressed();
                    showToast(successMessageText);
                  } catch (e) {
                    showToast('エラー：$e');
                  }
                  Navigator.pop(context);
                },
          style: TextButton.styleFrom(
            foregroundColor: inputText.isEmpty ? Colors.grey : MyColors.primary, // ← 文字色
            side: BorderSide(
                color: inputText.isEmpty? Colors.grey : MyColors.primary, width: 1.w), // ← 枠線
            shape: RoundedRectangleBorder(
              // ← 枠の角を丸く
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), // ← 余白
          ),
          child: Text(positiveButtonText,style: TextStyle(fontSize: 15.sp)),
        ),
      ],
    );
  }
}