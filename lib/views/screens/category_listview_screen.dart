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
import 'package:flutter_screenutil/flutter_screenutil.dart';

// CategoryListView.dart
class CategoryListView extends ConsumerWidget {
  final List<Url>? urls;
  const CategoryListView({super.key, required this.urls});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = urls ?? [];

    // 空のときの表示（任意）
    if (list.isEmpty) {
      return Center(
          child: Text(
            '保存している内容がありません',
            style: TextStyle(fontSize: 20.sp)
          )
      );
    }

    // ListViewをそのまま返す（高さはTabBarViewが全画面にしてくれる）
    return ListView.builder(
      itemCount: list.length,
      padding: EdgeInsets.only(top: 3.h),
      itemBuilder: (context, index) {
        final url = list[index];

        return Container(
          padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 画像部分（左）
              SizedBox(
                width: 150.w,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.file(
                    File(url.imageResDir ?? ""),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.broken_image),
                      );
                    },
                  ),
                ),
              ),
               SizedBox(width: 8.w),

              // 中央（タイトル・サブタイトル・コメント）
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    openBrowser(url.domainId, url.directory ?? "", ref);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        url.title,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      FutureBuilder<String?>(
                        future: ref
                            .read(subtitleViewModelProvider.notifier)
                            .getSubtitleName(subtitleId: url.subTitleId ?? 0),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text("Loading...", style: TextStyle(fontSize: 14.sp));
                          } else if (snapshot.hasError) {
                            return Text(
                              "Error: ${snapshot.error}",
                              style: TextStyle(fontSize: 14.sp, color: Colors.red),
                            );
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data ?? "",
                              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          } else {
                            return Text(
                              "No Data",
                              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        url.comment ?? "",
                        style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 8.w),

              // 右側（アイコン2つ）
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.copy_sharp,size: 20.sp,),
                    tooltip: 'URLをコピー',
                    onPressed: () async {
                      final accessUrl = await ref
                          .read(domainViewModelProvider.notifier)
                          .getAccessUrl(url.domainId ?? 0, url.directory ?? "");
                      Clipboard.setData(ClipboardData(text: accessUrl ?? ""));
                      showToastMessage(message: "クリップボードへコピーしました");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert,size: 20.sp,),
                    tooltip: '詳細',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return MyModalBottomSheet(
                            title: url.title,
                            urlId: url.id,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
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