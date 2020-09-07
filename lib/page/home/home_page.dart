import 'package:cactus_app/style/app_color/app_color.dart';
import 'package:cactus_app/widget/home/home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Size screenSize;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return new  Scaffold(
      backgroundColor: AppColor.grey2,
      body: new SingleChildScrollView(
        child: new Column(
          children: [

            HomeWidget.appBar(screenSize),

            Stack(
              children: [

                new SizedBox(height: screenSize.height - screenSize.height * .15,),

                new Positioned(
                  child: HomeWidget.sunLight(screenSize)
                ),

                new Positioned(
                  top: screenSize.height * .24,
                  child: HomeWidget.activity(screenSize,context,(){
                    Navigator.pushNamed(context, '/single');
                  })
                ),


                new Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: HomeWidget.bottomNavigation(screenSize),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}