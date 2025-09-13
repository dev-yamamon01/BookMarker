import 'dart:io';
import 'dart:typed_data';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/data/usecase/save_screenshot_usecase.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/view_models/subtitle/subtitle_view_model.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utils/url_utils.dart';
import '../../view_models/genre/genre_view_model.dart';
import '../../view_models/providers/url_by_genre.dart';
import '../../view_models/url/url_view_model.dart';

class EditUrlScreen extends ConsumerStatefulWidget {
  final String urlId;
  
  const EditUrlScreen({super.key,required this.urlId});

  @override
  ConsumerState<EditUrlScreen> createState() => _EditUrlScreenState();
}

class _EditUrlScreenState extends ConsumerState<EditUrlScreen> {
  TextEditingController urlController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  bool _hasSetUrl = false;
  bool _hasSetSubtitle = false;
  bool _hasSetDomain = false;
  bool _hasSetGenre = false;
  bool _hasSetTitle = false;
  bool _hasSetComment = false;

  Genre? selectedGenre;
  Uint8List? cropImage;

  String? url,title,domain,subTitle,dir,comment,selectedGenreName;
  int evaluation=0;

  @override
  void initState() {
    super.initState();
    urlController.addListener(() {

      final text = urlController.text;
      domain=UrlUtils.extractDomainAndDir(text).domain;
      dir=UrlUtils.extractDomainAndDir(text).dir;

    });
  }

  @override
  Widget build(BuildContext context) {
    final urlAsync = ref.watch(urlByIdProvider(int.parse(widget.urlId)));
    final genreState=ref.watch(genreViewModelProvider);


    return Scaffold(
        appBar: AppBar(title: Text('URLの編集')),
        body: Center(
            child: urlAsync.when(
                error: (e, _) => Text('エラー：　$e'),
                loading: () => CircularProgressIndicator(),
                data: (url) {
                  final domainAsync=ref.watch(domainByIdProvider(url.domainId));
                  domainAsync.whenData((domain) {
                    if (!_hasSetUrl) {
                      urlController.text='https://${domain.domainName}${url.directory}';
                      _hasSetUrl= true;
                    }
                  });

                  final subTitleAsync = ref.watch(subtitleNameProvider(url.subTitleId));
                  subTitleAsync.whenData((subTitleName) {
                    if (!_hasSetSubtitle) {
                      subTitleController.text = subTitleName ?? "";
                      _hasSetSubtitle= true;
                    }
                  });

                  final genreAsync=ref.watch(genreByIdProvider(url.genreId));
                  genreAsync.whenData((genre) {
                    if (!_hasSetGenre) {
                      selectedGenre=genre;
                      _hasSetGenre= true;
                    }
                  });

                  if(!_hasSetTitle) {
                    titleController.text = url.title;
                    _hasSetTitle=true;
                  }
                  if(!_hasSetComment) {
                    commentController.text=url.comment;
                    _hasSetComment=true;
                  }


                  return Padding(
                      padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: (cropImage != null) ?
                        Image.memory(
                            cropImage!,
                          fit: BoxFit.cover
                        )
                        : Image.file(
                              File(url.imageResDir),
                              fit: BoxFit.cover,
                            ))),
                            Column(
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () async {
                                      final result = await context.push<Uint8List?>(
                                        '/webview/${Uri.encodeComponent(urlController.text)}',
                                      );
                                      if (result != null) {
                                        setState(() {
                                          cropImage = result;
                                        });
                                      }
                                    },
                                    label: Icon(Icons.edit)
                                ),
                                SizedBox(height: 20),
                                ElevatedButton.icon(
                                    onPressed: (){},
                                    label: Icon(Icons.image_not_supported_outlined)
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: urlController,
                          decoration: InputDecoration(
                              label: Text('URL'),
                              hintText: "例: https://example.com"),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            label: Text('タイトル'),
                              hintText: "例: 私のHP"),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: subTitleController,
                          decoration: InputDecoration(
                              label: Text('サブタイトル'),
                              hintText: "例: 花丸 一郎"),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        genreState.when(
                        data: (genres){
                        return DropdownButton<Genre>(
                            value: selectedGenre,//選択された値
                            hint: Text("ジャンルを選択"),
                            items: genres.map((genre) {
                              return DropdownMenuItem<Genre>(
                                value: genre,
                                child: Text(genre.genreName),
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
                        ),
                        RatingBar.builder(
                            initialRating: url.evaluation.toDouble(),
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
                            })]),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 100, child: Text("ドメイン:"),),
                            Expanded(child: Text(
                                domainAsync.when(
                                    data: (domain) => domain.domainName,
                                    error: (e,_) => 'エラー： $e',
                                    loading:() =>  '読込中...'
                                )
                            ))
                          ],
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: commentController,
                            decoration: InputDecoration(
                                label: Text('コメント'),
                                hintText: "例: 太郎くんに教えてもらった良いHP"),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                            child: Text('更新する'),
                            onPressed: UrlUtils.checkInputUrl(
                                urlController.text) &&
                                selectedGenre != null ?
                                () async {
                              try {
                                final saveImagePath = await ref.read(
                                    saveScreenShotUsecaseProvider).execute(
                                    screenshot: cropImage ??
                                        UrlUtils.getTransparentImage());

                                await ref.read(urlViewModelProvider.notifier)
                                    .updateUrl(
                                    int.parse(widget.urlId),
                                    UrlsCompanion(
                                      directory: drift.Value(dir ?? ""),
                                      genreId: drift.Value(selectedGenre!.id),
                                      title: drift.Value(titleController.text),
                                      evaluation: drift.Value(evaluation),
                                      comment: drift.Value(
                                          commentController.text),
                                      imageResDir: drift.Value(saveImagePath),
                                    ),
                                    domain ?? "",
                                    subTitleController.text
                                );

                                showToast('更新完了');
                                context.pop();

                              } catch (e) {
                                print('エラー: $e');
                                showToastMessage(message: "更新エラー");
                              }
                            }: null
                        )
                      ],
                    ),
                  );
                })));
  }
}
