import 'package:flutter/cupertino.dart';

import '../../Elements/TopAppBar.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const TopAppBar(),
        ],
      ),
    );
  }
}
