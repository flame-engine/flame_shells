import 'package:flutter/material.dart';
import 'dart:math';

import './console_button.dart';
import '../button.dart';

class DirectionPad extends StatelessWidget {
  final OnTap onTap;
  final OnTapDown onTapDown;
  final OnTapUp onTapUp;

  DirectionPad({
    @required this.onTap,
    @required this.onTapDown,
    @required this.onTapUp,
  });

  Widget build(BuildContext ctx) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final buttonSize = min(50.0, constraints.maxWidth / 3 * 0.8);
          return Center(child: Container(
              margin: EdgeInsets.all(5),
              width: buttonSize * 3,
              height: buttonSize * 3,
              child: Stack(children: [
                Positioned(
                    left: buttonSize,
                    child: ConsoleButton(
                        size: buttonSize,
                        button: FlameShellButton.DPAD_UP,
                        color: Theme.of(ctx).primaryColor,
                        onTap: onTap,
                        onTapUp: onTapUp,
                        onTapDown: onTapDown,
                    ),
                ),
                Positioned(
                    top: buttonSize,
                    child: ConsoleButton(
                        size: buttonSize,
                        button: FlameShellButton.DPAD_LEFT,
                        color: Theme.of(ctx).primaryColor,
                        onTap: onTap,
                        onTapUp: onTapUp,
                        onTapDown: onTapDown,
                    ),
                ),
                Positioned(
                    top: buttonSize,
                    left: buttonSize * 2,
                    child: ConsoleButton(
                        size: buttonSize,
                        button: FlameShellButton.DPAD_RIGHT,
                        color: Theme.of(ctx).primaryColor,
                        onTap: onTap,
                        onTapUp: onTapUp,
                        onTapDown: onTapDown,
                    ),
                ),
                Positioned(
                    top: buttonSize * 2,
                    left: buttonSize,
                    child: ConsoleButton(
                        size: buttonSize,
                        button: FlameShellButton.DPAD_DOWN,
                        color: Theme.of(ctx).primaryColor,
                        onTap: onTap,
                        onTapUp: onTapUp,
                        onTapDown: onTapDown,
                    ),
                ),
              ]),
          ));
        }
    );
  }
}

