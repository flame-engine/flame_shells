import 'package:flame/game.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame_shells/flame_shells.dart';

import 'dart:ui';

const DPAD_UP = 1;
const DPAD_DOWN = 2;
const DPAD_LEFT = 3;
const DPAD_RIGHT = 4;

const ACTION_A = 5;
const ACTION_B = 6;

class MyGame extends Game with HasShellControls {
  Rect _rect = const Rect.fromLTWH(10, 10, 50, 50);
  Paint _paint = Paint()..color = const Color(0xFFFFFFFF);

  final Vector2 direction = Vector2.zero();

  @override
  void update(double dt) {
    final speed = direction * 100 * dt;
    final newRect = _rect.translate(speed.x, speed.y);

    if (newRect.left > 0 &&
        newRect.right < size.x &&
        newRect.top > 0 &&
        newRect.bottom < size.y) {
      _rect = newRect;
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(_rect, _paint);
  }

  @override
  void onShellButtonTapDown(button) {
    if (button == DPAD_UP) {
      direction.y = -1;
    } else if (button == DPAD_DOWN) {
      direction.y = 1;
    }

    if (button == DPAD_LEFT) {
      direction.x = -1;
    } else if (button == DPAD_RIGHT) {
      direction.x = 1;
    }

    if (button == ACTION_B) {
      _paint = Paint()..color = const Color(0xFF00FF00);
    }

    if (button == ACTION_A) {
      _paint = Paint()..color = const Color(0xFF0000FF);
    }
  }

  @override
  void onShellButtonTapUp(button) {
    if (button == DPAD_UP || button == DPAD_DOWN) {
      direction.y = 0;
    }

    if (button == DPAD_LEFT || button == DPAD_RIGHT) {
      direction.x = 0;
    }

    if (button == ACTION_B || button == ACTION_A) {
      _paint = Paint()..color = const Color(0xFFFFFFFF);
    }
  }
}
