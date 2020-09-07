import 'package:cactus_app/common/my_const.dart';
import 'package:cactus_app/page/home/home_page.dart';
import 'package:cactus_app/page/single/single_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CactusApp',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/single' : (context) => SinglePage()
      },
    );
  }
}
