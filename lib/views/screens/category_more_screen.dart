import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/screens/add_genre_screen.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';

//最後のタブのカテゴリー編集機能のUIを返す
class CategoryMoreScreen extends StatelessWidget {
  const CategoryMoreScreen({super.key});
  final String labelGenreAdd="ジャンル追加";
  final String labelGenreEdit="ジャンル編集";
  final String labelDomainEdit="ドメイン編集";
  final String labelSetting="設定";

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2, // 2列
        mainAxisSpacing: 20, // 縦方向の間隔
        crossAxisSpacing: 20, // 横方向の間隔
        children: [
          _buildButton(Icon(Icons.add_circle_rounded,size: 40, color: Colors.white), labelGenreAdd,MyColors.secondary,context),
          _buildButton(Icon(Icons.edit_note_sharp,size: 40, color: Colors.white), labelGenreEdit, MyColors.secondary,context),
          _buildButton(SvgPicture.asset('assets/domain.svg',width: 40, height: 40), labelDomainEdit, MyColors.secondary,context),
          _buildButton(Icon(Icons.settings,size: 40, color: Colors.white), labelSetting, MyColors.secondary,context),
        ],
      ),);

  }

  // ボタンウィジェットを生成するヘルパーメソッド
  Widget _buildButton(Widget icon, String label, Color color, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        if (label == labelGenreAdd) {
          showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AddGenreScreen(parentContext: context,);
              });
        } else if (label == labelGenreEdit) {

          context.push('/genreEdit');

        } else if (label == labelDomainEdit) {
        } else {}
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }


}