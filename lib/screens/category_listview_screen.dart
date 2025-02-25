import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<String> items;
  const CategoryListView({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return ListTile(
              leading: Image.network('https://asset.watch.impress.co.jp/img/car/docs/1436/350/001_o.jpg'), // 共通のアイコン
              title: Text(items[index], style: TextStyle(fontSize: 18)),
              subtitle:
              Container(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
                children: [
                  Text("名前: ${items[index]}の名前"),
                  Text("アクセス数: 15 回"),
                  Text("コメント: ${items[index]}のコメント"),
                ],
              ), alignment: Alignment.topLeft
                ,),
              trailing:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 20, // 横幅を制限
                      height: 20, // 高さを制限
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.copy_sharp),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                  SizedBox(
                      width: 20, // 横幅を制限
                      height: 20, // 高さを制限
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                ],
              ));
        }
    );
  }
}