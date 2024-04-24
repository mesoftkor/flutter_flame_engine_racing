import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'obstacle.dart';

//레이싱 카 오브젝트
class Player extends SpriteComponent with CollisionCallbacks {
  Sprite playerSprite;
  final VoidCallback damageCallback;

  Player(
      {required position,
      required this.playerSprite,
      required this.damageCallback})
      : super(
            position: position, //오브젝트의 위치
            size: Vector2.all(48), //오브젝트의 사이즈
            anchor: Anchor.bottomCenter); //anchor 오브젝트의 앵커

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //스프라이트 이미지를 적용
    sprite = playerSprite;

    //충돌감지 컴포넌트를 레이싱카에 적용
    add(RectangleHitbox());
  }

  @override
  onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    //충돌 대상이 장애물인 경우에만 데미지가 입었다는 처리를 게임 전체에 알림
    if (other is Obstacle) {
      damageCallback.call();
    } else {
      super.onCollisionStart(intersectionPoints, other);
    }
  }
}
