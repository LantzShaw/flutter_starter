import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(), // ios的效果
              // physics: const ClampingScrollPhysics(), // 安卓的效果
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.amber,
                      child: const Text('hello'),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.red[200],
                      child: const Text('hello'),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.blue[200],
                      child: const Text('hello'),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.amber,
                      child: const Text('hello'),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.red[200],
                      child: const Text('hello'),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.blue[200],
                      child: const Text('hello'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: TextField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: '请输入',
                hintStyle: TextStyle(
                  color: Color(0xFFFF4400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
