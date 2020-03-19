import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../button.dart';
import '../utils/color_util.dart';

class ConsoleButton extends StatefulWidget {
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
  State createState() => _ConsoleButtonState();
}

class _ConsoleButtonState extends State<ConsoleButton> {

  bool _pressed = false;

  void _release() {
    setState(() {
      _pressed = false;
    });
    widget.onTapUp(widget.button);
  }

  void _press() {
    setState(() {
      _pressed = true;
    });
    widget.onTapDown(widget.button);
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: widget.size, height: widget.size, child: GestureDetector(
        onTapUp: (_) => _release(),
        onTapDown: (_) => _press(),
        onTapCancel: () => _release(),
        onTap: () => widget.onTap(widget.button),
        child: CustomPaint(painter: _ButtonPainter(color: widget.color, pressed: _pressed)),
    ));
  }
}

class _ButtonPainter extends CustomPainter {
  final Color color;
  final bool pressed;

  _ButtonPainter({
    @required this.color,
    @required this.pressed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final darkPaint = Paint()..color = darkenColor(color, 0.2);

    canvas.drawCircle(
        Offset(size.width / 2, (size.height / 2) + 5),
        size.width / 2,
        darkPaint
    );

    canvas.drawCircle(
        Offset(size.width / 2, (size. height / 2) + (pressed ? 2 : 0)),
        size.width / 2,
        paint
    );
  }

  @override
  bool shouldRepaint(_ButtonPainter oldDelegate) => color != oldDelegate.color;
}
