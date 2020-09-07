import 'package:cactus_app/style/app_color/app_color.dart';
import 'package:cactus_app/widget/single/single_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SinglePage extends StatefulWidget {
  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {

  Size screenSize;
  PageController pageController = PageController(viewportFraction: .9);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      backgroundColor: AppColor.grey2,
      body: new Column(
        children: [

          SingleWidget.appBar(screenSize),

          SingleWidget.pageView(screenSize,pageController,currentIndex,(index){
            setState(() {
              currentIndex = index;
            });
          }),

          SingleWidget.todayData(screenSize)

        ],
      ),
    );
  }
}