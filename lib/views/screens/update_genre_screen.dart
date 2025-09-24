import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/views/components/my_input_dialog.dart';

class UpdateGenreScreen extends ConsumerStatefulWidget {
  const UpdateGenreScreen({super.key,required this.genre});
  final Genre genre;

  @override
  ConsumerState<UpdateGenreScreen> createState() => _UpdateGenreScreenState();
}

class _UpdateGenreScreenState extends ConsumerState<UpdateGenreScreen> {
  TextEditingController genreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    genreController = TextEditingController(text: widget.genre.genreName); // ← ここOK！
  }

  @override
  Widget build(BuildContext context) {
    return MyInputDialog(
        textController: genreController,
        inputTitle: 'ジャンル名を編集',
        hintText: '例：金融ニュース',
        positiveButtonText: '更新する',
        successMessageText: 'ジャンル名を更新しました',
        onPressed: () async{
          await ref.read(genreViewModelProvider.notifier)
              .updateGenre(widget.genre.id, genreController.text);
        }
    );
  }
}
