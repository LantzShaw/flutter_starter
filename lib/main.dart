import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todos {
  const Todos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"]);
  }
}

void main() {
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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

    _getData();
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
        elevation: 10.0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          '',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
