import 'package:flame_shells/flame_shells.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../console_button.dart';

import './button_groups.dart';

class CrossGroup extends ButtonGroup {
  final ConsoleButton topButton;
  final ConsoleButton bottomButton;
  final ConsoleButton leftButton;
  final ConsoleButton rightButton;

  CrossGroup({
    this.topButton,
    this.bottomButton,
    this.leftButton,
    this.rightButton,
    double top,
    double bottom,
    double left,
    double right,
  }) : super(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
        );

  @override
  Widget toWidget(HasShellControls game) {
    return CrossGroupWidget(
      group: this,
      game: game,
    );
  }
}

class CrossGroupWidget extends StatelessWidget {
  final CrossGroup group;
  final HasShellControls game;

  CrossGroupWidget({
    @required this.group,
    @required this.game,
  });

  @override
  Widget build(BuildContext ctx) {
    final sizes = [
      group.topButton.style.size,
      group.bottomButton.style.size,
      group.leftButton.style.size,
      group.rightButton.style.size,
    ];

    final buttonSize = sizes.fold(
      0.0,
      (double total, double current) => math.max(total, current),
    );

    return Container(
      width: buttonSize * 3,
      height: buttonSize * 3,
      child: Stack(children: [
        Positioned(
          left: buttonSize,
          child: ConsoleButtonWidget(
            game: game,
            button: group.topButton,
          ),
        ),
        Positioned(
          top: buttonSize,
          child: ConsoleButtonWidget(
            game: game,
            button: group.leftButton,
          ),
        ),
        Positioned(
          top: buttonSize,
          left: buttonSize * 2,
          child: ConsoleButtonWidget(
            game: game,
            button: group.rightButton,
          ),
        ),
        Positioned(
          top: buttonSize * 2,
          left: buttonSize,
          child: ConsoleButtonWidget(
            game: game,
            button: group.bottomButton,
          ),
        ),
      ]),
    );
  }
}
