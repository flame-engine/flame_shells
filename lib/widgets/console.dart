import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './game_screen.dart';
import './direction_pad.dart';
import './action_buttons_group.dart';
import '../has_shell_controls.dart';

class _LandscapeConsole extends StatelessWidget {

  final HasShellControls game;

  _LandscapeConsole({
    @required this.game,
  });

  Widget build(BuildContext ctx) {
    return Row(children: [
      DirectionPad(
              onTap: game.onShellButtonTap,
              onTapUp: game.onShellButtonTapUp,
              onTapDown: game.onShellButtonTapDown,
      ),
      Expanded(child: GameScreen(game: game)),
      ActionButtonsGroup(
              onTap: game.onShellButtonTap,
              onTapUp: game.onShellButtonTapUp,
              onTapDown: game.onShellButtonTapDown,
      ),
    ]);
  }
}

class _PortraitConsole extends StatelessWidget {

  final HasShellControls game;

  _PortraitConsole({
    @required this.game,
  });

  Widget build(BuildContext ctx) {
    return Column(children: [
      Expanded(child: GameScreen(game: game)),
      Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(child: DirectionPad(
                    onTap: game.onShellButtonTap,
                    onTapUp: game.onShellButtonTapUp,
                    onTapDown: game.onShellButtonTapDown,
            )),
            Expanded(child: ActionButtonsGroup(
                    onTap: game.onShellButtonTap,
                    onTapUp: game.onShellButtonTapUp,
                    onTapDown: game.onShellButtonTapDown,
            )),
      ])),
    ]);
  }
}

class Console extends StatefulWidget {
  final HasShellControls game;

  Console({
    @required this.game,
  });

  @override
  State createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(body: SafeArea(child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _PortraitConsole(
                game: widget.game,
            );
          } else {
            return _LandscapeConsole(
                game: widget.game,
            );
          }
        }
    )));
  }
}
