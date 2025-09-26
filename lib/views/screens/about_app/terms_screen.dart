import 'package:flutter/material.dart';
import 'package:bookmarker/views/components/webview_full_screen.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewFullScreen(
      url: 'https://calico-thumb-69a.notion.site/27a0d84bc76a80aab453d50641089ded?source=copy_link',
      title: '利用規約',
    );
  }
}