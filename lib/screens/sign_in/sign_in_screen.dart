import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF3A7C76),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: const Text(
                  'hello world',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18.0,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xffff4400),
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
