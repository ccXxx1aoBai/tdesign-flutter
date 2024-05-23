import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

class TDCountToPage extends StatelessWidget {
  const TDCountToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: TDTheme.of(context).grayColor2,
        child: ExamplePage(
          title: tdTitle(context),
          desc: "用于展示数字动画",
          exampleCodeGroup: "countTo",
          children: [
            ExampleModule(title: "基础功能", children: [
              ExampleItem(
                ignoreCode: true,
                desc: '时分秒',
                center: false,
                padding: const EdgeInsets.only(left: 16),
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildSimple);
                },
              )
            ])
          ],
        )
    );
  }
}

@Demo(group: 'countTo')
Widget _buildSimple(BuildContext context) {
  return const TDCountTo(start: 0, end: 3000, duration: Duration(seconds: 3));
}