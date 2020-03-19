# Flame Shells

Beautiful and easy to use widgets that emulates console shells for your Flame game.

Right now this package bundles only a single shell, emulating classic portable consoles from early 90s, featuring a direction pad and two action buttons

## How to use

```dart
import 'package:flame_shells/flame_shells.dart';

void main() async {
  final game = MyGame();
  final shell = FlameShell(game: game);
  runApp(shell);
}

class MyGame extends Game with HasShellControls {
  @override
  void onShellButtonTapDown(button) {
    // handle tap down
  }

  @override
  void onShellButtonTapUp(button) {
    // handle tap up
  }
}
```
