import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../button.dart';

class ConsoleButton extends StatelessWidget {

  final OnTapUp onTapUp;
  final OnTapDown onTapDown;
  final OnTap onTap;
  final Color color;
  final FlameShellButton button;

  final double size;

  ConsoleButton({
    @required this.color,
    @required this.button,
    @required this.onTapDown,
    @required this.onTapUp,
    @required this.onTap,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: size, height: size, child: GestureDetector(
        onTapUp: (_) => onTapUp(button),
        onTapDown: (_) => onTapDown(button),
        onTap: () => onTap(button),
        child: CustomPaint(painter: _ButtonPainter(color: color)),
    ));
  }
}

class _ButtonPainter extends CustomPainter {
  final Color color;

  _ButtonPainter({
    @required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    canvas.drawCircle(
        Offset(size.width / 2, size. height / 2),
        size.width / 2,
        paint
    );
  }

  @override
  bool shouldRepaint(_ButtonPainter oldDelegate) => color != oldDelegate.color;
}
