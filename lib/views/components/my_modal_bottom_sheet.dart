import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyModalBottomSheet extends ConsumerWidget {
  final title;
  final urlId;

  const MyModalBottomSheet({super.key,required this.title,required this.urlId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onTap: (){
              // 削除処理
              ref.read(urlViewModelProvider.notifier).deleteUrl(urlId);
            },
          ),
        ],
      ),
    );
  }
}
