import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/views/screens/update_genre_screen.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final AppDatabase db = AppDatabase();

class GenreEditScreen extends ConsumerWidget {

  const GenreEditScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("ジャンル編集")),
      body: StreamBuilder<List<Genre>>(
        stream: db.select(db.genres).watch(), // 常に最新のデータを取得
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(color: MyColors.primary,));
          }

          final genres = snapshot.data!;

          return ListView.builder(
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index];
              return ListTile(
                title: Text(genre.genreName),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 20, // 横幅を制限
                        height: 20, // 高さを制限
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return UpdateGenreScreen(
                                    genre: genre,
                                  );
                                });
                          },
                          icon: Icon(Icons.edit),
                          padding: EdgeInsets.zero,
                        )
                    ),
                    SizedBox(width: 15), //アイコン同士の間のスペース確保
                    SizedBox(
                        width: 20, // 横幅を制限
                        height: 20, // 高さを制限
                        child: IconButton(
                          onPressed: () {
                            showDeleteDialog(context, 'このジャンルを削除しますか？',
                                '※削除したジャンルに該当するURLがある場合は自動的にジャンル未選択に変更されます',
                                () async {
                                  await ref.read(genreViewModelProvider.notifier).deleteGenre(genre.id);
                                  showToastMessage(context, '削除しました');
                            });
                          },
                          icon: Icon(Icons.delete),
                          padding: EdgeInsets.zero,
                        )),
                  ],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UpdateGenreScreen(
                          genre: genre,
                        );
                      });
                },
              );
            },
          );
        },
      ),
    );
  }
}
