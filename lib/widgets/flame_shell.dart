import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './console.dart';
import '../has_shell_controls.dart';

class FlameShell extends StatelessWidget {
  final HasShellControls game;

  FlameShell({
    @required this.game
  });

  @override
  Widget build(BuildContext context) {
    // TODO themes on a file of its own
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF247fa3),
        primaryColorDark: Color(0xFF165873),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFebae34),
        primaryColorDark: Color(0xFFa37924),
      ),
      home: Console(game: game),
    );
  }
}

