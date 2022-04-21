import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';

import '../Database/DatabaseKeys.dart';
import '../Database/LocalData.dart';

class ThemeProvider extends ChangeNotifier {
  late bool isDarkMode;

  late Color mainColor;
  late Color dividerColor;
  late Color borderColor;
  late Color solidButtonColor;
  late Color textColor1;
  late Color textColor2;
  late Color profitColor;
  late Color lossColor;
  late Color selectedIcon;
  late Color unSelectedIcon;
  Color backgroundColor =
      LocalData.getBool("isDarkMode") ? Color(0xff0e0e0e) : Color(0xffe5e5e5);
  late LinearGradient appBarBackgroundColorGradient;
  late LinearGradient appBarBorderGradient;
  Color shimmerColor = Color.fromARGB(218, 255, 161, 121);

  void setDarkMode(BuildContext context) async {
    isDarkMode = true;
    LocalData.saveBool("isDarkMode", true);
    setColors();
    notifyListeners();
  }

  void setLightMode(BuildContext context) {
    isDarkMode = false;
    LocalData.saveBool("isDarkMode", false);
    setColors();
    notifyListeners();
  }

  void setColors() {
    mainColor = isDarkMode
        ? Color.fromRGBO(14, 14, 14, 1)
        : Color.fromRGBO(255, 255, 255, 0.5);
    dividerColor = isDarkMode
        ? Color.fromRGBO(46, 44, 50, 1)
        : Color.fromRGBO(245, 243, 252, 1);
    borderColor = isDarkMode
        ? Color.fromRGBO(65, 65, 65, 1)
        : Color.fromRGBO(255, 255, 255, 1);

    solidButtonColor = isDarkMode
        ? Color.fromRGBO(14, 14, 14, 1)
        : Color.fromRGBO(255, 255, 255, 1);
    textColor1 = isDarkMode
        ? Color.fromRGBO(234, 230, 248, 1)
        : Color.fromRGBO(47, 45, 61, 1);
    textColor2 = isDarkMode
        ? Color.fromRGBO(163, 159, 185, 1)
        : Color.fromRGBO(163, 159, 185, 1);
    profitColor = isDarkMode
        ? Color.fromRGBO(86, 231, 111, 1)
        : Color.fromRGBO(45, 193, 77, 1);
    lossColor = isDarkMode
        ? Color.fromRGBO(255, 225, 117, 1)
        : Color.fromRGBO(255, 81, 81, 1);

    selectedIcon = isDarkMode
        ? Color.fromRGBO(234, 230, 248, 1)
        : Color.fromRGBO(45, 45, 61, 1);

    unSelectedIcon = isDarkMode
        ? Color.fromRGBO(163, 159, 185, 1)
        : Color.fromRGBO(83, 82, 96, 1);
    backgroundColor = isDarkMode ? Color(0xff0e0e0e) : Color(0xffe5e5e5);

    appBarBackgroundColorGradient = isDarkMode
        ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(50, 50, 50, 0.8),
              Color.fromRGBO(50, 50, 50, 0.8),
            ],
          )
        : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.5),
              Color.fromRGBO(255, 255, 255, 0.5),
            ],
          );

    appBarBorderGradient = isDarkMode
        ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [borderColor, Color.fromRGBO(50, 50, 50, 0.8)],
          )
        : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [borderColor, borderColor],
          );
  }

  void setInitialColors() {
    isDarkMode = LocalData.getBool("isDarkMode");
    setColors();
    notifyListeners();
  }
}
