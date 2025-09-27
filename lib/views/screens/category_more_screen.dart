import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/screens/add_genre_screen.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';

enum MoreMenu {
  genreAdd,
  genreEdit,
  domainEdit,
  aboutApp,
}

//最後のタブのカテゴリー編集機能のUIを返す
class CategoryMoreScreen extends StatelessWidget {
  const CategoryMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2, // 2列
        mainAxisSpacing: 20, // 縦方向の間隔
        crossAxisSpacing: 20, // 横方向の間隔
        children: [
          _buildButton(
              icon: Icon(Icons.add_circle_rounded,size: 40, color: Colors.white),
              label: "ジャンル追加",
              color: MyColors.secondary,
              context: context,
              moreMenu: MoreMenu.genreAdd
          ),
          _buildButton(
              icon: Icon(Icons.edit_note_sharp,size: 40, color: Colors.white),
              label: "ジャンル編集",
              color: MyColors.secondary,
              context: context,
              moreMenu: MoreMenu.genreEdit
          ),
          _buildButton(
              icon: SvgPicture.asset('assets/domain.svg',width: 40, height: 40),
              label: "ドメイン編集",
              color: MyColors.secondary,
              context: context,
              moreMenu: MoreMenu.domainEdit
          ),
          _buildButton(
              icon: Icon(Icons.contact_support,size: 40, color: Colors.white),
              label: "このアプリについて",
              color: MyColors.secondary,
              context: context,
              moreMenu: MoreMenu.aboutApp
          ),
        ],
      ),);

  }

  // ボタンウィジェットを生成するヘルパーメソッド
  Widget _buildButton({
    required Widget icon,
    required String label,
    required Color color,
    required BuildContext context,
    required MoreMenu moreMenu
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        switch (moreMenu) {
          case MoreMenu.genreAdd:
            showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AddGenreScreen(parentContext: context,);
                });
            break;
          case MoreMenu.genreEdit:
            context.pushNamed('genreEdit');
            break;
          case MoreMenu.domainEdit:
            context.pushNamed('editDomain');
            break;
          case MoreMenu.aboutApp:
            context.pushNamed('aboutApp');
            break;
        }
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