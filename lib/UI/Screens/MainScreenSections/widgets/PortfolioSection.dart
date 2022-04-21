import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/Providers/UserAmountCalculator.dart';
import 'package:crypto_app/UI/Elements/DepositPopup/DepositPopup.dart';
import 'package:crypto_app/UI/Elements/ProfitLossIndicator.dart';
import 'package:crypto_app/UI/Elements/retorfitPopup/showPopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/ThemeProvider.dart';

class PortfolioSection extends StatelessWidget {
  PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PortfolioAppBar(),
          PortfolioAmountSection(),
          BalanceWidget(),
          OptionsPortfolio()
        ],
      ),
    );
  }
}

class OptionsPortfolio extends StatelessWidget {
  OptionsPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bounceable(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (builder) {
                    return DepositPopup();
                  });
            },
            child: Column(
              children: [
                GlassmorphicContainer(
                  width: 80,
                  height: 80,
                  borderRadius: 80,
                  linearGradient: Provider.of<ThemeProvider>(context)
                      .appBarBackgroundColorGradient,
                  borderGradient:
                      Provider.of<ThemeProvider>(context).appBarBorderGradient,
                  border: 3,
                  blur: 8,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/svg/deposit.svg",
                      color: Provider.of<ThemeProvider>(context).textColor1,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "DEPOSIT",
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).textColor1,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          ),
          Bounceable(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (builder) {
                    return WithdrawPopup();
                  });
            },
            child: Column(
              children: [
                GlassmorphicContainer(
                  width: 80,
                  height: 80,
                  borderRadius: 80,
                  linearGradient: Provider.of<ThemeProvider>(context)
                      .appBarBackgroundColorGradient,
                  borderGradient:
                      Provider.of<ThemeProvider>(context).appBarBorderGradient,
                  border: 3,
                  blur: 8,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/svg/withdraw.svg",
                      color: Provider.of<ThemeProvider>(context).textColor1,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "WITHDRAW",
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).textColor1,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          ),
          Column(
            children: [
              GlassmorphicContainer(
                width: 80,
                height: 80,
                borderRadius: 80,
                linearGradient: Provider.of<ThemeProvider>(context)
                    .appBarBackgroundColorGradient,
                borderGradient:
                    Provider.of<ThemeProvider>(context).appBarBorderGradient,
                border: 3,
                blur: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/svg/analytics.svg",
                    color: Provider.of<ThemeProvider>(context).textColor1,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ANALYTICS",
                style: TextStyle(
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 80,
      blur: 8,
      borderRadius: 15,
      border: 3,
      linearGradient:
          Provider.of<ThemeProvider>(context).appBarBackgroundColorGradient,
      borderGradient: Provider.of<ThemeProvider>(context).appBarBorderGradient,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  "assets/svg/wallet.svg",
                  color: Provider.of<ThemeProvider>(context).textColor1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Provider.of<ThemeProvider>(context).borderColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "INR Balance",
                      maxLines: 1,
                      style: TextStyle(
                          color: Provider.of<ThemeProvider>(context).textColor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      MainUtils().formatPrice(
                          Provider.of<UserAmountCalculator>(context)
                              .inrBalance
                              .toDouble()),
                      maxLines: 1,
                      style: TextStyle(
                          color: Provider.of<ThemeProvider>(context).textColor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios,
                  color: Provider.of<ThemeProvider>(context).textColor1)
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioAmountSection extends StatelessWidget {
  const PortfolioAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Invested Value",
                maxLines: 1,
                style: TextStyle(
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  MainUtils().formatPrice(
                      Provider.of<UserAmountCalculator>(context)
                          .investedValue
                          .toDouble()),
                  maxLines: 1,
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).textColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700))
            ],
          ),
          Container(
            height: 35,
            width: 1.8,
            color: Provider.of<ThemeProvider>(context).dividerColor,
          ),
          Column(
            children: [
              Text(
                "Current Value",
                maxLines: 1,
                style: TextStyle(
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  MainUtils().formatPrice(
                      Provider.of<UserAmountCalculator>(context)
                          .currentValue
                          .toDouble()),
                  maxLines: 1,
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).textColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700))
            ],
          ),
          Container(
            height: 35,
            width: 1.8,
            color: Provider.of<ThemeProvider>(context).dividerColor,
          ),
          Column(
            children: [
              Text(
                "Profit/Loss",
                maxLines: 1,
                style: TextStyle(
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              ProfitLossIndicator(
                isLoss: ((Provider.of<UserAmountCalculator>(context)
                                    .currentValue
                                    .toDouble() -
                                Provider.of<UserAmountCalculator>(context)
                                    .investedValue
                                    .toDouble()) /
                            Provider.of<UserAmountCalculator>(context)
                                .investedValue
                                .toDouble()) *
                        100 <
                    0,
                percenatge: ((Provider.of<UserAmountCalculator>(context)
                                .currentValue
                                .toDouble() -
                            Provider.of<UserAmountCalculator>(context)
                                .investedValue
                                .toDouble()) /
                        Provider.of<UserAmountCalculator>(context)
                            .investedValue
                            .toDouble()) *
                    100,
                showBig: true,
                showArrow: false,
              )
            ],
          )
        ],
      ),
    );
  }
}

class PortfolioAppBar extends StatelessWidget {
  const PortfolioAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      child: Text(
        "PORTFOLIO",
        style: TextStyle(
            color: Provider.of<ThemeProvider>(context).textColor1,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
