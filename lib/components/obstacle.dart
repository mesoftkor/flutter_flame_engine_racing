import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'player.dart';

class Obstacle extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Sprite obstacleSprite;

  Obstacle({required position, required this.obstacleSprite})
      : super(
            position: position, //오브젝트의 위치
            size: Vector2.all(64), //오브젝트의 사이즈
            anchor: Anchor.bottomCenter); //anchor 오브젝트의 앵커

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = obstacleSprite;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    //자동으로 장애물이 아래로 이동되도록 처리
    position.y = position.y + 5; //아래로 계속 이동
    if (position.y - size.y > gameRef.size.y) {
      removeFromParent(); //자기자신 객체를 삭제한다.
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    if (other is Player) {
      removeFromParent();
    } else {
      super.onCollisionStart(intersectionPoints, other);
    }
  }
}
