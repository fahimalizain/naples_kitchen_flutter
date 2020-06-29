import 'package:flutter/material.dart';
import './screens/weather_screen.dart';

class ParentingAnimationWidget extends StatefulWidget {
  @override
  ParentingAnimationWidgetState createState() =>
      ParentingAnimationWidgetState();
}

class ParentingAnimationWidgetState extends State<ParentingAnimationWidget>
    with TickerProviderStateMixin {
  Animation growingAnimation;
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    growingAnimation = Tween(begin: 0.0, end: 50.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    animation = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //  controller.reverse();
          Navigator.of(context).pushNamed(WeatherScreen.routeName);
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              backgroundColor: Colors.black,
              body: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                      child: new Center(
                          child:
                              new ListView(shrinkWrap: true, children: <Widget>[
                    Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Center(
                            child: AnimatedBuilder(
                          animation: growingAnimation,
                          builder: (BuildContext context, Widget child) {
                            return new Center(
                                child: Container(
                                    child: Image(
                              image: AssetImage("assets/images/logo.png"),
                              height: growingAnimation.value * 2,
                              width: growingAnimation.value * 2,
                            )));
                          },
                        ))),
                  
                  ])))));
        });
  }
}
