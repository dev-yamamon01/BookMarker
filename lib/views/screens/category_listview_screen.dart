import 'dart:io';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/view_models/subtitle/subtitle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/views/components/my_modal_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CategoryListView extends ConsumerWidget {
  final List<Url>? urls;
  const CategoryListView({super.key,required this.urls});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView.builder(
        itemCount: urls?.length,
        itemBuilder: (context,index){
          return ListTile(
              //leading: Image.network('https://asset.watch.impress.co.jp/img/car/docs/1436/350/001_o.jpg'),
            leading: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.file(File(urls?[index].imageResDir ?? "")),
            ),
            title: Text(urls?[index].title?? "", style: TextStyle(fontSize: 18)),
              subtitle:
              Container(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
                children: [
                    FutureBuilder<String?>(
                        future: ref.read(subtitleViewModelProvider.notifier).getSubtitleName(urls?[index]?.subTitleId ?? 0),
                        // 非同期メソッドを呼び出す
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading...");
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else if (snapshot.hasData) {
                            return Text("名前: ${snapshot.data ?? ""}");
                          } else {
                            return Text("No Data");
                          }
                        }),
                    Text("アクセス数: ${urls?[index].numOfViews} 回"),
                    Text("コメント: ${urls?[index].comment}"),
                ],
              ), alignment: Alignment.topLeft
                ,),
              trailing:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 20, // 横幅を制限
                      height: 20, // 高さを制限
                      child: IconButton(
                        onPressed: () async {

                          //クリップボードへのコピー
                          final accessUrl=await ref.read(domainViewModelProvider.notifier)
                          .getAccessUrl(urls?[index].domainId ?? 0, urls?[index].directory ?? "");
                          Clipboard.setData(ClipboardData(text: accessUrl ?? ""));

                          //トーストメッセージ表示
                          showToastMessage(context,"クリップボードへコピーしました");

                        },
                        icon: Icon(Icons.copy_sharp),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                  SizedBox(
                      width: 20, // 横幅を制限
                      height: 20, // 高さを制限
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyModalBottomSheet(
                                  title: urls?[index].title,
                                  urlId: urls?[index].id);
                            });
                      },
                      icon: Icon(Icons.more_vert),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                ],
              ),
              onTap: (){
                //ここでリンクにプライベートブラウザで飛んで、アクセス数更新する
                openBrowser(urls![index].domainId,urls?[index].directory ?? "",ref);

                }
              ,
          );
        }
    );
  }



  void openBrowser(int domainId,String directory,WidgetRef ref)async{

    final accessUrl=await ref.read(domainViewModelProvider.notifier).getAccessUrl(domainId, directory);
    //final accessUrl=await getAccessUrl(domainId, directory);

    final Uri _url = Uri.parse(accessUrl ?? "");
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication, // 外部ブラウザで開く
    )) {
      throw 'Could not launch $_url';
    }
  }

}