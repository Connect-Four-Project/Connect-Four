import 'package:connect_four/Screens/Welcome/body.dart';
import 'package:connect_four/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dynamic_background.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  BackgroundState createState() => BackgroundState();
}

class BackgroundState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  StatelessWidget statelessWidget = Text("Hi");
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    statelessWidget = Body();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: animationController.view),
            ),
          ),
          statelessWidget
        ],
      ),
    );
  }
}
