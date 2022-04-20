import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/UI/Elements/ProfitLossIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../../Constants/AppColors.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({Key? key}) : super(key: key);

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
  const OptionsPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GlassmorphicContainer(
                width: 80,
                height: 80,
                borderRadius: 80,
                linearGradient: AppColors.appBarBackgroundColorGradient,
                borderGradient: AppColors.appBarBorderGradient,
                border: 3,
                blur: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/svg/deposit.svg",
                    color: AppColors.textColor1,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DEPOSIT",
                style: TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )
            ],
          ),
          Column(
            children: [
              GlassmorphicContainer(
                width: 80,
                height: 80,
                borderRadius: 80,
                linearGradient: AppColors.appBarBackgroundColorGradient,
                borderGradient: AppColors.appBarBorderGradient,
                border: 3,
                blur: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/svg/withdraw.svg",
                    color: AppColors.textColor1,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "WITHDRAW",
                style: TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )
            ],
          ),
          Column(
            children: [
              GlassmorphicContainer(
                width: 80,
                height: 80,
                borderRadius: 80,
                linearGradient: AppColors.appBarBackgroundColorGradient,
                borderGradient: AppColors.appBarBorderGradient,
                border: 3,
                blur: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/svg/analytics.svg",
                    color: AppColors.textColor1,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ANALYTICS",
                style: TextStyle(
                    color: AppColors.textColor1,
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
      linearGradient: AppColors.appBarBackgroundColorGradient,
      borderGradient: AppColors.appBarBorderGradient,
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
                  color: AppColors.textColor1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.borderColor,
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
                          color: AppColors.textColor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      MainUtils().formatPrice(200000.0),
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: AppColors.textColor1)
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
                    color: AppColors.textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(MainUtils().formatPrice(10000.0),
                  maxLines: 1,
                  style: TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700))
            ],
          ),
          Container(
            height: 35,
            width: 1.8,
            color: AppColors.dividerColor,
          ),
          Column(
            children: [
              Text(
                "Current Value",
                maxLines: 1,
                style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(MainUtils().formatPrice(12000.0),
                  maxLines: 1,
                  style: TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700))
            ],
          ),
          Container(
            height: 35,
            width: 1.8,
            color: AppColors.dividerColor,
          ),
          Column(
            children: const [
              Text(
                "Profit/Loss",
                maxLines: 1,
                style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              ProfitLossIndicator(
                isLoss: true,
                percenatge: 34,
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
      child: const Text(
        "PORTFOLIO",
        style: TextStyle(
            color: AppColors.textColor1,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
