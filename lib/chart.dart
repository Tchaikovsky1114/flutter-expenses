import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  // 왜 꼭 get을 써야하는건가.. 그냥 함수로 사용하면 안되는건가?..
  // Getter/setter는 데이터를 올바르게 사용하기 위해 선호됩니다.
  // 데이터를 직접 사용하면 업데이트하고 싶지 않을 때 업데이트할 수 있으며
  // 이러한 유형의 논리적 실수는 감지하고 수정하는 데 너무 많은 시간이 걸립니다.
  // 또한 데이터를 조작하는 안전한 방법입니다.
  // 캡슐화는 데이터와 데이터를 조작하는 기능을 결합하고 외부 간섭과 오용으로부터 모두 안전하게 보호하는
  // 객체 지향 프로그래밍 개념입니다. 데이터 캡슐화는 데이터 은닉이라는 중요한 OOP 개념으로 이어졌습니다.

  // 해석 필요
  // 이 ( String get getName())가 유효하지 않은 구문이라고 생각하십니까? 게터에는 인수가 없어야 합니까? 귀하의 질문에 대한 답변으로 공급자 패턴은 일반적으로 개인 필드 + 게터 및 세터를 사용합니다. 아이디어는 변수 _a가 를 사용하여 '얻을' 수 있고 를 사용하여 get a => _a설정할 수 있다는 것 set a(T newA){}입니다. setter 내부 는 일반적으로 앱을 '새로 고침' notifyListeners()하는 변수( )를 변경한 후 호출 됩니다._a = newA

  // List<Map<String, Object>> get groupedTransactionValues {
  //   return List.generate(7, (index) {});
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const [],
      ),
    );
  }
}
