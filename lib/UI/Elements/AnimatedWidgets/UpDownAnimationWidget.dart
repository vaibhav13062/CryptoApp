import 'dart:async';

import 'package:flutter/widgets.dart';

class UpDownAnimationWidget extends StatefulWidget {
  final Widget child;
  final int milliSeconds;
  final int startPosition;
  final bool isBottomToTop;
   UpDownAnimationWidget(
      {Key? key,
      required this.child,
      required this.milliSeconds,
      required this.isBottomToTop,
      required this.startPosition})
      : super(key: key);

  @override
  State<UpDownAnimationWidget> createState() => _UpDownAnimationWidgetState();
}

class _UpDownAnimationWidgetState extends State<UpDownAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliSeconds));

    if (widget.isBottomToTop) {
      animation = Tween<double>(begin: widget.startPosition.toDouble(), end: 0)
          .animate(controller)
        ..addListener(() {
          setState(() {});
        });
      controller.forward();
    } else {
      animation =
          Tween<double>(begin: (widget.startPosition.toDouble() * -1), end: 0)
              .animate(controller)
            ..addListener(() {
              setState(() {});
            });
      controller.forward();
    }

    Timer(Duration.zero, () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: Offset(0, animation.value),
        child: AnimatedOpacity(
            duration: Duration(milliseconds: widget.milliSeconds ~/ 2),
            opacity: opacity,
            child: widget.child),
      ),
    ));
  }
}
