import 'package:crypto_app/Providers/BottomBarSectionProvider.dart';
import 'package:crypto_app/UI/Elements/AnimatedWidgets/LeftRightAnimationWidget.dart';
import 'package:crypto_app/UI/Elements/AnimatedWidgets/UpDownAnimationWidget.dart';
import 'package:crypto_app/UI/Elements/AnimatedWidgets/ZoomAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../../Constants/AppColors.dart';

class AppBottomAppBar extends StatelessWidget {
  const AppBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftRightAnimationWidget(
      milliSeconds: 500,
      isLeftToRight: false,
      child: Container(
        height: 95,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: GlassmorphicContainer(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: BottomAppBarIconWidget(
                      onTap: () {
                        Provider.of<BottomBarSectionProvider>(context,
                                listen: false)
                            .onSelectSection(1);
                      },
                      asset: "assets/svg/home.svg",
                      name: "Home",
                      isExchange: false,
                      isSelected: Provider.of<BottomBarSectionProvider>(context)
                          .isThisSelected(1)),
                ),
                Expanded(
                  child: BottomAppBarIconWidget(
                      onTap: () {
                        Provider.of<BottomBarSectionProvider>(context,
                                listen: false)
                            .onSelectSection(2);
                      },
                      asset: "assets/svg/briefcase.svg",
                      name: "Portfolio",
                      isExchange: false,
                      isSelected: Provider.of<BottomBarSectionProvider>(context)
                          .isThisSelected(2)),
                ),
                Expanded(
                  child: BottomAppBarIconWidget(
                      onTap: () {
                        //TODO: FUNC NEED TO BE ADDED
                      },
                      asset: "assets/svg/exchange.svg",
                      name: "Exchange",
                      isExchange: true,
                      isSelected: false),
                ),
                Expanded(
                  child: BottomAppBarIconWidget(
                      onTap: () {
                        Provider.of<BottomBarSectionProvider>(context,
                                listen: false)
                            .onSelectSection(4);
                      },
                      asset: "assets/svg/market.svg",
                      name: "Markets",
                      isExchange: false,
                      isSelected: Provider.of<BottomBarSectionProvider>(context)
                          .isThisSelected(4)),
                ),
                Expanded(
                  child: BottomAppBarIconWidget(
                      onTap: () {
                        Provider.of<BottomBarSectionProvider>(context,
                                listen: false)
                            .onSelectSection(5);
                      },
                      asset: "assets/svg/user.svg",
                      name: "Profile",
                      isExchange: false,
                      isSelected: Provider.of<BottomBarSectionProvider>(context)
                          .isThisSelected(5)),
                )
              ],
            ),
          ),
          blur: 5,
          borderRadius: 8,
          border: 3,
          linearGradient: AppColors.appBarBackgroundColorGradient,
          borderGradient: AppColors.appBarBorderGradient,
          width: double.maxFinite,
          height: 95,
        ),
      ),
    );
  }
}

class BottomAppBarIconWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String asset;
  final String name;
  final bool isSelected;
  final bool isExchange;
  const BottomAppBarIconWidget(
      {Key? key,
      required this.onTap,
      required this.asset,
      required this.name,
      required this.isExchange,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // flex: isExchange ? 6 : 5,
      child: isExchange
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomAnimation(
                  finalHeight: 55,
                  initialHeight: 10,
                  finalWidth: 55,
                  delay: 500,
                  initialWidth: 10,
                  milliseconds: 300,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.solidButtonColor,
                    onPressed: onTap,
                    child: SvgPicture.asset(
                      asset,
                      color: AppColors.unSelectedIcon,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.unSelectedIcon,
                  ),
                )
              ],
            )
          : IconButton(
              iconSize: 50,
              onPressed: onTap,
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    asset,
                    color: isSelected
                        ? AppColors.selectedIcon
                        : AppColors.unSelectedIcon,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.selectedIcon
                          : AppColors.unSelectedIcon,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
