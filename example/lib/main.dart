import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

import 'package:flame_shells/flame_shells.dart';

import './game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();

  final game = MyGame();

  const dpadStyle = const ConsoleButtonStyle(color: const Color(0x33A9A9A9));
  final shell = FlameShell(
    game: game,
    gamePadding: const EdgeInsets.all(50),
    backgroundColor: const Color(0xFF3277a8),
    buttonGroups: [
      CrossGroup(
        left: 20,
        bottom: 20,
        topButton: ConsoleButton(id: DPAD_UP, style: dpadStyle),
        bottomButton: ConsoleButton(id: DPAD_DOWN, style: dpadStyle),
        leftButton: ConsoleButton(id: DPAD_LEFT, style: dpadStyle),
        rightButton: ConsoleButton(id: DPAD_RIGHT, style: dpadStyle),
      ),
      RowGroup(
        bottom: 20,
        right: 20,
        buttonMargin: const EdgeInsets.all(10),
        buttons: [
          ConsoleButton(
            id: ACTION_B,
            style: const ConsoleButtonStyle(color: const Color(0x3300FF00)),
          ),
          ConsoleButton(
            id: ACTION_A,
            style: const ConsoleButtonStyle(color: const Color(0x330000FF)),
          ),
        ],
      ),
    ],
  );
  runApp(
    MaterialApp(
      home: Scaffold(body: shell),
    ),
  );
}
