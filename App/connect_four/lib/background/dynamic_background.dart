import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({Animation<double> animation})
      : upperPaint = Paint()
          ..color = Constants.BackgroundUpperLayer
          ..style = PaintingStyle.fill,
        middlePaint = Paint()
          ..color = Constants.BackgroundMiddleLayer
          ..style = PaintingStyle.fill,
        bottomPaint = Paint()
          ..color = Constants.BackgroundBottomLayer
          ..style = PaintingStyle.fill,
        upperLine = Paint()
          ..color = Constants.BackgroundUpperLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
        middleLine = Paint()
          ..color = Constants.BackgroundMiddleLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
        bottomLine = Paint()
          ..color = Constants.BackgroundBottomLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
        liquidAnim = CurvedAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
          parent: animation,
        ),
        upperAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        middleAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.8,
              curve: Interval(0, 0.9, curve: SpringCurve())),
          reverseCurve: Curves.easeInCirc,
        ),
        bottomAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnim;
  final Animation<double> upperAnim;
  final Animation<double> middleAnim;
  final Animation<double> bottomAnim;

  final Paint upperPaint;
  final Paint middlePaint;
  final Paint bottomPaint;

  final Paint upperLine;
  final Paint middleLine;
  final Paint bottomLine;

  void paintBottomLayer(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, bottomAnim.value),
    );
    addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, bottomAnim.value),
        lerpDouble(0, size.height, bottomAnim.value),
      ),
      Point(
        lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnim.value),
        lerpDouble(size.height / 2, size.height / 4 * 3, liquidAnim.value),
      ),
      Point(
        size.width,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
      ),
    ]);
    canvas.drawPath(path, bottomPaint);
    canvas.drawPath(path, bottomLine);
  }

  void paintMiddleLayer(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        middleAnim.value,
      ),
    );
    addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 5,
          lerpDouble(size.height / 4, size.height / 2, liquidAnim.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 3, middleAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, middleAnim.value),
        ),
      ],
    );

    canvas.drawPath(path, middlePaint);
    canvas.drawPath(path, middleLine);
  }

  void paintUpperLayer(Size size, Canvas canvas) {
    if (upperAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, upperAnim.value),
      );

      addPointsToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 4,
          0,
        ),
      ]);

      canvas.drawPath(path, upperPaint);
      canvas.drawPath(path, upperLine);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintBottomLayer(size, canvas);

    paintMiddleLayer(size, canvas);

    paintUpperLayer(size, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void addPointsToPath(Path path, List<Point> points) {
    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });

  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}
