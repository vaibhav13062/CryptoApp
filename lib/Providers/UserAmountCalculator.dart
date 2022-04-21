import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';

import '../Database/DatabaseKeys.dart';
import '../Database/LocalData.dart';

class UserAmountCalculator extends ChangeNotifier {
  int inrBalance = 0;
  int investedValue = 12033;
  int currentValue = 13000;

  void addInitalFundsToUser() {
    if (LocalData.getBool("isOldUser")) {
      inrBalance = LocalData.getInt("inrBalance");
      notifyListeners();
    } else {
      LocalData.saveBool("isOldUser", true);
      LocalData.saveInt("inrBalance", 1000);
      inrBalance = LocalData.getInt("inrBalance");
      notifyListeners();
    }
  }

  void addFunds(int amount) {
    LocalData.saveInt("inrBalance", LocalData.getInt("inrBalance") + amount);
    inrBalance = LocalData.getInt("inrBalance");
    notifyListeners();
  }

  void widhrawFunds(int amount) {
    if (LocalData.getInt("inrBalance") >= amount) {
      LocalData.saveInt("inrBalance", LocalData.getInt("inrBalance") - amount);
      inrBalance = LocalData.getInt("inrBalance");
      notifyListeners();
    } else {
      print("Invalid");
    }
  }
}
