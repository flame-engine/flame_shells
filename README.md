[![Pub](https://img.shields.io/pub/v/flame_shells.svg?style=popout)](https://pub.dartlang.org/packages/flame_shells)
[![Build Status - Travis](https://img.shields.io/github/workflow/status/flame-engine/flame_shells/Test/master?label=tests)]

# Flame Shells

Beautiful and easy to use widgets that emulates console shells for your Flame game.

Right now this package bundles only a single shell, emulating classic portable consoles from early 90s, featuring a direction pad and two action buttons.

![](https://user-images.githubusercontent.com/835641/77119016-59667b00-6a14-11ea-91f2-3282590fed6c.png)

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
