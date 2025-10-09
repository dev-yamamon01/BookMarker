import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'OSSライセンス',
        'routeName': 'ossLicenses',
      },
      {
        'title': '利用規約',
        'routeName': 'terms',
      },
      {
        'title': 'プライバシーポリシー',
        'routeName': 'privacyPolicy',
      },
      {
        'title': 'バージョン確認',
        'routeName': 'versionConfirm',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('このアプリについて')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(height: 1.h),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item['title']!,style: TextStyle(fontSize: 15.sp),),
            trailing: Icon(Icons.chevron_right,size: 20.sp,),
            onTap: () {
              context.pushNamed(item['routeName']!);
            },
          );
        },
      ),
    );
  }
}