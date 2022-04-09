import 'package:crypto_app/UI/Elements/AnimatedWidgets/ZoomAnimation.dart';
import 'package:crypto_app/UI/Screens/MainScreenSections/widgets/HomePortfolioSection.dart';
import 'package:crypto_app/UI/Screens/MainScreenSections/widgets/TopCurrenciesSection.dart';
import 'package:crypto_app/UI/Screens/MainScreenSections/widgets/WatchListHomeSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Elements/TopAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TopAppBar(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomePortfolio(),
                  TopCurrenciesSection(),
                  WatchListHomeSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
