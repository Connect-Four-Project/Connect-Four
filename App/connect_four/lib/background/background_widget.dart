import 'package:connect_four/background/background_position.dart';
import 'package:flutter/material.dart';
import 'dynamic_background.dart';

abstract class MyDynamicStateful extends StatefulWidget {
  MyDynamicStateful({Key key, @required this.statelessWidget})
      : super(key: key);
  final StatelessWidget statelessWidget;

  @override
  BackgroundState createState() => BackgroundState(
      statelessWidget: statelessWidget,
      moveFromUpToDown: BackgroundPosition.getPosition());
}

class BackgroundState extends State<MyDynamicStateful>
    with SingleTickerProviderStateMixin {
  final StatelessWidget statelessWidget;
  final bool moveFromUpToDown;
  AnimationController animationController;

  BackgroundState({@required this.statelessWidget, this.moveFromUpToDown});

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    double val = 0;
    if (!moveFromUpToDown) val = 1.0;
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5),
        reverseDuration: Duration(seconds: 7),
        value: val);
    super.initState();
  }

  void moveDown() {
    try {
      animationController.forward().whenComplete(moveUp);
      BackgroundPosition.toggle();
    } catch (ignored) {}
  }

  void moveUp() {
    try {
      animationController.reverse().whenComplete(moveDown);
      BackgroundPosition.toggle();
    } catch (ignored) {}
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      if (moveFromUpToDown) {
        moveDown();
      } else {
        moveUp();
      }
    });

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
