import 'package:crypto_app/Providers/ThemeProvider.dart';
import 'package:crypto_app/UI/Elements/AnimatedWidgets/LeftRightAnimationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TopAppBar extends StatelessWidget {
  TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
          width: double.maxFinite,
          height: 35,
          child: Row(
            children: [
              Image.asset("assets/images/splashlogo.png"),
              Spacer(),
              IconButton(
                  splashRadius: 20,
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/svg/filter.svg",
                    color: Provider.of<ThemeProvider>(context).textColor1,
                  ))
            ],
          )),
    );
  }
}
