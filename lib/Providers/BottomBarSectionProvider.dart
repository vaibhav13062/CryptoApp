import 'package:crypto_app/UI/Screens/MainScreenSections/HomeScreen.dart';
import 'package:crypto_app/UI/Screens/MainScreenSections/PortfolioScreen.dart';
import 'package:crypto_app/UI/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';

import '../Database/DatabaseKeys.dart';
import '../Database/LocalData.dart';
import '../UI/Screens/MarketsScreen/MarketScreen.dart';

class BottomBarSectionProvider extends ChangeNotifier {
  int sectionIndex = 1;

  void onSelectSection(int index) {
    sectionIndex = index;
    notifyListeners();
  }

  bool isThisSelected(int index) {
    switch (index) {
      case 1:
        return sectionIndex == 1;
      case 2:
        return sectionIndex == 2;
      case 4 :
        return sectionIndex == 4;
      case 5:
        return sectionIndex == 5;
      default:
        return false;
    }
  }

  Widget getWidgetFromIndex(BuildContext context) {
    switch (sectionIndex) {
      case 1:
        return HomeScreen();
      case 2:
        return PortfolioScreen();
      // case 3:
      //   break;
      case 4:
        return  MarketScreen();
      case 5 :
        return  ProfileScreen();
      default:
        return HomeScreen();
    }
  }
}
