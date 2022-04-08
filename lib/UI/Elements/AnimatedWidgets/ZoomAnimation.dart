import 'dart:async';

import 'package:flutter/widgets.dart';

class ZoomAnimation extends StatefulWidget {
  final double initialHeight;
  final double initialWidth;
  final double finalHeight;
  final double finalWidth;
  final int milliseconds;
  final Widget child;
  int? delay;

  ZoomAnimation(
      {Key? key,
      required this.finalHeight,
      required this.finalWidth,
      required this.initialHeight,
      required this.initialWidth,
      required this.milliseconds,
      this.delay,
      required this.child})
      : super(key: key);

  @override
  State<ZoomAnimation> createState() => _ZoomAnimationState();
}

class _ZoomAnimationState extends State<ZoomAnimation> {
  double opacity = 0.0;
  double height = double.minPositive;
  double width = double.minPositive;

  @override
  void initState() {
    setState(() {
      height = widget.initialHeight;
      width = widget.initialWidth;
      opacity = 0.0;
    });

    Timer(Duration(milliseconds: widget.delay == null ? 100 : widget.delay!),
        () {
      setState(() {
        height = widget.finalHeight;
        width = widget.finalWidth;
        opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: widget.milliseconds),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.milliseconds),
        height: height,
        curve: Curves.easeInOutBack,
        width: width,
        child: widget.child,
      ),
    );
  }
}
