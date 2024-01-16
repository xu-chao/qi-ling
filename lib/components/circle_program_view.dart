
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circle_program.dart';

class CircleProgressView extends StatefulWidget {
  ///背景圆形色值
  final Color backgroundColor;

  ///当前进度 0-100
  final double progress;

  ///进度条颜色
  final Color progressColor;

  ///圆环宽度
  final double progressWidth;

  ///宽度
  final double width;

  ///高度
  final double height;

  CircleProgressView(
      {required Key key,
        required this.progress,
        required this.width,
        required this.height,
        this.backgroundColor = Colors.grey,
        this.progressColor = Colors.blue,
        this.progressWidth = 10.0})
      : super(key: key);

  @override
  _CircleProgressViewState createState() => _CircleProgressViewState();
}
class _CircleProgressViewState extends State<CircleProgressView>
    with TickerProviderStateMixin {
  static const double _Pi = 3.14;
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Tween<double> tween;
  late double oldProgress;

  @override
  void initState() {
    super.initState();
    oldProgress = widget.progress;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    tween = Tween();
    tween.begin = 0.0;
    tween.end = oldProgress;
    animation = tween.animate(curvedAnimation);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }
  //这里是在重新赋值进度时，再次刷新动画
  void startAnimation() {
    controller.reset();
    tween.begin = oldProgress;
    tween.end = widget.progress;
    animation = tween.animate(curvedAnimation);
    controller.forward();
    oldProgress = widget.progress;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (oldProgress != widget.progress) {
      startAnimation();
    }
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(10),
      child: CustomPaint(
        painter: ProgressPaint(animation.value / 50 * _Pi, widget.progressWidth,
            widget.backgroundColor, widget.progressColor),
        child: Center(child: Text("${animation.value.toInt()}%")),
      ),
    );
  }
}
