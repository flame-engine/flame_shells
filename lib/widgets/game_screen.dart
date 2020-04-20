import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:meta/meta.dart';

class GameScreen extends StatelessWidget {
  final Game game;

  GameScreen({
    @required this.game,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      color: const Color(0xFF000000),
      margin: const EdgeInsets.all(10),
      child: ClipRect(child: game.widget),
    );
  }
}
