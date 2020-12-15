import 'package:flame_shells/flame_shells.dart';
import 'package:flutter/material.dart';

import '../console_button.dart';

import './button_groups.dart';

class DirectionPadGroup extends ButtonGroup {
  final int upButtonId;
  final int downButtonId;
  final int leftButtonId;
  final int rightButtonId;

  DirectionPadGroup({
    this.upButtonId,
    this.downButtonId,
    this.leftButtonId,
    this.rightButtonId,
    double top,
    double bottom,
    double left,
    double right,
    ConsoleButtonStyle buttonStyle = const ConsoleButtonStyle(),
  }) : super(
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            buttonStyle: buttonStyle);

  @override
  Widget toWidget(HasShellControls game) {
    return DirectionPad(
      group: this,
      game: game,
    );
  }
}

class DirectionPad extends StatelessWidget {
  final DirectionPadGroup group;
  final HasShellControls game;

  DirectionPad({
    @required this.group,
    @required this.game,
  });

  @override
  Widget build(BuildContext ctx) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonSize = group.buttonStyle.size;
      return Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          width: buttonSize * 3,
          height: buttonSize * 3,
          child: Stack(children: [
            Positioned(
              left: buttonSize,
              child: ConsoleButton(
                game: game,
                id: group.upButtonId,
                style: group.buttonStyle,
              ),
            ),
            Positioned(
              top: buttonSize,
              child: ConsoleButton(
                game: game,
                id: group.leftButtonId,
                style: group.buttonStyle,
              ),
            ),
            Positioned(
              top: buttonSize,
              left: buttonSize * 2,
              child: ConsoleButton(
                game: game,
                id: group.rightButtonId,
                style: group.buttonStyle,
              ),
            ),
            Positioned(
              top: buttonSize * 2,
              left: buttonSize,
              child: ConsoleButton(
                game: game,
                id: group.downButtonId,
                style: group.buttonStyle,
              ),
            ),
          ]),
        ),
      );
    });
  }
}
