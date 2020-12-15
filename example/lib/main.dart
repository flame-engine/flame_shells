import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import 'package:flame_shells/flame_shells.dart';

const DPAD_UP = 1;
const DPAD_DOWN = 2;
const DPAD_LEFT = 3;
const DPAD_RIGHT = 4;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();

  final game = MyGame();
  final shell = FlameShell(
    game: game,
    gamePadding: const EdgeInsets.all(50),
    backgroundColor: const Color(0xFF3277a8),
    buttonGroups: [
      DirectionPadGroup(
        left: 20,
        bottom: 20,
        upButtonId: DPAD_UP,
        downButtonId: DPAD_DOWN,
        leftButtonId: DPAD_LEFT,
        rightButtonId: DPAD_RIGHT,
      ),
    ],
  );
  runApp(
    MaterialApp(
      home: Scaffold(body: shell),
    ),
  );
}

class MyGame extends Game with HasShellControls {
  Rect _rect = const Rect.fromLTWH(10, 10, 50, 50);
  Paint _paint = Paint()..color = const Color(0xFFFFFFFF);

  double _xVelocity = 0.0;
  double _yVelocity = 0.0;

  @override
  void update(double dt) {
    _rect = _rect.translate(_xVelocity * 100 * dt, _yVelocity * 100 * dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(_rect, _paint);
  }

  @override
  void onShellButtonTapDown(button) {
    if (button == DPAD_UP) {
      _yVelocity = -1;
    } else if (button == DPAD_DOWN) {
      _yVelocity = 1;
    }

    if (button == DPAD_LEFT) {
      _xVelocity = -1;
    } else if (button == DPAD_RIGHT) {
      _xVelocity = 1;
    }

    //if (button == ACTION_B) {
    //  _paint = Paint()..color = const Color(0xFF00FF00);
    //}

    //if (button == FlameShellButton.ACTION_A) {
    //  _paint = Paint()..color = const Color(0xFF0000FF);
    //}
  }

  @override
  void onShellButtonTapUp(button) {
    if (button == DPAD_UP || button == DPAD_DOWN) {
      _yVelocity = 0;
    }

    if (button == DPAD_LEFT || button == DPAD_RIGHT) {
      _xVelocity = 0;
    }

    //if (button == ACTION_B ||
    //    button == ACTION_A) {
    //  _paint = Paint()..color = const Color(0xFFFFFFFF);
    //}
  }
}
