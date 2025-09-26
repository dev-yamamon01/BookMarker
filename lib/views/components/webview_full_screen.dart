import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewFullScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewFullScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        initialSettings: InAppWebViewSettings(
          supportZoom: true,
          useWideViewPort: true,
          loadWithOverviewMode: true,
        ),
      ),
    );
  }
}