import 'package:crypto_app/UI/Screens/MainScreenSections/widgets/PortfolioSection.dart';
import 'package:flutter/cupertino.dart';

import '../../Elements/TopAppBar.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

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
                  PortfolioSection(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
