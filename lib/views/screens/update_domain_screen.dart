import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:bookmarker/views/components/my_input_dialog.dart';


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

    return MyInputDialog(
        textController: domainController,
        inputTitle: '${widget.domain.domainName}を編集',
        hintText: '例：example.com',
        positiveButtonText: '一括更新する',
        successMessageText: 'ドメインの一括更新を実行しました',
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z\.]'), // ← 英字とドットだけ許可
          ),
        ],
        onPressed: () async{
          await ref.read(domainViewModelProvider.notifier)
              .updateDomain(domainId: widget.domain.id, newDomainName: domainController.text);
        }
    );
  }
}
