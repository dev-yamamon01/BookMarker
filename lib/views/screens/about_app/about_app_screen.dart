import 'package:flutter/material.dart';
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
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item['title']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.pushNamed(item['routeName']!);
            },
          );
        },
      ),
    );
  }
}