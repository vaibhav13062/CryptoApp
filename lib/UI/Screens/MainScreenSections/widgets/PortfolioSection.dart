import 'package:flutter/material.dart';

import '../../../../Constants/AppColors.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [PortfolioAppBar()],),);
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
