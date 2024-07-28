import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:fluttertaiko/game/game.dart';

class VirtualTaiko extends PositionedEntity with HasGameRef<Fluttertaiko> {
  VirtualTaiko()
      : super(
          behaviors: [TappingBehavior()],
        ) {}
}

class TappingBehavior extends Behavior<VirtualTaiko>
    with TapCallbacks, HasGameRef<Fluttertaiko> {
  @override
  void onTapDown(TapDownEvent event) {}
}
