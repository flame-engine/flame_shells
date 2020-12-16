import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../utils/color_util.dart';

class SquareButtonPainter extends CustomPainter {
  final Color color;
  final bool pressed;
  final double depth;

  SquareButtonPainter({
    @required this.color,
    @required this.pressed,
    @required this.depth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final darkPaint = Paint()..color = darkenColor(color, 0.2);

    if (depth > 0) {
      canvas.drawRect(
          Rect.fromLTWH(
              0, depth, size.width, size.height
          ),
          darkPaint,
      );
    }

    canvas.drawRect(
        Rect.fromLTWH(
            0, pressed ? depth / 2 : 0, size.width, size.height
        ),
        paint,
    );
  }

  @override
  bool shouldRepaint(SquareButtonPainter oldDelegate) =>
      color != oldDelegate.color;
}
