import 'package:flutter/material.dart';
import 'dart:math';

import './console_button.dart';
import '../button.dart';

class ActionButtonsGroup extends StatelessWidget {
  final OnTap onTap;
  final OnTapUp onTapUp;
  final OnTapDown onTapDown;

  ActionButtonsGroup({
    @required this.onTap,
    @required this.onTapDown,
    @required this.onTapUp,
  });

  @override
  Widget build(BuildContext ctx) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonSize = min(50.0, constraints.maxWidth / 2 * 0.8);

      return Center(
          child: Container(
        width: buttonSize * 2.3,
        height: buttonSize * 2,
        child: Stack(children: [
          Positioned(
            left: buttonSize * 0.1,
            top: buttonSize / 2,
            child: ConsoleButton(
              size: buttonSize,
              button: FlameShellButton.ACTION_B,
              color: Theme.of(ctx).primaryColorDark,
              onTap: onTap,
              onTapUp: onTapUp,
              onTapDown: onTapDown,
            ),
          ),
          Positioned(
            left: buttonSize * 1.3,
            child: ConsoleButton(
              size: buttonSize,
              button: FlameShellButton.ACTION_A,
              color: Theme.of(ctx).primaryColorDark,
              onTap: onTap,
              onTapUp: onTapUp,
              onTapDown: onTapDown,
            ),
          ),
        ]),
      ));
    });
  }
}
