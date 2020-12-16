import 'package:flame_shells/flame_shells.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './console_button_painters/circular.dart';
import './console_button_painters/square.dart';

typedef ButtonEvent = Function(int buttonId);

enum ConsoleButtonStyleType {
  CIRCULAR,
  SQUARE,
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
  final Widget child;

  ConsoleButton({
    @required this.id,
    this.child,
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
        painter = CircularButtonPainter(
            color: widget.button.style.color, pressed: _pressed, depth: widget.button.style.depth,
        );
        break;
      case ConsoleButtonStyleType.SQUARE:
        painter = SquareButtonPainter(
            color: widget.button.style.color, pressed: _pressed, depth: widget.button.style.depth,
        );
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
          child: widget.button.child != null ? Container(
              padding: _pressed ? EdgeInsets.only(top: widget.button.style.depth / 2) : null,
              child: Center(child: widget.button.child),
          ) : null,
        ),
      ),
    );
  }
}

