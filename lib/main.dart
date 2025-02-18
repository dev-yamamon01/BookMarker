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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Row(
          children: [
            // IconButton(onPressed: (){}, icon: Icons.menu,color: Color(0xFFCC0000),),
            IconButton(
            onPressed: (){},
              icon:SvgPicture.asset('assets/menu.svg',width: 30,height: 30),
              ),
            Row(children: [
              SvgPicture.asset('assets/bookmark.svg',width: 30,height: 30),
              Text('  '),
              Text(widget.title,
                style: TextStyle(
                  color: Color(0xFFCC0000)//AARRGGBB形式のHex
                ),)
            ]),
             IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/key.svg',width: 30,height: 30))

          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      )),
      body: Text("data"),
    );
  }
}
