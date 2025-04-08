import 'package:flutter/material.dart';
import 'package:bookmarker/data/database.dart';
import 'package:go_router/go_router.dart';

final AppDatabase db = AppDatabase();

class GenreEditScreen extends StatelessWidget {

  const GenreEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ジャンル編集")),
      body: StreamBuilder<List<Genre>>(
        stream: db.select(db.genres).watch(), // 常に最新のデータを取得
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final genres = snapshot.data!;

          return ListView.builder(
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index];
              return ListTile(
                title: Text(genre.genreName),
                onTap: () {

                },
              );
            },
          );
        },
      ),
    );
  }
}
