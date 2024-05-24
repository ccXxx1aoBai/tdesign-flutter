import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
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
            ExampleModule(title: "组件类型", children: [
              ExampleItem(
                desc: '正计数',
                center: false,
                padding: const EdgeInsets.only(left: 16),
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildSimple);
                },
              ),

              ExampleItem(
                desc: '倒计数',
                center: false,
                padding: const EdgeInsets.only(left: 16),
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildReverse);
                },
              ),

              ExampleItem(
                desc: '带小数',
                center: false,
                padding: const EdgeInsets.only(left: 16),
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildDecimals);
                },
              )
            ]),

            ExampleModule(title: "自定义组件", children: [
              ExampleItem(
                desc: '动画类型',
                center: false,
                padding: const EdgeInsets.only(left: 16),
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildAnimation);
                },)
            ])
          ],
        )
    );
  }
}

@Demo(group: 'countTo')
Widget _buildSimple(BuildContext context) {
  return const TDCountTo(start: 0, end: 3000, duration: Duration(seconds: 1));
}

@Demo(group: 'countTo')
Widget _buildReverse(BuildContext context) {
  return const TDCountTo(start: 0, end: 2000, duration: Duration(seconds: 1), style: TDCountToStyle.reverse);
}

@Demo(group: 'countTo')
Widget _buildDecimals(BuildContext context) {
  return const TDCountTo(start: 0, end: 2568.58, duration: Duration(seconds: 10), decimals: 2);
}

@Demo(group: 'countTo')
Widget _buildAnimation(BuildContext context) {
  return const TDCountTo(start: 0, end: 2568.58, decimals: 2, duration: Duration(seconds: 10), curve: Curves.easeInOut);
}

@Demo(group: 'countTo')
Widget _buildController(BuildContext context) {
  var controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1)
  );
  return const TDCountTo(start: 0, end: 1500, decimals: 2, duration: Duration(seconds: 10), curve: Curves.easeInOut, controller: controller);
}