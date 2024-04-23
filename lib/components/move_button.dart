import 'package:flame/components.dart';
import 'package:flame/events.dart';

class MoveButton extends SpriteComponent with TapCallbacks {
  Sprite moveButtonSprite;
  Function(bool) onTapMoveButton; //클릭 이벤트 전달 함수

  //이동버튼이 최초 생성될때 초기화 되는 값
  MoveButton({
    required String direction, //클릭된 버튼의 위치를 결정하기위한 방향 매개변수
    required position,
    required this.moveButtonSprite,
    required this.onTapMoveButton,
  }) : super(
          position: position, //오브젝트의 위치
          size: Vector2.all(60), //오브젝트의 사이즈
          anchor: direction == 'left' ? Anchor.bottomLeft : Anchor.bottomRight,
        ); //anchor 오브젝트의 앵커

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //스프라이트 이미지를 적용
    sprite = moveButtonSprite;
  }

  @override
  void onTapDown(TapDownEvent event) {
    // 버튼을 누르고 있을때
    onTapMoveButton.call(true);
  }

  @override
  void onTapUp(TapUpEvent event) {
    // 버튼을 땠을때
    onTapMoveButton.call(false);
  }
}
