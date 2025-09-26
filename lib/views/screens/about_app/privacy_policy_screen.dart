import 'package:flutter/material.dart';
import 'package:bookmarker/views/components/webview_full_screen.dart';

// privacy_policy_screen.dart
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewFullScreen(
      url: 'https://calico-thumb-69a.notion.site/27a0d84bc76a807092c2e9d7c38c6981?source=copy_link',
      title: 'プライバシーポリシー',
    );
  }
}