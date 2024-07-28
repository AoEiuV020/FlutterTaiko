import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class NoteComponent extends PositionComponent {
  final Paint _paint;
  final double speed; // 音符的移动速度
  final Vector2 centerPosition; // 圆心位置

  NoteComponent({
    required this.centerPosition,
    required Vector2 size,
    required Color color,
    required this.speed,
  }) : _paint = Paint()..color = color {
    // 计算实际位置
    this.position = centerPosition - size / 2;
    this.size = size;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle((size / 2).toOffset(), size.x / 2, _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 音符从右向左移动
    position.x -= speed * dt;

    // 检查音符是否已经移出屏幕
    if (position.x + size.x < 0) {
      removeFromParent();
    }
  }
}
class LargeRedNote extends NoteComponent {
  LargeRedNote(Vector2 centerPosition, double speed)
      : super(
          centerPosition: centerPosition,
          size: Vector2(50, 50), // 大音符尺寸
          color: Colors.red, // 红色
          speed: speed, // 移动速度
        );
}

class SmallBlueNote extends NoteComponent {
  SmallBlueNote(Vector2 centerPosition, double speed)
      : super(
          centerPosition: centerPosition,
          size: Vector2(30, 30), // 小音符尺寸
          color: Colors.blue, // 蓝色
          speed: speed, // 移动速度
        );
}
