import 'package:crypto_app/UI/Elements/AnimatedWidgets/LeftRightAnimationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftRightAnimationWidget(
      milliSeconds: 500,
      isLeftToRight: false,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: SizedBox(
            width: double.maxFinite,
            height: 35,
            child: Row(
              children: [
                Image.asset("assets/images/splashlogo.png"),
                const Spacer(),
                IconButton(
                    splashRadius: 20,
                    alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/filter.svg",
                    ))
              ],
            )),
      ),
    );
  }
}
