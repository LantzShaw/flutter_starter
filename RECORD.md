### Code

```dart
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Lantz'),
            accountEmail: const Text('lantzshaw@163.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
```

### Example

1. [打开第三方应用](https://blog.csdn.net/nicepainkiller/article/details/121303253#:~:text=Flutter%20%E6%89%93%E5%BC%80%E5%A4%96%E9%83%A8%E7%AC%AC%E4%B8%89%E6%96%B9%E5%BA%94%E7%94%A8%201%20https%3A%20%2F%2F%20pub.flutter-io.cn%20%2F%20packages,sd%20k%3A%20flutter%206%20url%20_launcher%3A%20%5E%206.0.10)

2. [TextButton 使用配置](https://blog.csdn.net/zl18603543572/article/details/109545733)

3. [自定义 AppBar 并实现滑动渐变](https://blog.csdn.net/u013600907/article/details/101456290)

4. `webview_flutter` 使用
   我们在使用第三方插件的时候，插件对最低的 minSdkVersion 版本是有要求的，你比如 flutter 插件 webview_flutter 就会报一下错：minSdkVersion 16 cannot be smaller than version 19 declared in library

方式一:

```sh

#    这时候修改 flutter.minSdkVersion 的方法是：

#    直接从 flutter>packages>flatter_tools>gradle>flatter 更改 flutter.minSdkVersion 和 flutter.targetSdkVersion。
# 还有 flutter\packages\flutter_tools\templates\module\android\host_app_common\app.tmpl\build.gradle.tmpl

# 文件修改就行了。
# 原文链接：https://blog.csdn.net/qq996150938/article/details/126043906

```

方式二:

```gradle
// NOTE: 安装包之后，重启项目，需要配置android/app/build.gradle


defaultConfig {
     // minSdkVersion flutter.minSdkVersion
     minSdkVersion 19 // NOTE: 设置这个
     targetSdkVersion flutter.targetSdkVersion
     versionCode flutterVersionCode.toInteger()
     versionName flutterVersionName
 }

```

5. `flutter_launcher_icons` 使用

6. [Modal 的使用](https://www.educative.io/answers/how-to-use-modal-in-flutter)

### Project Reference

https://github.com/hasancse91/flutter_getx_template/tree/master
