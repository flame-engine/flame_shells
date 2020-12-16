export './cross_group.dart' show CrossGroup;
export './row_group.dart' show RowGroup;
export './column_group.dart' show ColumnGroup;

import 'package:flutter/material.dart';
import 'package:flame_shells/flame_shells.dart';

abstract class ButtonGroup {
  final double top;
  final double bottom;
  final double left;
  final double right;

  ButtonGroup({
    @required this.top,
    @required this.bottom,
    @required this.left,
    @required this.right,
  });

  Widget toWidget(HasShellControls game);
}
