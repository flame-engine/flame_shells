import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

import 'package:flame_shells/flame_shells.dart';

import './game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();

  final game = MyGame();

  const dpadStyle = const ConsoleButtonStyle(
      color: const Color(0xFF777777),
      type: ConsoleButtonStyleType.SQUARE,
  );
  final shell = FlameShell(
    game: game,
    gamePadding: const EdgeInsets.only(
        top: 20,
        left: 175,
        right: 175,
        bottom: 20,
    ),
    backgroundColor: const Color(0xFFC5C5C5),
    buttonGroups: [
      CrossGroup(
        left: 20,
        bottom: 20,
        topButton: ConsoleButton(
            id: DPAD_UP,
            style: dpadStyle,
            child: const Icon(Icons.keyboard_arrow_up),
        ),
        bottomButton: ConsoleButton(
            id: DPAD_DOWN,
            style: dpadStyle,
            child: const Icon(Icons.keyboard_arrow_down),
        ),
        leftButton: ConsoleButton(
            id: DPAD_LEFT,
            style: dpadStyle,
            child: const Icon(Icons.keyboard_arrow_left),
        ),
        rightButton: ConsoleButton(
            id: DPAD_RIGHT,
            style: dpadStyle,
            child: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
      ColumnGroup(
        bottom: 20,
        right: 20,
        buttonMargin: const EdgeInsets.all(10),
        buttons: [
          ConsoleButton(
            id: ACTION_B,
            child: const Text('B'),
            style: const ConsoleButtonStyle(color: const Color(0xFF00FF00)),
          ),
          ConsoleButton(
            id: ACTION_A,
            child: const Text('A'),
            style: const ConsoleButtonStyle(color: const Color(0xFF0000FF)),
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
