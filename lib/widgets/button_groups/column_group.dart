import 'package:flame_shells/flame_shells.dart';
import 'package:flutter/material.dart';

import '../console_button.dart';

import './button_groups.dart';

class ColumnGroup extends ButtonGroup {
  final List<ConsoleButton> buttons;
  final EdgeInsets buttonMargin;

  ColumnGroup({
    @required this.buttons,
    this.buttonMargin,
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
    return ColumnGroupWidget(
      group: this,
      game: game,
    );
  }
}

class ColumnGroupWidget extends StatelessWidget {
  final ColumnGroup group;
  final HasShellControls game;

  ColumnGroupWidget({
    @required this.group,
    @required this.game,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: Column(
          children: group.buttons.map((button) {
        return Container(
            margin: group.buttonMargin,
            child: ConsoleButtonWidget(game: game, button: button),
        );
      }).toList()),
    );
  }
}
