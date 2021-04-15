import 'package:flutter/material.dart';
import 'dynamic_background.dart';

abstract class MyDynamicStateful extends StatefulWidget {
  MyDynamicStateful(
      {Key key, this.title, @required this.statelessWidget, this.startState})
      : super(key: key);
  final String title;
  final StatelessWidget statelessWidget;
  final bool startState;

  @override
  BackgroundState createState() =>
      BackgroundState(statelessWidget: statelessWidget, startState: startState);
}

class BackgroundState extends State<MyDynamicStateful>
    with SingleTickerProviderStateMixin {
  final StatelessWidget statelessWidget;
  AnimationController animationController;
  bool startState = false;

  BackgroundState({@required this.statelessWidget, bool startState});

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

    // animationController.forward();
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
