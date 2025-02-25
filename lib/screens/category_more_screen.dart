import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          _buildButton(Icon(Icons.add_circle_rounded,size: 40, color: Colors.white), "カテゴリ追加",Color(0xAACC0000)),
          _buildButton(Icon(Icons.edit_note_sharp,size: 40, color: Colors.white), "カテゴリ編集", Color(0xAACC0000)),
          _buildButton(SvgPicture.asset('assets/domain.svg',width: 40, height: 40), "ドメイン編集", Color(0xAACC0000)),
          _buildButton(Icon(Icons.settings,size: 40, color: Colors.white), "設定", Color(0xAACC0000)),
        ],
      ),);

  }

  // ボタンウィジェットを生成するヘルパーメソッド
  Widget _buildButton(Widget icon, String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        print('$label pressed');
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