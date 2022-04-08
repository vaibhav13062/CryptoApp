import 'dart:async';

import 'package:flutter/widgets.dart';

class FadeInOutAnimationWidget extends StatefulWidget {
  final Widget child;
  final int milliSeconds;
  final bool isFadeIn;
  const FadeInOutAnimationWidget(
      {Key? key,
      required this.milliSeconds,
      required this.child,
      required this.isFadeIn})
      : super(key: key);

  @override
  State<FadeInOutAnimationWidget> createState() =>
      _FadeInOutAnimationWidgetState();
}

class _FadeInOutAnimationWidgetState extends State<FadeInOutAnimationWidget> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: Duration(milliseconds: widget.milliSeconds),
        opacity: opacity,
        child: widget.child);
  }

  @override
  void initState() {
    super.initState();
    if (widget.isFadeIn) {
      opacity = 0.0;
    } else {
      opacity = 1.0;
    }

    Timer(Duration.zero, () {
      if (widget.isFadeIn) {
        setState(() {
          opacity = 1.0;
        });
      } else {
        setState(() {
          opacity = 0.0;
        });
      }
    });
  }
}
