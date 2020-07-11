import 'package:calculator/themes.dart';
import 'package:calculator/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashy/splashy.dart';

class App extends StatelessWidget {
  Future<Widget> customFunction() {
    print("Background process");
    return Future.value(Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      home: Splashy(
        imagePath: "assets/images/icon.png",
        customFunction: customFunction(),
        backgroundColor: Color(0xFF26343c),
        logoHeight: 100,
        logoWidth: 100,
        // duration: 10000,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
