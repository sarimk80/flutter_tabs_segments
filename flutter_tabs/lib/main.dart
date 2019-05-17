import 'package:flutter/material.dart';
import 'src/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'src/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoApp(
        home: MyHomePage(
          title: "IOS",
        ),
      );
    } else {
      return MaterialApp(
        home: MyHomePage(
          title: "Android",
        ),
      );
    }
  }
}
