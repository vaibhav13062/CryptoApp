import 'package:flutter/material.dart';

class AnimatedNavigator extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  AnimatedNavigator({required this.page, this.direction = AxisDirection.up})
      : super(
          pageBuilder: (context, animation, secondryAnimation) => page,
          transitionDuration: Duration(milliseconds: 300),
          reverseTransitionDuration: Duration(milliseconds: 200),
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondryAnimation,
    Widget page,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: page,
      );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.left:
        return Offset(1, 0);
      case AxisDirection.right:
        return Offset(-1, 0);
    }
  }
}
