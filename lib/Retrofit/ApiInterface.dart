import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:crypto_app/Models/ResponseResolver.dart';
import 'package:crypto_app/Retrofit/ApiBase.dart';

class ApiInterface {
  ApiBase apiBase = ApiBase();

  Map<String, String> mainHeader = {
    "X-CMC_PRO_API_KEY": "1847ae0c-4051-4354-8130-598e923573a7"
  };

  Future<ResponseResolver> getTop25Currencies(
      BuildContext context, Function(String) onFail) {
    return apiBase.getReturnFail(
        context,
        "/v1/cryptocurrency/listings/latest",
        onFail,
        {"limit": "25", "start": "1", "convert": "INR"},
        mainHeader,
        false,
        false);
  }
}
