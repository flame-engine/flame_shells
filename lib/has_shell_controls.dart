import 'package:flame/game.dart';
import './button.dart';

mixin HasShellControls on Game {
  void onShellButtonTap(FlameShellButton button) {}
  void onShellButtonTapDown(FlameShellButton button) {}
  void onShellButtonTapUp(FlameShellButton button) {}
  // TODO tapCancel?
}
