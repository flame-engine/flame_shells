import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '../has_shell_controls.dart';
import './button_groups/button_groups.dart';

class FlameShell extends StatelessWidget {
  final HasShellControls game;
  final GameWidget gameWidget;
  final List<ButtonGroup> buttonGroups;
  final EdgeInsets gamePadding;
  final Color backgroundColor;

  FlameShell({
    @required this.game,
    this.gameWidget,
    this.buttonGroups = const [],
    this.gamePadding = EdgeInsets.zero,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final _gameWidget = Container(
      padding: gamePadding,
      child: gameWidget ?? GameWidget(game: game),
    );

    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: _gameWidget,
          ),
          for (final group in buttonGroups)
            Positioned(
              top: group.top,
              left: group.left,
              right: group.right,
              bottom: group.bottom,
              child: group.toWidget(game),
            ),
        ],
      ),
    );
  }
}
