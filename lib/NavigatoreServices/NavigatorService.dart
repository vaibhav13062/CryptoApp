import 'package:flutter/material.dart';

class NavigatorService extends PageRouteBuilder {
  final Widget page;

  NavigatorService(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 850),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: Container(color: Colors.transparent, child: page),
              );
            });
}

class FadeNavigatorService extends PageRouteBuilder {
  final Widget page;

  FadeNavigatorService(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: Container(color: Colors.transparent, child: page),
              );
            });
}
