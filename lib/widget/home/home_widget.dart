import 'package:cactus_app/common/my_const.dart';
import 'package:cactus_app/page/single/single_page.dart';
import 'package:cactus_app/style/app_color/app_color.dart';
import 'package:cactus_app/style/app_text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeWidget{


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

              child: Image.asset('assets/image/user.png'),
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
                'CACTUS GUIDE',
                style: AppTextStyle.font15.copyWith(
                  color: Colors.white,
                  fontSize: screenSize.width * .04
                ),
              ),

              new SizedBox(height: 6,),

              new Text(
                'Version 2',
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


  static Widget sunLight(Size screenSize){
    return new Container(
      margin: EdgeInsets.only(top: screenSize.height * .04),
      width: screenSize.width,
      height: screenSize.height * .4,

      child: new Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          space(screenSize.height * .03),

          // 3 circle
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              new Container(
                width: screenSize.width * .02,
                height: screenSize.width * .018,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  shape: BoxShape.circle
                ),
              ),

              new Container(
                margin: EdgeInsets.symmetric(horizontal:2),
                width: screenSize.width * .05,
                height: screenSize.width * .015,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.circular(20)
                ),
              ),

              new Container(
                width: screenSize.width * .02,
                height: screenSize.width * .018,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  shape: BoxShape.circle
                ),
              ),

            ],
          ),


          space(screenSize.height * .015),


          new TweenAnimationBuilder(
            tween: new Tween(begin: 0.0,end: 1.0),
            duration: Duration(milliseconds: 1000),
            builder: (context,value,child){

              return new Container(
                alignment: Alignment.topCenter,
                width: screenSize.height * .4,
                height: screenSize.height * .3,
                child: new Stack(
                  alignment: Alignment.center,
                  children: [

                    // progress
                    Transform.rotate(
                      angle: 120 * 3.14 / 180,
                      child: new ShaderMask(
                        shaderCallback: (rect){

                          return SweepGradient(
                            startAngle: 0.0,
                            endAngle: 3.14 * 2,
                            stops: [value * .6, value * .6],
                            center: Alignment.center,
                          
                            colors: [
                              AppColor.yellow,
                              Colors.black.withOpacity(.3)
                            ]
                          ).createShader(rect);

                        },
                        child: new Container(
                          width: screenSize.height * .3,
                          height: screenSize.height * .3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.yellow,
                          ),
                        ),
                      ),
                    ),

                    new Align(
                      child: new Container(
                        width: screenSize.height * .26,
                        padding: EdgeInsets.only(top: screenSize.height * .033) ,
                        child: new TweenAnimationBuilder(
                          tween: Tween(begin: 0.0,end: 1.0),
                          duration: Duration(milliseconds: 1300),
                          builder: (contxt,value,child){
                            return new Column(
                              children: [

                                // sun icon
                                new Opacity(
                                  opacity: value,
                                  child: new Image.asset(
                                    'assets/image/sun.png',
                                    width: screenSize.width * .17,
                                    height: screenSize.width * .17,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // percent
                                new Padding(
                                  padding: EdgeInsets.only(top: 0,bottom: screenSize.width * .02),
                                  child: new Text(
                                    '${(value * 69.5).toStringAsFixed(1).toString()}%',
                                    style: AppTextStyle.font15.copyWith(
                                      color: Colors.white,
                                      fontSize: screenSize.width * .072,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),

                                // text
                                new Text(
                                  'Sunlight capacity',
                                  style: AppTextStyle.font15.copyWith(
                                    color: Colors.white.withOpacity(.3),
                                    fontSize: screenSize.width * .032
                                  ),
                                ),

                              ],
                            );
                          }
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.grey2,
                          shape: BoxShape.circle
                        ),
                      ),
                    )

                  ],

                ),
              );

            }
          )

        ],
      ),

      decoration: myBoxDecoration.copyWith(
        color: AppColor.grey2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.white.withOpacity(.06)
          )
        ]
      ),
    );
  }


  static Widget activity(Size screenSize,BuildContext context,Function ontap){
    return new Container(
      margin: EdgeInsets.only(top: screenSize.height * .05),
      width: screenSize.width,
      height: screenSize.height * .6,
      child: new Column(
        children: [
          
          space(screenSize.height * .03),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              new Text(
                '    Today Activity',
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

          space(screenSize.height * .02),

          todayActivityList(screenSize,context,ontap),

          space(screenSize.height * .03),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              new Text(
                '    Done Activity',
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

          downActivityList(screenSize),

        ],
      ),
      decoration: myBoxDecoration.copyWith(
        color: AppColor.grey2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.white.withOpacity(.08)
          )
        ]
      ),
    );
  }


  static Widget todayActivityList(Size screenSize,BuildContext context,Function ontap){
  
    List imagePath = [
      'assets/image/cactus_h1.svg',
      'assets/image/cactus_h2.svg',
    ];

    return Container(
      width: screenSize.width,
      height: screenSize.height * .12,  
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(imagePath.length, (index) {
          return new GestureDetector(
            onTap: ontap,
            child: new Container(
              margin: EdgeInsets.only(
                left: index == 0 ? screenSize.width * .1 : 8,
                right: 8
              ),
              child: new Row(
                children: [

                  // image
                  new Container(
                    margin: EdgeInsets.only(left: 20),
                    child: new Hero(
                      tag: 'cactus${index}',
                      child: new SvgPicture.asset(imagePath[index])
                    ),
                  ),

                  // name
                  new Container(
                    margin: EdgeInsets.only(left: 30),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          'Cactus Name:',
                          style: AppTextStyle.font15.copyWith(
                            color: Colors.white.withOpacity(.3),
                            fontSize: screenSize.width * .035,
                          ),
                        ),

                        space(4),

                        new Text(
                          'Bunny Ear Cuctus',
                          style: AppTextStyle.font15.copyWith(
                            color: Colors.white,
                            fontSize: screenSize.width * .037,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // cloud
                  new Container(
                    margin: EdgeInsets.only(top: screenSize.height * .025,right: screenSize.width * .04,),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/image/cloud.png',
                      width: screenSize.width * .08,
                    ),
                  )

                ],
              ),
              decoration: myBoxDecoration.copyWith(
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          );
        }),
      ),
    );

  }


  static Widget downActivityList(Size screenSize){
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * .1),
      width: screenSize.width,
      height: screenSize.height * .22,
      child: new Column(
        children: [

          space(screenSize.height * .02),
          
          // item1
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // icon
                new ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: new Container(
                    width: screenSize.width * .15,
                    height: screenSize.width * .15,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/water.png',
                      width: screenSize.width * .13,
                      height: screenSize.width * .13,
                    ),
                    decoration: myBoxDecoration.copyWith(
                      border: Border.all(
                        color: Colors.white.withOpacity(.07),
                        width: 1,
                      ),
                      color: Colors.transparent
                    ),
                  ),
                ),

                // name
                new Container(
                  margin: EdgeInsets.only(left: 30),
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

                      space(4),

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

                // more
                new Expanded(
                  child: new Stack(
                    alignment: Alignment.centerRight,
                    children: [

                      new Container(
                         margin: EdgeInsets.only(right: screenSize.width * .07),
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        alignment: Alignment.center,
                        child:new SvgPicture.asset('assets/image/c_ca2.svg'),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),


                      new Container(
                        margin: EdgeInsets.only(right: screenSize.width * .035),
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        alignment: Alignment.center,
                        child: new SvgPicture.asset('assets/image/c_ca1.svg'),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),

                      new Container(
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        child: new Icon(Icons.add,color: Colors.white,size: 17,),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),

                    ],
                  ),
                ) 
              ],
            ),
          ),

          space(screenSize.height * .015),

          new Container(
            width: screenSize.width * .5,
            height: 1,
            color: AppColor.grey3,
          ),

          space(screenSize.height * .015),

          // item2
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // icon
                new ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: new Container(
                    width: screenSize.width * .15,
                    height: screenSize.width * .15,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/sun.png',
                      width: screenSize.width * .09,
                      height: screenSize.width * .09,
                    ),
                    decoration: myBoxDecoration.copyWith(
                      border: Border.all(
                        color: Colors.white.withOpacity(.07),
                        width: 1,
                      ),
                      color: Colors.transparent
                    ),
                  ),
                ),

                // name
                new Container(
                  margin: EdgeInsets.only(left: 30),
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

                      space(4),

                      new Text(
                        'Cactus sunbathing',
                        style: AppTextStyle.font15.copyWith(
                          color: Colors.white,
                          fontSize: screenSize.width * .037,
                        ),
                      ),
                    ],
                  ),
                ),

                // more
                new Expanded(
                  child: new Stack(
                    alignment: Alignment.centerRight,
                    children: [

                      new Container(
                         margin: EdgeInsets.only(right: screenSize.width * .07),
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        alignment: Alignment.center,
                        child:new SvgPicture.asset('assets/image/c_ca2.svg'),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),


                      new Container(
                        margin: EdgeInsets.only(right: screenSize.width * .035),
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        alignment: Alignment.center,
                        child: new SvgPicture.asset('assets/image/c_ca1.svg'),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),

                      new Container(
                        width: screenSize.width * .07,
                        height: screenSize.width * .07,
                        child: new Icon(Icons.add,color: Colors.white,size: 17,),
                        decoration: myBoxDecoration.copyWith(
                          border: Border.all(
                            color: Colors.white.withOpacity(.1),
                            width: 1,
                          ),
                          color: AppColor.grey2
                        ),
                      ),

                    ],
                  ),
                ) 
              ],
            ),
          ),
        ],
      ),
    );
  }


  static Widget bottomNavigation(Size screenSize){
    return new Container(
      width: screenSize.width,
      height: screenSize.height * .1,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * .07),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          new SvgPicture.asset('assets/image/home.svg'),

          new SvgPicture.asset('assets/image/Heart.svg'),

          new SvgPicture.asset('assets/image/profile.svg'),

          new SvgPicture.asset('assets/image/bag.svg'),

        ],
      ),
    );
  }


  static Widget space(double height){
    return new Container(
      height: height,
    );
  }


}