import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaiko/game/components/note_component.dart';
import 'package:fluttertaiko/game/fluttertaiko.dart';
import 'package:fluttertaiko/game/game.dart';

class BeetmapComponent extends PositionComponent
    with HasGameRef<Fluttertaiko>, TapCallbacks {
  final double centerY;
  final Paint paint = Paint()..color = Colors.black;
  BeetmapComponent(this.centerY);

  @override
  FutureOr<void> onLoad() {
    size
      ..x = game.size.x
      ..y = size.x / 10;
    position.y = centerY - size.y / 2;
  }

  @override
  void onTapDown(TapDownEvent event) {
    add(LargeRedNote(Vector2(size.x + 50, size.y / 2), 250));
  }

  @override
  void onTapUp(TapUpEvent event) {
    add(SmallBlueNote(Vector2(size.x + 50, size.y / 2), 250));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }
}
