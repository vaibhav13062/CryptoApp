import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/UI/Elements/AnimatedWidgets/LeftRightAnimationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:provider/provider.dart';

import '../../../../Constants/CryptoImagesConstantsUrl.dart';
import '../../../../Providers/ThemeProvider.dart';
import '../../../../Providers/TopCurrenciesProvider.dart';
import '../../../Elements/ProfitLossIndicator.dart';

class MyCurrenciesSection extends StatelessWidget {
  MyCurrenciesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allCurrencies =
        Provider.of<TopCurrenciesProvider>(context).allCurrencies;
    return Container(
      child: Column(
        children: [
          MyCurrenciesSectionAppBar(),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: allCurrencies.length - 10,
              itemBuilder: (BuildContext context, int index) {
                return Bounceable(
                    onTap: () {
                      print("OnTap");
                    },
                    child: LeftRightAnimationWidget(
                      isLeftToRight: false,
                      milliSeconds: index <= 5 ? 150 * (index+1) : 600,
                      child: MyCurrencyItem(
                        symbol: allCurrencies[index].symbol,
                        heading: allCurrencies[index].name,
                        percentageChng24:
                            allCurrencies[index].quote.Inr.percent_change_24h,
                        inrAmount: allCurrencies[index].quote.Inr.price,
                        slug: allCurrencies[index].slug,
                      ),
                    ));
              },
            ),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}

class MyCurrencyItem extends StatelessWidget {
  final String heading;
  final String symbol;
  final String slug;
  final double percentageChng24;
  final double inrAmount;
  MyCurrencyItem(
      {Key? key,
      required this.heading,
      required this.symbol,
      required this.inrAmount,
      required this.percentageChng24,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Row(
        children: [
          GlassmorphicContainer(
            height: 65,
            width: 65,
            blur: 8,
            borderRadius: 60,
            border: 3,
            linearGradient: Provider.of<ThemeProvider>(context)
                .appBarBackgroundColorGradient,
            borderGradient:
                Provider.of<ThemeProvider>(context).appBarBorderGradient,
            child: Center(
              child: SvgPicture.asset(
                CryptoImagesantsUrl().cryptoImages[slug]!,
                height: 30,
                width: 30,
              ),
            ),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Provider.of<ThemeProvider>(context).textColor1,
                          fontSize: 18),
                    ),
                    Text(
                      MainUtils().formatPrice(inrAmount),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Provider.of<ThemeProvider>(context).textColor1,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      symbol,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeProvider>(context).textColor2,
                          fontSize: 18),
                    ),
                    ProfitLossIndicator(
                        isLoss: percentageChng24 < 0,
                        percenatge: percentageChng24)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCurrenciesSectionAppBar extends StatelessWidget {
  MyCurrenciesSectionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MY CURRENCIES",
            style: TextStyle(
                color: Provider.of<ThemeProvider>(context).textColor1,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Manage",
                    style: TextStyle(
                        color: Provider.of<ThemeProvider>(context).textColor1,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Provider.of<ThemeProvider>(context).textColor1,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
