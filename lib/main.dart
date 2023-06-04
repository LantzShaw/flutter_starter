import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/screens/category/category_screen.dart';
import 'package:flutter_starter/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;

import 'models/todo.dart';

void main() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        /// 这是设置状态栏的图标和字体的颜色
        /// Brightness.light  一般都是显示为白色
        /// Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        // brightness: Brightness.light,
        textButtonTheme: const TextButtonThemeData(
          // 去掉 TextButton 的水波纹效果
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ),
      // onGenerateRoute: ,
      // routes: {
      //   '/': (context) => HomeScreen(),
      // },
      // initialRoute: '/splash',
      // home: const ProfileScreen(),
      // home: const MyHomePage(title: 'Flutter Demo'),
      home: const CategoryScreen(),
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
  int _counter = 0;

  Future<void> _getData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');

    // var response = await http.get(Uri.parse('jsonplaceholder.typicode.com/tods/1'));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // jsonDencode(response.body) - 转Json
      // jsonEncode(response.body) - 转String
      Todos json = Todos.fromJson(jsonDecode(response.body));

      print(json.userId);

      // print(json['id']);

      // developer.log('${json["userId"]}');
    } else {
      throw Exception('failed to load todos');
    }

    // developer.log('response ${response.body}${response.statusCode}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _getData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    print('dasd');

    developer.log('dasdasd');

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Demo',
          style: TextStyle(color: Color(0xff000000)),
        ),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 253, 255, 254),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );

                // Navigator.pop(context);

                // Navigator.pushNamed(context, '/splash');
              },
              icon: const Icon(Icons.home),
            ),
            const SizedBox(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_balance,
              ),
            )
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Expanded(
              // NOTE: Text组件外层包一层Expanded
              child: Text(
                '在下一章中',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis, // 省略号显示
                // overflow: TextOverflow.visible,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
