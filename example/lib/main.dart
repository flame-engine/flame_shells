import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import 'package:flame_shells/flame_shells.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  final game = MyGame();
  final shell = FlameShell(game: game);
  runApp(shell);
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
    if (button == FlameShellButton.DPAD_UP) {
      _yVelocity = -1;
    } else if (button == FlameShellButton.DPAD_DOWN) {
      _yVelocity = 1;
    }

    if (button == FlameShellButton.DPAD_LEFT) {
      _xVelocity = -1;
    } else if (button == FlameShellButton.DPAD_RIGHT) {
      _xVelocity = 1;
    }

    if (button == FlameShellButton.ACTION_B) {
      _paint = Paint()..color = const Color(0xFF00FF00);
    }

    if (button == FlameShellButton.ACTION_A) {
      _paint = Paint()..color = const Color(0xFF0000FF);
    }
  }

  @override
  void onShellButtonTapUp(button) {
    if (button == FlameShellButton.DPAD_UP ||
        button == FlameShellButton.DPAD_DOWN) {
      _yVelocity = 0;
    }

    if (button == FlameShellButton.DPAD_LEFT ||
        button == FlameShellButton.DPAD_RIGHT) {
      _xVelocity = 0;
    }

    if (button == FlameShellButton.ACTION_B ||
        button == FlameShellButton.ACTION_A) {
      _paint = Paint()..color = const Color(0xFFFFFFFF);
    }
  }
}
