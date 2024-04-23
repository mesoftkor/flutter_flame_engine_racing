import 'package:flame/components.dart';

class LifeHeart extends SpriteComponent {
  Sprite heartSprite;

  LifeHeart({required position, required this.heartSprite})
      : super(
            position: position, //오브젝트의 위치
            size: Vector2.all(24), //오브젝트의 사이즈
            anchor: Anchor.bottomCenter); //anchor 오브젝트의 앵커

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //스프라이트 이미지를 적용
    sprite = heartSprite;
  }
}
