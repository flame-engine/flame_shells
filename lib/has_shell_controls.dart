import 'package:flame/game.dart';

mixin HasShellControls on Game {
  void onShellButtonTap(int button) {}
  void onShellButtonTapDown(int button) {}
  void onShellButtonTapUp(int button) {}
  // TODO tapCancel?
}
