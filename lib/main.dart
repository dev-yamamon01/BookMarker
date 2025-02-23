import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Maker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Book Maker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                children: [
                  // IconButton(onPressed: (){}, icon: Icons.menu,color: Color(0xFFCC0000),),
                  IconButton(
                    onPressed: OnMenu,
                    icon:
                    SvgPicture.asset('assets/menu.svg', width: 30, height: 30),
                  ),
                  Row(children: [
                    SvgPicture.asset(
                        'assets/bookmark.svg', width: 30, height: 30),
                    Text('  '),
                    Text(
                      widget.title,
                      style: TextStyle(color: Color(0xFFCC0000) //AARRGGBB形式のHex
                      ),
                    )
                  ]),
                  IconButton(
                      onPressed: OnSecret,
                      icon:
                      SvgPicture.asset('assets/key.svg', width: 30, height: 30))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            bottom: TabBar(
              controller: _tabController, // カスタムコントローラーを指定
              overlayColor: MaterialStateProperty.all(Colors.transparent), // リップルエフェクトを非表示
              indicator: BoxDecoration(
                color: Colors.grey.withOpacity(0.1), // 背景色（タブの背景全体に適用）
                border: Border(
                  bottom: BorderSide(color: Color(0xFFCC0000), width: 4), // 下線のカスタマイズ
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab, // ラベルのサイズに合わせたインジケーター,
              labelStyle: TextStyle(
                  fontSize: 12,
                fontWeight: FontWeight.bold,
                  color: Color(0xFFCC0000),
                  ),
              unselectedLabelStyle: TextStyle(fontSize: 10),
              tabs: [
                Tab(icon: Icon(Icons.star), text: "トップ3",height: 60,),
                Tab(text: 'ジャンル1',height: 40,),
                Tab(text: "ジャンル2",height: 40,),
                Tab(text: "ジャンル3",height: 40,),
                Tab(icon: Icon(Icons.more_horiz),height: 40,),
              ],
            ),
          ),
            body: TabBarView(
                controller: _tabController, // コントローラーを指定
                children: [
                  CustomListView(items: ["item1","item2","item3"]),

                  Text("ジャンル1の内容です"),
                  Text("ジャンル2の内容です"),
                  Text("ジャンル3の内容です"),
                  Text("#3"),
                ]),
          ),
    );
  }

  void OnMenu(){
    print("menu-button pressed");
  }

  void OnSecret(){
    print("secret-button pressed");
  }

}
class CustomListView extends StatelessWidget {
  final List<String> items;
  const CustomListView({super.key,required this.items});

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
                    Text("評価: 4.5"),
                    Text("再生数: 15 回"),
                    Text("コメント: ${items[index]}のコメント"),
                  ],
                ), alignment: Alignment.topLeft
                    ,),
            trailing:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.ac_unit),
                    Icon(Icons.ac_unit)
                    // IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit),visualDensity: VisualDensity.compact,),
                    // IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit),visualDensity: VisualDensity.compact,),
                  ],
                )

          );
        }
    );
  }
}

