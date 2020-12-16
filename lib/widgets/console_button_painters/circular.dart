import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../utils/color_util.dart';

class CircularButtonPainter extends CustomPainter {
  final Color color;
  final bool pressed;
  final double depth;

  CircularButtonPainter({
    @required this.color,
    @required this.pressed,
    @required this.depth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final darkPaint = Paint()..color = darkenColor(color, 0.2);

    if (depth > 0) {
      canvas.drawCircle(
          Offset(size.width / 2, (size.height / 2) + depth),
          size.width / 2,
          darkPaint,
      );
    }

    canvas.drawCircle(
      Offset(size.width / 2, (size.height / 2) + (pressed ? depth / 2 : 0)),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularButtonPainter oldDelegate) =>
      color != oldDelegate.color;
}
