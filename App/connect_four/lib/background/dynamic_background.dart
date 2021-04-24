import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({Animation<double> animation})
      : firstPaint = Paint()
          ..color = Constants.BackgroundFirstLayer.withOpacity(0.8)
          ..style = PaintingStyle.fill,
        secondPaint = Paint()
          ..color = Constants.BackgroundSecondLayer
          ..style = PaintingStyle.fill,
        thirdPaint = Paint()
          ..color = Constants.BackgroundThirdLayer
          ..style = PaintingStyle.fill,
        firstLine = Paint()
          ..color = Constants.BackgroundFirstLine.withOpacity(0.8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
        secondLine = Paint()
          ..color = Constants.BackgroundSecondLine.withOpacity(0.8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
        liquidAnim = CurvedAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
          parent: animation,
        ),
        thirdAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        secondAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.8,
              curve: Interval(0, 0.9, curve: SpringCurve())),
          reverseCurve: Curves.easeInCirc,
        ),
        firstAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnim;
  final Animation<double> firstAnim;
  final Animation<double> secondAnim;
  final Animation<double> thirdAnim;

  final Paint firstPaint;
  final Paint secondPaint;
  final Paint thirdPaint;
  final Paint firstLine;
  final Paint secondLine;

  void paintFirstLayer(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, firstAnim.value),
    );
    addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, firstAnim.value),
        lerpDouble(0, size.height, firstAnim.value),
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
    canvas.drawPath(path, firstPaint);
    canvas.drawPath(path, secondLine);
  }

  void paintSecondLayer(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        secondAnim.value,
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
          lerpDouble(size.height / 6, size.height / 3, secondAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, secondAnim.value),
        ),
      ],
    );

    canvas.drawPath(path, secondPaint);
    canvas.drawPath(path, firstLine);
  }

  void paintThirdLayer(Size size, Canvas canvas) {
    if (thirdAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, thirdAnim.value),
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

      canvas.drawPath(path, thirdPaint);
      canvas.drawPath(path, secondLine);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintFirstLayer(size, canvas);

    paintSecondLayer(size, canvas);

    paintThirdLayer(size, canvas);
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
