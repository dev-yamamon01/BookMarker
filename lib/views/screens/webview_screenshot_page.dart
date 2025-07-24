import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;

class WebViewScreenshotPage extends StatefulWidget {
  final String url;
  const WebViewScreenshotPage({required this.url});

  @override
  _WebViewScreenshotPageState createState() => _WebViewScreenshotPageState();
}

class _WebViewScreenshotPageState extends State<WebViewScreenshotPage> {
  InAppWebViewController? _webViewController;
  Uint8List? croppedImage;

  final cropAspectRatio = 16 / 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("16:9スクリーンショット")),
      body: Stack(
        children: [
          Positioned.fill(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: WebUri(widget.url)),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
          // 切り取り枠とオーバーレイ
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final cropHeight = screenWidth / cropAspectRatio;
              final verticalPadding = 0.0;

              return IgnorePointer(
                  ignoring: true,
                  child:
                Stack(
                children: [
                  // 下のグレー
                  Positioned(
                    top: cropHeight,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(color: Colors.black.withOpacity(0.4)),
                  ),
                  // 透明な16:9枠（ガイドライン）
                  Positioned(
                    top: verticalPadding,
                    left: 0,
                    right: 0,
                    height: cropHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2),
                      ),
                    ),
                  ),
                ],
              )
              );
            },
          ),
          // スクリーンショットボタン
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              child: Icon(Icons.camera_alt),
              onPressed: () async{
               croppedImage = await _takeScreenshotAndCrop();
               context.pop(croppedImage); // croppedImage: Uint8List
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: croppedImage != null
      //     ? SizedBox(
      //   height: 200,
      //   child: Image.memory(croppedImage!),//ここに撮影した静止画を表示
      // )
      //     : null,
    );
  }

  Future<Uint8List?> _takeScreenshotAndCrop() async {
    if (_webViewController == null) return null;

    final screenshot = await _webViewController!.takeScreenshot();
    if (screenshot == null) return null;

    final original = img.decodeImage(screenshot);
    if (original == null) return null;

    // デバイスの画面サイズ取得
    final renderBox = context.findRenderObject() as RenderBox;
    final screenWidth = renderBox.size.width.toInt();
    final screenHeight = renderBox.size.height.toInt();

    final cropHeight = (screenWidth / cropAspectRatio).toInt();
    final verticalOffset = 0;

    // 画像サイズと一致するようスケール調整
    final scaleX = original.width / screenWidth;
    final scaleY = original.height / screenHeight;

    final cropRect = img.copyCrop(
      original,
      x: 0,
      y: (verticalOffset * scaleY).toInt(),
      width: original.width,
      height: (cropHeight * scaleY).toInt(),
    );

    return Uint8List.fromList(img.encodePng(cropRect));
    // setState(() {
    //   croppedImage = Uint8List.fromList(img.encodePng(cropRect));
    // });
  }
}