import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/utils/my_colors.dart';


class UpdateDomainScreen extends ConsumerStatefulWidget {
  final Domain domain;

  const UpdateDomainScreen({super.key,required this.domain});

  @override
  ConsumerState<UpdateDomainScreen> createState() => _UpdateDomainScreenState();
}

class _UpdateDomainScreenState extends ConsumerState<UpdateDomainScreen> {
  TextEditingController domainController = TextEditingController();

  String? domain;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
          title: Text('${widget.domain.domainName}を編集'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: domainController,
                decoration: InputDecoration(
                  hintText: "例: example.com",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              //キャンセルボタン
              onPressed: () => Navigator.pop(context),
              // キャンセル
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              // ← 文字色
              child: Text("キャンセル"),
            ),
            TextButton(
              //更新するボタン
              onPressed: () async {
                await ref.read(domainViewModelProvider.notifier)
                    .updateDomain(domainId: widget.domain.id, newDomainName: domainController.text);
              },
              style: TextButton.styleFrom(
                foregroundColor: MyColors.primary, // ← 文字色
                side: BorderSide(color: MyColors.primary, width: 1), // ← 枠線
                shape: RoundedRectangleBorder(
                  // ← 枠の角を丸く
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ← 余白
              ),
              child: Text("更新する"),
            ),
          ],
        );
  }
}
