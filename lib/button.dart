enum FlameShellButton {
  DPAD_UP,
  DPAD_DOWN,
  DPAD_LEFT,
  DPAD_RIGHT,

  ACTION_A,
  ACTION_B,
}

typedef OnTapDown = void Function(FlameShellButton button);
typedef OnTapUp = void Function(FlameShellButton button);
typedef OnTap = void Function(FlameShellButton button);
