import 'package:crypto_app/Constants/AppColors.dart';
import 'package:crypto_app/Constants/DeviceSizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../Elements/ProfitLossIndicator.dart';

class TopCurrenciesSection extends StatelessWidget {
  const TopCurrenciesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const TopCurrenciesAppBar(),
          Container(
            height: 270,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Bounceable(
                    onTap: () {
                      print("OnTap");
                    },
                    child: TopCurrencyItem());
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopCurrencyItem extends StatelessWidget {
  const TopCurrencyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: GlassmorphicContainer(
        width: 230,
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
                    children: const [
                      Text(
                        "Ethereum",
                        maxLines: 1,
                        style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("ETH",
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.textColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                  Spacer(),
                  ProfitLossIndicator(
                    isLoss: false,
                    percenatge: 12.2,
                  )
                ],
              ),
              SvgPicture.asset(
                "assets/svg/graph.svg",
                color: AppColors.selectedIcon,
                width: double.maxFinite,
                height: 150,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("USD",
                          style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      Text("122.333",
                          style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 15,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              )
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
