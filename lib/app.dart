import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashy/splashy.dart';

class App extends StatelessWidget {
  Future<Widget> customFunction() {
    print("Background process");
    return Future.value(Scaffold(
      body: Container(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splashy(
        imagePath: "assets/images/icon.png",
        customFunction: customFunction(),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        logoHeight: 100,
        logoWidth: 100,
        duration: 10000,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
