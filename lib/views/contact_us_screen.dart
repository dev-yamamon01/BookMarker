import 'package:flutter/material.dart';
import 'package:bookmarker/views/components/webview_full_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewFullScreen(
        url: "https://calico-thumb-69a.notion.site/Book-Marker-27b0d84bc76a805ca46ccd9fa05c227e?source=copy_link",
        title: '問い合わせ');
  }
}