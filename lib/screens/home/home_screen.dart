import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map> buttons = [
    {'title': '打开浏览器', 'scheme': 'https://www.baidu.com'},
    {'title': '打开地图', 'scheme': 'geo:52.32.4.917'},
    {'title': '打开微信', 'scheme': 'weixin://'},
    {'title': '打开京东', 'scheme': 'openapp.jdmoble://'},
    {'title': '打开淘宝', 'scheme': 'taobao://'},
    {'title': '打开百度地图', 'scheme': ' baidumap://'},
  ];

  // final Uri _url = Uri.parse('https://flutter.dev');
  // final Uri _url = Uri.parse('geo:52.32.4.917');
  final Uri _url = Uri.parse('weixin://');

  // NOTE: 需要设置Scaffold的key才能弹出SnackBar
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // final  drawerStateKey  = GlobalKey<DrawerState>();

  Future<void> _launchUrl() async {
    // if (!await launchUrl(_url)) {
    //   throw Exception('Could not launch $_url');
    // }

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }

    // _scaffoldkey.currentState!.showSnackBar(const SnackBar(content: Text('dasdasd'),),);
    _scaffoldkey.currentState!.showBottomSheet(
      (context) => const SnackBar(
        content: Text('dasdasd'),
      ),
    );

    // _scaffoldkey.currentState!.openDrawer();

    // Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text('老孟，一枚有态度的程序员'),
    //   ));
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                        text:
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () => null,
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Color(0xFFFFFFFF),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              final SnackBar snackBar = SnackBar(
                content: const Text('some text'),
                action: SnackBarAction(label: 'undo', onPressed: () {}),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              _showSimpleModalDialog(context);
            },
            icon: const Icon(Icons.location_searching),
          ),
        ],
        title: const Text(
          'Nav Bar',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 107, 52, 235),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
      ),
      drawer: const NavBar(),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: _launchUrl,
          style: ButtonStyle(
            // foregroundColor: MaterialStateProperty.resolveWith(
            //   (states) {
            //     if (states.contains(MaterialState.hovered)) {
            //       return Colors.green;
            //     }
            //     if (states.contains(MaterialState.pressed)) {
            //       return null;
            //     }
            //     return Colors.transparent;
            //   },
            // ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.green;
                }
                // 按下时的颜色
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                // return Colors.transparent;
                return null;
              },
            ),
            // 水波纹颜色
            overlayColor: const MaterialStatePropertyAll(Colors.white),
            // 设置阴影 对TextButton无效
            elevation: MaterialStateProperty.all(10),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.grey, width: 1),
            ),
            //外边框装饰 会覆盖 side 配置的样式
            shape: MaterialStateProperty.all(
              const StadiumBorder(side: BorderSide.none),
            ),
          ),
          child: const Text('打开浏览器'),
        ),
      ),
    );
  }
}
