import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BingDunDun extends StatefulWidget {
  @override
  _BingDunDunState createState() => _BingDunDunState();

}

class _BingDunDunState extends State<BingDunDun> with SingleTickerProviderStateMixin {
  late AnimationController _animationControl;

  @override
  void initState() {
    _animationControl = AnimationController(vsync: this, duration: Duration(seconds: 10));
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white],
              stops: [0.95, 0.98],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CustomPaint(
            painter: BinDunDunPainter(),
          ),
        );
      },
    );
  }
}

class BinDunDunPainter extends CustomPainter {
  final snowPaint = Paint()..color = Colors.white;
  double sizeFactor = 1;

  BinDunDunPainter();

  @override
  void paint(Canvas canvas, Size size) async {
    // Offset headCenter = size.headCenter(Offset.zero);
    // Offset headCenter = Offset(size.width / 2, size.height - 90);

    // PathMetric
    // canvas.drawCircle(headCenter, 30 * sizeFactor, snowPaint);
    //
    // canvas.drawOval(Rect.fromCenter(center: headCenter.translate(0, 66 * sizeFactor), width: 90 * sizeFactor, height: 98 * sizeFactor), snowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
