import 'package:flame_shells/flame_shells.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../utils/color_util.dart';

typedef ButtonEvent = Function(int buttonId);

enum ConsoleButtonStyleType {
  CIRCULAR,
}

class ConsoleButtonStyle {
  final Color color;
  final double size;
  final double depth;
  final ConsoleButtonStyleType type;

  const ConsoleButtonStyle({
    this.color = const Color(0xFF3d34eb),
    this.size = 50,
    this.depth = 10,
    this.type = ConsoleButtonStyleType.CIRCULAR,
  });
}

class ConsoleButton {
  final int id;
  final ConsoleButtonStyle style;

  ConsoleButton({
    @required this.id,
    this.style = const ConsoleButtonStyle(),
  });
}

class ConsoleButtonWidget extends StatefulWidget {
  final HasShellControls game;
  final ConsoleButton button;

  ConsoleButtonWidget({
    @required this.game,
    @required this.button,
  });

  @override
  State createState() => _ConsoleButtonWidgetState();
}

class _ConsoleButtonWidgetState extends State<ConsoleButtonWidget> {
  bool _pressed = false;

  void _release() {
    setState(() {
      _pressed = false;
    });
    widget.game.onShellButtonTapUp(widget.button.id);
  }

  void _press() {
    setState(() {
      _pressed = true;
    });
    widget.game.onShellButtonTapDown(widget.button.id);
  }

  @override
  Widget build(BuildContext context) {
    CustomPainter painter;

    switch (widget.button.style.type) {
      case ConsoleButtonStyleType.CIRCULAR:
        painter = _CircularButtonPainter(
            color: widget.button.style.color, pressed: _pressed);
        break;
    }

    return Container(
      width: widget.button.style.size,
      height: widget.button.style.size,
      child: GestureDetector(
        onTapUp: (_) => _release(),
        onTapDown: (_) => _press(),
        onTapCancel: () => _release(),
        onTap: () => widget.game.onShellButtonTap(widget.button.id),
        child: CustomPaint(
          painter: painter,
        ),
      ),
    );
  }
}

class _CircularButtonPainter extends CustomPainter {
  final Color color;
  final bool pressed;

  _CircularButtonPainter({
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
      darkPaint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, (size.height / 2) + (pressed ? 2 : 0)),
      size.width / 2,
      paint,
    );

    // TODO depth
  }

  @override
  bool shouldRepaint(_CircularButtonPainter oldDelegate) =>
      color != oldDelegate.color;
}
