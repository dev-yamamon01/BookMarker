import 'dart:io';
import 'dart:ui' as ui;

import 'package:bookmarker/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS/macOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:bookmarker/data/database.dart';
import 'package:bookmarker/main.dart';
import 'package:drift/drift.dart' as drift;

import 'package:permission_handler/permission_handler.dart';

//グローバルにデータベースインスタンスを作成
final AppDatabase database = AppDatabase();

class AddUrlScreen extends StatefulWidget {
  const AddUrlScreen({super.key});

  @override
  State<AddUrlScreen> createState() => _AddUrlScreenState();
}

class _AddUrlScreenState extends State<AddUrlScreen> {

  final GlobalKey _globalKey = GlobalKey();

  TextEditingController urlController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  String? url,domain,title,subTitle,dir,comment,selectedGenreName;
  int evaluation=0;

  List<String> genreItems = ['genre-1', 'genre-2', 'genre-3']; // 選択肢リスト
  List<Genre?> genres=[];
  Genre? selectedGenre;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    //url = "https://qiita.com/allJokin/items/35a486c82815e0070f34";
    //WebViewPlatform=SurfaceAndroidWebView();
    //webViewController = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onHttpError: (HttpResponseError error) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('https://flutter.dev'));
      // ..setNavigationDelegate(NavigationDelegate(
      //   onPageStarted: (String url) {
      //     print("ページ読み込み開始: $url");
      //   },
      //   onPageFinished: (String url) {
      //     print("ページ読み込み完了: $url");
      //   },
      // ))
      // ..loadRequest(Uri.parse(inputUrl));

    loadGenre();

    //selectedGenre=genreItems.first;//ドロップダウンのデフォルト値をここで設定
      urlController.addListener(() {
        // TextFieldの文字が変わったタイミングでWebViewを再読み込み
        //webViewController.reload(); // reload メソッドを呼び出す

        setState(() {
          url=urlController.text;
          domain=extractDomainAndDir(urlController.text).domain;
          dir=extractDomainAndDir(urlController.text).dir;
          //domainText=urlController.text;
        });

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

  Future<void>loadGenre()async{
    genres=await getGenre();
    setState(() {
      selectedGenreName=genres?.first?.genreName ?? "";//ドロップダウンのデフォルト値をここで設定
    });

  }

  @override
  void dispose() {
    super.dispose();
    urlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = checkInputUrl(urlController.text);

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
                    Expanded(child: DropdownButton<Genre>(
                      value: selectedGenre,//選択された値
                        hint: Text("ジャンルを選択"),
                        items: genres.map((genre) {
                          return DropdownMenuItem<Genre>(
                            value: genre,
                            child: Text(genre?.genreName ?? ""),
                          );
                        }).toList(),
                        onChanged:(Genre? _selectedGenre){
                        setState(() {
                          //選択された値を保存する変数
                          if(_selectedGenre!=null) {
                            selectedGenre = _selectedGenre;
                          }
                        });
                        }
                    ))
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
                 Expanded(
              //child: Image.network('https://salop.co.jp/wp-content/uploads/2021/04/flutter-logo-sharing.png'),
              child: isValidUrl
                  ?
              RepaintBoundary(
                  key: _globalKey,
                  child: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..loadRequest(Uri.parse(urlController.text)), // URL読み込み
                    )
              )
                  : Center(
                      child: Text("無効なURLです"),
                    ),
            ),
        ],
            )


            ,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // キャンセル
                child: Text("キャンセル"),
              ),
              TextButton(
                onPressed:checkInputUrl(urlController.text)
                ?() async {
                  //url = urlController.text;
                    //await _dbHelper.insertUrl(inputUrl); // DBへ登録
                    print("DB登録処理実行");
                    print("----------------------");

                    final saveImagePath=await _captureAndSave();

                    insertUrl(
                        UrlsCompanion(
                          directory: drift.Value(dir ?? ""),
                          genreId: drift.Value(selectedGenre!.id),
                          title: drift.Value(titleController.text),
                          evaluation: drift.Value(evaluation),
                          comment: drift.Value(commentController.text),
                          imageResDir: drift.Value(saveImagePath ?? "no-image"),
                        ),
                        domain,subTitleController.text);

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

      // Flutterウィジェットを画像として取得
      final context = _globalKey.currentContext;
      if (context == null) {
        print("contextが取得できませんでした");
        return null;
      }

      final renderObject = context.findRenderObject();
      if (renderObject is! RenderRepaintBoundary) {
        print("RenderObjectがRepaintBoundaryではありません");
        return null;
      }

      final boundary = renderObject;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        print("画像のバイト変換に失敗しました");
        return null;
      }

      final pngBytes = byteData.buffer.asUint8List();

      // 内部ストレージへ保存
      final baseDir = await getApplicationDocumentsDirectory();
      final targetDir = Directory('${baseDir.path}/webview_captures');//ここで任意のフォルダを作成
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
      final timestamp=getTimeStamp();
      final filePath = '${targetDir.path}/$timestamp.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      print("保存完了: $filePath");
      return filePath;
    } catch (e) {
      print("保存エラー: $e");
      return null;
    }
  }

  //与えられたURLからドメイン部を抜き出す関数
 DevidedUrl extractDomainAndDir(String url){
    List<String> devided=url.split("/");//「/」で配列分け
    //以下のRangeErrorの分岐処理
    if(devided.length<=2){
      //devidedが2要素数以下の場合は空文字を返す
      return DevidedUrl("","");
    }
    String domainText=devided[2];//ドメイン部の抜き出し
    String dirText=devided.sublist(3).join("/");//ディレクトリ部の抜き出し

    DevidedUrl devidedUrl=DevidedUrl(domainText, dirText);//カスタムクラスに格納することでふたつの変数を返せるようにする

    return devidedUrl;
  }

  //与えられた文字列がURLかどうか判定する関数
  //「http://~」「https://~」をtrueとする
  bool checkInputUrl(String url){

    if(url.contains("http://") || url.contains("https://")){
      return true;
    }else{
      return false;
    }

  }



}

class DevidedUrl {
  final String domain;
  final String dir;

  DevidedUrl(this.domain, this.dir);
}

