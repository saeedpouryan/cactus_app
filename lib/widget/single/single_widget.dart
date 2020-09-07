import 'package:cactus_app/common/my_const.dart';
import 'package:cactus_app/style/app_color/app_color.dart';
import 'package:cactus_app/style/app_text_style/text_style.dart';
import 'package:cactus_app/widget/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleWidget {


  static Widget appBar(Size screenSize){
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * .1),
      width: screenSize.width,
      height: screenSize.height * .15,
      alignment: Alignment.bottomCenter,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          // user icon
          new ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: new Container(
              width: screenSize.width * .16,
              height: screenSize.width * .16,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/image/logo.svg',
                width: screenSize.width * .08,
                height: screenSize.width * .08,
              ),
              decoration: myBoxDecoration.copyWith(
                border: Border.all(
                  color: Colors.white.withOpacity(.1),
                  width: 1,
                ),
                color: Colors.transparent
              ),
            ),
          ),

          // title
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              new Text(
                'Bunny Ear',
                style: AppTextStyle.font15.copyWith(
                  color: Colors.white,
                  fontSize: screenSize.width * .04
                ),
              ),

              new SizedBox(height: 6,),

              new Text(
                'Cactus Guide',
                style: AppTextStyle.font15.copyWith(
                  color: Color(0xffFFFFFF).withOpacity(.3),
                  fontSize: screenSize.width * .035
                ),
              ),


              new SizedBox(height: screenSize.height * .01,),


            ],
          ),


          new Container(
              width: screenSize.width * .16,
              height: screenSize.width * .16,
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/image/menu.svg'),
              decoration: myBoxDecoration.copyWith(
                border: Border.all(
                  color: Colors.white.withOpacity(.1),
                  width: 1,
                ),
                color: Colors.transparent
              ),
            ),


        ],
      ),
    );
  }

  static Widget pageView(Size screenSize,PageController pageControllerm,int currentIndex,Function onChangePage){

    List image = [
      'assets/image/cactus_s1.svg',
      'assets/image/cactus_h3.svg',
      'assets/image/cactus_s3.svg',
    ];

    return new Container(
      margin: EdgeInsets.only(top: screenSize.height * .07),
      width: screenSize.width,
      height: screenSize.height * .35,
      padding: EdgeInsets.only(bottom: 2),
      child: new PageView(
        onPageChanged: (index) => onChangePage(index),
        controller: PageController(
          viewportFraction: .55
        ),
        children: List.generate(image.length, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 250),
            margin: EdgeInsets.symmetric(
              vertical: currentIndex == index 
                ? 0
                : screenSize.height * .07,
            ),
            child: Hero(
              tag: 'cactus$index',
              child: SvgPicture.asset(
                image[index],
              ),
            ),
          );
        }),
      ),
    );
  }

  static Widget todayData(Size screenSize){
    return new Container(
      margin: EdgeInsets.only(top: screenSize.height * .05),
      width: screenSize.width,
      height: screenSize.height * .37,
      child: new Column(
      
        children: [

          // today text And more icon
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              new Text(
                '      Today Activity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * .045
                ),
              ),

              new Padding(
                padding:  EdgeInsets.only(right: screenSize.width * .1),
                child: new SvgPicture.asset('assets/image/more.svg'),
              )

            ],
          ),


          // Box
          new Container(
            margin: EdgeInsets.only(top: screenSize.height * .03),
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
            width: screenSize.width * .85,
            height: screenSize.height * .3,
            child: new Column(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                new Spacer(),

                // water item
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    new Row(
                      children: [

                        // icon
                        Padding(
                          padding: EdgeInsets.only(top: screenSize.height * .01),
                          child: Image.asset(                        
                            'assets/image/water.png',
                            height: screenSize.height * .065,                        
                          ),
                        ),

                        // ---> |
                        Container(
                          width: 2,
                          height: screenSize.height * .03,
                          color: Colors.white.withOpacity(.05),
                        ),

                        // name
                        Container(
                          margin: EdgeInsets.only(left: screenSize.width * .06),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Activity Name',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: screenSize.width * .033,
                                ),
                              ),

                              new SizedBox(height: screenSize.height * .008),

                              new Text(
                                'Cactus Irrigation',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white,
                                  fontSize: screenSize.width * .037,
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),

                    new Container(
                      width: screenSize.width * .07,
                      height: screenSize.width * .07,
                      alignment: Alignment.center,
                      child: new Icon(Icons.add,color: Colors.white,size: 15,),
                      decoration: myBoxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.1)
                      ),
                    )

                  ],
                ),

                new Spacer(),

                // sun item
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    new Row(
                      children: [

                        // icon
                        Padding(
                          padding: EdgeInsets.only(right: screenSize.width * .013,left: screenSize.width * .013),
                          child: Image.asset(                        
                            'assets/image/sun.png',
                            height: screenSize.height * .055,                        
                          ),
                        ),

                        // ---> |
                        Container(
                          width: 2,
                          height: screenSize.height * .03,
                          color: Colors.white.withOpacity(.05),
                        ),

                        // name
                        Container(
                          margin: EdgeInsets.only(left: screenSize.width * .06),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Activity Name',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: screenSize.width * .033,
                                ),
                              ),

                              new SizedBox(height: screenSize.height * .008),

                              new Text(
                                'Cactus Irrigation',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white,
                                  fontSize: screenSize.width * .037,
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),

                    new Container(
                      width: screenSize.width * .07,
                      height: screenSize.width * .07,
                      alignment: Alignment.center,
                      child: new Icon(Icons.add,color: Colors.white,size: 15,),
                      decoration: myBoxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.1)
                      ),
                    )

                  ],
                ),
              
                new Spacer(),
                new Spacer(),

                // sun item
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    new Row(
                      children: [

                        // icon
                        Padding(
                          padding: EdgeInsets.only(right: screenSize.width * .02,),
                          child: Image.asset(                        
                            'assets/image/cloud.png',
                            height: screenSize.height * .05,                        
                          ),
                        ),

                        // ---> |
                        Container(
                          width: 2,
                          height: screenSize.height * .03,
                          color: Colors.white.withOpacity(.05),
                        ),

                        // name
                        Container(
                          margin: EdgeInsets.only(left: screenSize.width * .06),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Activity Name',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: screenSize.width * .033,
                                ),
                              ),

                              new SizedBox(height: screenSize.height * .008),

                              new Text(
                                'Cactus Irrigation',
                                style: AppTextStyle.font15.copyWith(
                                  color: Colors.white,
                                  fontSize: screenSize.width * .037,
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),

                    new Container(
                      width: screenSize.width * .07,
                      height: screenSize.width * .07,
                      alignment: Alignment.center,
                      child: new Icon(Icons.add,color: Colors.white,size: 15,),
                      decoration: myBoxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.1)
                      ),
                    )

                  ],
                ),

                new Spacer(),
                new Spacer(),


              ],
            ),
            decoration: myBoxDecoration.copyWith(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white.withOpacity(.1))
            ),
          ),

          //HomeWidget.space(screenSize.height * .02)

        ],
      ),
    );
  }

}