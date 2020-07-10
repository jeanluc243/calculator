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
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splashy(
        imagePath: "assets/images/icon.png",
        customFunction: customFunction(),
        logoHeight: 100,
        logoWidth: 100,
        duration: 10000,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
