export './direction_pad.dart' show DirectionPadGroup;

import 'package:flutter/material.dart';
import 'package:flame_shells/flame_shells.dart';

import '../console_button.dart';

import 'package:meta/meta.dart';

abstract class ButtonGroup {
  final double top;
  final double bottom;
  final double left;
  final double right;

  final ConsoleButtonStyle buttonStyle;

  ButtonGroup({
    @required this.top,
    @required this.bottom,
    @required this.left,
    @required this.right,
    this.buttonStyle = const ConsoleButtonStyle(),
  });

  Widget toWidget(HasShellControls game);
}
