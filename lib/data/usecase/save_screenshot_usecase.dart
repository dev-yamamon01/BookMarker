import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../utils/my_utils.dart';

final saveScreenShotUsecaseProvider = Provider<SaveScreenShotUsecase>((ref) {
  return SaveScreenShotUsecase(ref);
});


class SaveScreenShotUsecase {
  final Ref ref;

  SaveScreenShotUsecase(this.ref);

  Future<String> execute({required Uint8List screenshot}) async {
    try {
      // 内部ストレージへ保存
      final baseDir = await getApplicationDocumentsDirectory();
      final targetDir =
          Directory('${baseDir.path}/webview_captures'); //ここで任意のフォルダを作成
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
      final timestamp = getTimeStamp();
      final filePath = '${targetDir.path}/$timestamp.png';
      final file = File(filePath);
      await file.writeAsBytes(screenshot);

      print("保存完了: $filePath");
      return filePath;
    } catch (e) {
      print("保存エラー: $e");
      return "";
    }
  }
}