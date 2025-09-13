import 'dart:io';
import 'dart:ui' as ui;
import 'package:bookmarker/data/usecase/save_screenshot_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS/macOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/main.dart';
import 'package:drift/drift.dart' as drift;
import 'package:permission_handler/permission_handler.dart';
import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';

import '../../utils/url_utils.dart';


//グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();

class AddUrlScreen extends ConsumerStatefulWidget {
  const AddUrlScreen({super.key});

  @override
  ConsumerState<AddUrlScreen> createState() => _AddUrlScreenState();
}

class _AddUrlScreenState extends ConsumerState<AddUrlScreen> {
  InAppWebViewController? _webViewController;

  TextEditingController urlController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  String? url,title,domain,subTitle,dir,comment,selectedGenreName;
  // late String domain;
  int evaluation=0;

  List<String> genreItems = ['genre-1', 'genre-2', 'genre-3']; // 選択肢リスト
  List<Genre?> genres=[];
  Genre? selectedGenre;
  late WebViewController webViewController;
  bool isUrlReachable =false;

  @override
  void initState() {
    super.initState();


      urlController.addListener(() {

        final text = urlController.text;
        domain=UrlUtils.extractDomainAndDir(text).domain;
        dir=UrlUtils.extractDomainAndDir(text).dir;

    });

    _pasteClipboardText();

  }


  //クリップボードにあるテキストを取得してurlControllerのtextとして表示
  Future<void> _pasteClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      setState(() {
        urlController.text = clipboardData.text ?? '';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    urlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = UrlUtils.checkInputUrl(urlController.text);
    final genreState=ref.watch(genreViewModelProvider);

    return AlertDialog(
            title: Text("URLを新規追加"),
            content: //ここに入力フォームを入れる
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                      hintText: "例: https://example.com"),
                  onChanged: (value){
                    if (_webViewController != null && value.isNotEmpty) {
                      _webViewController!.loadUrl(
                        urlRequest: URLRequest(url: WebUri(value.trim())),
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    SizedBox(width: 100, child: Text("ドメイン:"),),
                    Expanded(child: Text(
                        domain ?? ""
                    ))
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 100, child: Text("ジャンル："),),
                    genreState.when(
                        data: (genres){
                          return DropdownButton<Genre>(
                            value: selectedGenre,//選択された値
                            hint: Text("ジャンルを選択"),
                            items: genres?.map((genre) {
                              return DropdownMenuItem<Genre>(
                                value: genre,
                                child: Text(genre.genreName ?? ""),
                              );
                            }).toList(),
                            onChanged:(Genre? _selectedGenre){
                              if(_selectedGenre!=null) {
                                setState(() {
                                  selectedGenre = _selectedGenre;
                                });
                              }}
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (err, stack) => Text('エラー: $err'),

                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 100, child: Text("タイトル:"),),
                    Expanded(child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "タイトルを入力"),
                    ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 100, child: Text("サブタイトル(人物名など):"),),
                    Expanded(child: TextField(
                      controller: subTitleController,
                      decoration: InputDecoration(hintText: "サブタイトルを入力"),
                    ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 100, child: Text("評価:"),),
                    RatingBar.builder(
                      initialRating: 0.0,
                      minRating: 1,
                      itemSize: 20, // 星のサイズ
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5, // 星の数
                      itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      ),
                      onRatingUpdate: (newRating) {
                        setState(() {
                          evaluation = newRating.toInt();
                        });
                      }),
                  ],
                ),
                TextField(
                  controller: commentController,
                  decoration: InputDecoration(hintText: "コメントを追加"),
                ),
        AspectRatio(
          aspectRatio: 16 / 9,
            child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri(urlController.text.trim())),
                initialSettings: InAppWebViewSettings(
                  supportZoom: true, // Android ズーム許可
                  useWideViewPort: true, // ページを縮小して表示可能に
                  loadWithOverviewMode: true, // ページ全体を画面に収める
                ),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                onLoadStop: (controller, uri) {},
              )),
        ],
            )


            ,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // キャンセル
                child: Text("キャンセル"),
              ),
              TextButton(
                onPressed:
                UrlUtils.checkInputUrl(urlController.text) &&
                    selectedGenre!=null ?
                () async {
                  //url = urlController.text;
                    //await _dbHelper.insertUrl(inputUrl); // DBへ登録
                    print("DB登録処理実行");
                    print("----------------------");

                    final saveImagePath=await _captureAndSave();

                    await ref.read(urlViewModelProvider.notifier)
                        .addUrl(
                        UrlsCompanion(
                          directory: drift.Value(dir ?? ""),
                          genreId: drift.Value(selectedGenre!.id),
                          title: drift.Value(titleController.text),
                          evaluation: drift.Value(evaluation),
                          comment: drift.Value(commentController.text),
                          imageResDir: drift.Value(saveImagePath ?? "no-image"),
                        ),
                        domain ?? "",
                        subTitleController.text);

                    Navigator.pop(context); // ダイアログを閉じる


                }:null,
                child: Text("登録"),
              ),
            ],
          );
  }

  Future<String?> _captureAndSave() async {
    try {
      // 権限確認（Android用）
      if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          print("ストレージ権限が拒否されました");
          return null;
        }
      }

      // WebViewのスクリーンショット取得
      final Uint8List? screenshot =
      await _webViewController?.takeScreenshot();

      if (screenshot == null) {
        print("スクリーンショットが取得できませんでした");
        return null;
      }

      return ref.read(saveScreenShotUsecaseProvider).execute(screenshot: screenshot);

    } catch (e) {
      print("_captureAndSave() エラー: $e");
      return null;
    }
  }



}



