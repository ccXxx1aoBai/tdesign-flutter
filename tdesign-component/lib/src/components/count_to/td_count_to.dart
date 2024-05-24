import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

enum TDCountToStyle {
  normal, // 正计数
  reverse, // 倒计数
}

class TDCountTo extends StatefulWidget {
  const TDCountTo({
    Key? key,
    this.start = 0,
    required this.end,
    required this.duration,
    this.controller,
    this.decimals = 0,
    this.textStyle,
    this.auto = true,
    this.style = TDCountToStyle.normal,
    this.curve = Curves.linear,
  }) : super(key: key);

  /// 起始值
  final double start;

  /// 结束值
  final double end;

  /// 动画时长
  final Duration duration;

  /// controller 用于用户控制动画
  final AnimationController? controller;

  /// 小数位
  final int decimals;

  /// 文字样式
  final TextStyle? textStyle;

  /// 自动播放动画
  final bool? auto;

  /// 计数类型
  final TDCountToStyle? style;

  /// 动画效果
  final Curve? curve;

  @override
  _TDCountToState createState() => _TDCountToState();

}

class _TDCountToState extends State<TDCountTo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _curvedAnimation;
  late Tween<double> _tween;
  double value = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? AnimationController(
      vsync: this,
      duration: widget.duration
    )..addListener(() {
      setState(() {
        value = _curvedAnimation.value;
      });
    });
    var start = widget.start;
    var end = widget.end;
    if(widget.style == TDCountToStyle.reverse) {
      start = widget.end;
      end = widget.start;
    }
    _tween = Tween(begin: start, end: end);
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: widget.curve!).drive(_tween);
    if(widget.auto! && widget.controller == null) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curvedAnimation,
      builder: (BuildContext context, Widget? child) {
        return Text('${value.toStringAsFixed(widget.decimals)}', style: widget.textStyle);
      },
    );
  }
}