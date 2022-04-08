import 'package:crypto_app/UI/Elements/AnimatedWidgets/ZoomAnimation.dart';
import 'package:flutter/widgets.dart';

import '../../Elements/TopAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const TopAppBar(),
          ZoomAnimation(
              finalWidth: 200,
              initialWidth: 25,
              finalHeight: 200,
              milliseconds: 1000,
              initialHeight: 25,
              child: Image.asset("assets/images/splashlogo.png")),
        ],
      ),
    );
  }
}
