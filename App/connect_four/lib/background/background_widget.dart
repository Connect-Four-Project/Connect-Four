import 'package:flutter/material.dart';
import 'dynamic_background.dart';

abstract class MyDynamicStateful extends StatefulWidget {
  MyDynamicStateful(
      {Key key, @required this.statelessWidget, this.moveFromUpToDown})
      : super(key: key);
  final StatelessWidget statelessWidget;
  final bool moveFromUpToDown;

  @override
  BackgroundState createState() => BackgroundState(
      statelessWidget: statelessWidget, startState: moveFromUpToDown);
}

class BackgroundState extends State<MyDynamicStateful>
    with SingleTickerProviderStateMixin {
  final StatelessWidget statelessWidget;
  final bool startState;
  AnimationController animationController;

  BackgroundState({@required this.statelessWidget, this.startState});

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (startState) {
      Future.delayed(Duration(milliseconds: 1000), () {
        animationController.forward();
      });
    } else {
      animationController.forward(from: 1.0);
      Future.delayed(Duration(milliseconds: 1000), () {
        animationController.reverse();
      });
    }

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
