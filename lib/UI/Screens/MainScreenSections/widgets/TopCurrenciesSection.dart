import 'package:crypto_app/Constants/AppColors.dart';
import 'package:crypto_app/Constants/CryptoImagesConstantsUrl.dart';
import 'package:crypto_app/Constants/DeviceSizeConfig.dart';
import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/Providers/TopCurrenciesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../../../Elements/ProfitLossIndicator.dart';

class TopCurrenciesSection extends StatelessWidget {
  const TopCurrenciesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allCurrencies =
        Provider.of<TopCurrenciesProvider>(context).allCurrencies;
    return Container(
      child: Column(
        children: [
          const TopCurrenciesAppBar(),
          Provider.of<TopCurrenciesProvider>(context).isLoaded
              ? Container(
                  height: 270,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: allCurrencies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Bounceable(
                          onTap: () {
                            print("OnTap");
                          },
                          child: TopCurrencyItem(
                            symbol: allCurrencies[index].symbol,
                            heading: allCurrencies[index].name,
                            percentageChng24: allCurrencies[index]
                                .quote
                                .Inr
                                .percent_change_24h,
                            inrAmount: allCurrencies[index].quote.Inr.price,
                            slug: allCurrencies[index].slug,
                          ));
                    },
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class TopCurrencyItem extends StatelessWidget {
  final String heading;
  final String symbol;
  final String slug;
  final double percentageChng24;
  final double inrAmount;
  const TopCurrencyItem(
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
      margin: const EdgeInsets.only(left: 15),
      child: GlassmorphicContainer(
        width: 235,
        height: 270,
        blur: 8,
        borderRadius: 8,
        border: 3,
        linearGradient: AppColors.appBarBackgroundColorGradient,
        borderGradient: AppColors.appBarBorderGradient,
        child: Container(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 125,
                        child: Text(
                          heading,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(symbol,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.textColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                  Spacer(),
                  ProfitLossIndicator(
                    isLoss: percentageChng24 < 0,
                    percenatge: percentageChng24,
                  )
                ],
              ),
              Spacer(),
              // SvgPicture.asset(
              //   "assets/svg/graph.svg",
              //   color: AppColors.selectedIcon,
              //   width: double.maxFinite,
              //   height: 150,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        CryptoImagesConstantsUrl().cryptoImages[slug]!),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("INR",
                          style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      Text(MainUtils().formatPriceWithCommas(inrAmount),
                          style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 15,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}

class TopCurrenciesAppBar extends StatelessWidget {
  const TopCurrenciesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "TOP CURRENCIES",
            style: TextStyle(
                color: AppColors.textColor1,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Text(
                    "Explore",
                    style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textColor1,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
