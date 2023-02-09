import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  // 왜 꼭 get을 써야하는건가.. 그냥 함수로 사용하면 안되는건가?..
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
