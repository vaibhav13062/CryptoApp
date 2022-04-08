import 'dart:async';

import 'package:flutter/widgets.dart';

class LeftRightAnimationWidget extends StatefulWidget {
  final Widget child;
  final int milliSeconds;
  final bool isLeftToRight;
  const LeftRightAnimationWidget(
      {Key? key,
      required this.child,
      required this.milliSeconds,
      required this.isLeftToRight})
      : super(key: key);

  @override
  State<LeftRightAnimationWidget> createState() =>
      _LeftRightAnimationWidgetState();
}

class _LeftRightAnimationWidgetState extends State<LeftRightAnimationWidget>
    with SingleTickerProviderStateMixin {
  double opacity = 0.0;

  late AnimationController controller;
  late Animation<Offset> offset;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliSeconds));

    if (widget.isLeftToRight) {
      offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
          .animate(controller);
      controller.forward();
    } else {
      offset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
          .animate(controller);
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
    return SlideTransition(
      position: offset,
      child: AnimatedOpacity(
          duration: Duration(milliseconds: widget.milliSeconds ~/ 2),
          opacity: opacity,
          child: widget.child),
    );
  }
}
