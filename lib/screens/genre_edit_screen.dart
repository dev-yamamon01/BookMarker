import 'package:flutter/material.dart';

class GenreEditScreen extends StatelessWidget {
  const GenreEditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ジャンル編集")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // 戻る
          },
          child: Text("戻る"),
        ),
      ),
    );
  }
}
