import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/UI/Elements/ProfitLossIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:provider/provider.dart';

import '../../../../Providers/ThemeProvider.dart';

class HomePortfolio extends StatelessWidget {
  const HomePortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Value",
              maxLines: 1,
              style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).textColor1,
                  fontSize: 17,
                  fontWeight: FontWeight.w400)),
          Row(
            children: [
              Text(MainUtils().formatPrice(0.0),
                  maxLines: 1,
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).textColor1,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const Spacer(),
              GlassmorphicContainer(
                  height: 35,
                  width: 110,
                  borderRadius: 50,
                  linearGradient: Provider.of<ThemeProvider>(context)
                      .appBarBackgroundColorGradient,
                  border: 2,
                  blur: 10,
                  child: Center(
                      child: ProfitLossIndicator(isLoss: false, percenatge: 0)),
                  borderGradient:
                      Provider.of<ThemeProvider>(context).appBarBorderGradient),
            ],
          )
        ],
      ),
    );
  }
}
