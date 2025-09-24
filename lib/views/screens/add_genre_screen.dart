import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/views/components/my_input_dialog.dart';

class AddGenreScreen extends ConsumerStatefulWidget {
  const AddGenreScreen({super.key,required this.parentContext});
  final BuildContext parentContext;

  @override
  ConsumerState<AddGenreScreen> createState() => _AddGenreScreenState();
}

class _AddGenreScreenState extends ConsumerState<AddGenreScreen> {
  TextEditingController genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyInputDialog(
        textController: genreController,
        inputTitle: 'ジャンルを追加',
        hintText: '例：スポーツ',
        positiveButtonText: '追加する',
        successMessageText: 'ジャンルを追加しました',
        onPressed: () async {
          await ref.read(genreViewModelProvider.notifier)
              .addGenre(genreController.text);
        }
    );
  }
}
