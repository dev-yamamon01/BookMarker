import 'dart:io';

import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/view_models/subtitle/subtitle_view_model.dart';
import 'package:bookmarker/view_models/url/url_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/data/models/urls_by_genre_name.dart';
import 'package:bookmarker/data/models/tables.dart';

import '../../view_models/genre/genre_view_model.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final urlAsync = ref.watch(urlByIdProvider(int.parse(widget.urlId)));
    final genreState=ref.watch(genreViewModelProvider);

    String? url,title,domain,subTitle,dir,comment,selectedGenreName;
    int evaluation=0;

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
                      //TODO:ジャンルのプルダウンをgenreNameにする
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
                      //TODO:ジャンルのプルダウンをgenreNameにする
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
                      padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.file(
                          File(url.imageResDir),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
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
                        SizedBox(height: 20),
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
                            }),
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
                          decoration: InputDecoration(hintText: "コメントを追加"),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                            onPressed: (){}, 
                            child: Text('更新する'))
                      ],
                    ),
                  );
                })));
  }
}
