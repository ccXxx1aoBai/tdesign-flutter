import 'package:flutter/material.dart';

class TDCountTo extends StatefulWidget {
  const TDCountTo({
    Key? key,
    this.start = 0,
    required this.end,
    required this.duration,
  }) : super(key: key);

  /// 起始值
  final int start;

  /// 结束值
  final int end;

  /// 动画时长
  final Duration duration;

  @override
  _TDCountToState createState() => _TDCountToState();

}

class _TDCountToState extends State<TDCountTo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = IntTween(begin: widget.start, end: widget.end).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Text('${_animation.value}', style: const TextStyle(fontSize: 18),);
      },
    );
  }
}