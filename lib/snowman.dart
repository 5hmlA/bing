import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnowMain extends StatefulWidget {
  @override
  _SnowMainState createState() => _SnowMainState();
}

class _SnowMainState extends State<SnowMain> with SingleTickerProviderStateMixin {
  final _snows = List.generate(33, (index) => Snow());
  late AnimationController _animationControl;

  @override
  void initState() {
    _animationControl = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animationControl.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationControl,
      builder: (BuildContext context, Widget? child) {
        return Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.blueAccent, Colors.white],
          //     stops: [0.95, 0.98],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: CustomPaint(
            painter: SnowMainPainter(_snows),
          ),
        );
      },
    );
  }
}

class SnowMainPainter extends CustomPainter {
  final snowPaint = Paint()..color = Colors.white;
  double sizeFactor = 1;
  final List<Snow> _snows;

  SnowMainPainter(this._snows);

  @override
  void paint(Canvas canvas, Size size) async {
    // Offset headCenter = size.center(Offset.zero);
    // Offset headCenter = Offset(size.width / 2, size.height - 90);
    //
    // canvas.drawCircle(headCenter, 30 * sizeFactor, snowPaint);

    // canvas.drawOval(
    //     Rect.fromCenter(
    //         center: headCenter.translate(0, 66 * sizeFactor),
    //         width: 90 * sizeFactor,
    //         height: 98 * sizeFactor),
    //     snowPaint);

    _snows.forEach((snow) {
      snow.paint(canvas, size, snowPaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

double velocityfun() => Random().nextInt(1).toDouble() + 1;

double sizeRadiusfun() => Random().nextInt(2).toDouble() + 2;

class Snow {
  double locationX = Random().nextDouble() * 1000;
  double locationY = Random().nextDouble() * 1000;
  double velocity = velocityfun();

  double radius = sizeRadiusfun();

  void paint(Canvas canvas, Size size, Paint paint) {
    locationX += Random().nextDouble() - Random().nextDouble();
    locationY += velocity;
    if (locationY > size.height) {
      locationY = Random().nextDouble() * 10;
      locationX = Random().nextInt(size.width.floor()).toDouble();
      radius = sizeRadiusfun();
      velocity = velocityfun();
    }
    if (locationX > size.width) {
      locationX = Random().nextInt(size.width.floor()).toDouble();
    }
    canvas.drawCircle(Offset(locationX, locationY), radius, paint);
  }
}
