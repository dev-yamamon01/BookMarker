import 'package:bookmarker/router.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          Text(title, style: TextStyle(fontSize: 18.sp)),
          ListTile(
            leading: Icon(Icons.edit,size: 20.sp,),
            title: Text("編集",style: TextStyle(fontSize: 15.sp)),
            onTap: () {
              // 編集処理
              print("$urlIdの編集");
              context.push('${AppRoutes.editUrl}/$urlId');
            },
          ),
          ListTile(
            leading: Icon(Icons.delete,size: 20.sp,),
            title: Text("削除",style: TextStyle(fontSize: 15.sp)),
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
