import 'package:flutter/cupertino.dart';

import '../Database/DatabaseKeys.dart';
import '../Database/LocalData.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void setDarkMode(BuildContext context) async {
    isDarkMode = true;
    notifyListeners();
  }

  void setLightMode(BuildContext context) {
    isDarkMode = false;
    notifyListeners();
  }
}
