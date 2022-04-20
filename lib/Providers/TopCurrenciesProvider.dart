import 'package:crypto_app/Models/CurrencyItem.dart';
import 'package:crypto_app/Retrofit/ApiInterface.dart';
import 'package:flutter/cupertino.dart';

import '../Database/DatabaseKeys.dart';
import '../Database/LocalData.dart';

class TopCurrenciesProvider extends ChangeNotifier {
  bool isLoaded = false;

  List<CurrencyItem> allCurrencies = [];

  Future<void> fetchData(BuildContext context) async {
    isLoaded = false;
    allCurrencies.clear();
    await ApiInterface()
        .getTop25Currencies(context, (errorString) {})
        .then((value) {
      List<dynamic> tempData = value.data;
      print(tempData);
      for (int i = 0; i < tempData.length; i++) {
        allCurrencies.add(CurrencyItem.fromJsonMap(tempData[i]));
      }
      isLoaded = true;
      notifyListeners();
    });
  }
}
