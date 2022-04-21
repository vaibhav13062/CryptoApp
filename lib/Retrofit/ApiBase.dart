import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;


import '../Models/ResponseResolver.dart';

import '../UI/ConnectionLost/ConnectionLost.dart';
import '../UI/Elements/retorfitPopup/showPopup.dart';
import '../main.dart';
import 'CustomException.dart';

class ApiBase {
  final String _baseUrl = "pro-api.coinmarketcap.com";

  Future<ResponseResolver> get(
      BuildContext context,
      String url,
      Map<String, String> queryParams,
      Map<String, String> headers,
      bool showError,
      bool showLoading) async {
    if (showLoading) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: "");
      }
    }

    var responseJson;
    print(Uri.https(_baseUrl, url, queryParams));
    try {
      final response = await http.get(Uri.https(_baseUrl, url, queryParams),
          headers: headers);
      responseJson = _response(response, context, showError);
    } on SocketException {
      if (showLoading) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }
      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    if (showLoading) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    }
    return ResponseResolver.fromJson(responseJson);
  }

  Future<ResponseResolver> getReturnFail(
      BuildContext context,
      String url,
      Function(String) onFail,
      Map<String, String> queryParams,
      Map<String, String> headers,
      bool showError,
      bool showLoading) async {
    if (showLoading) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: "");
      }
    }

    var responseJson;
    print(Uri.https(_baseUrl, url, queryParams));
    try {
      final response = await http.get(Uri.https(_baseUrl, url, queryParams),
          headers: headers);
      responseJson = _responseReturnFail(response, context, onFail, showError);
    } on SocketException {
      if (showLoading) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }
      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    if (showLoading) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    }
    return ResponseResolver.fromJson(responseJson);
  }

  Future<ResponseResolver> post(
      BuildContext context,
      String url,
      Map<String, String> headers,
      Object body,
      bool showError,
      bool showLoading) async {
    if (showLoading) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: "");
      }
    }
    var responseJson;
    try {
      final response = await http.post(Uri.https(_baseUrl, url),
          headers: headers, body: body);
      print(Uri.https(_baseUrl, url));
      responseJson = _response(response, context, showError);
    } on SocketException {
      if (showLoading) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }

      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    if (showLoading) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    }
    return ResponseResolver.fromJson(responseJson);
  }

  Future<ResponseResolver> postReturnFail(
      BuildContext context,
      String url,
      Function(String) onFail,
      Map<String, String> headers,
      Object body,
      bool showError,
      bool showLoading) async {
    if (showLoading) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: "");
      }
    }
    var responseJson;
    try {
      final response = await http.post(Uri.https(_baseUrl, url),
          headers: headers, body: body);
      print(Uri.https(_baseUrl, url).toString());
      responseJson = _responseReturnFail(response, context, onFail, showError);
    } on SocketException {
      if (showLoading) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }

      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    if (showLoading) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    }
    return ResponseResolver.fromJson(responseJson);
  }

  Future<ResponseResolver> put(
      BuildContext context,
      String url,
      Map<String, String> headers,
      Object body,
      bool showError,
      bool showLoading) async {
    if (showLoading) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: "");
      }
    }
    var responseJson;
    try {
      final response = await http.put(Uri.https(_baseUrl, url),
          headers: headers, body: body);
      responseJson = _response(response, context, showError);
    } on SocketException {
      if (showLoading) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }

      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    if (showLoading) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
    }
    return ResponseResolver.fromJson(responseJson);
  }

  dynamic _response(http.Response response, context, bool showErrorPopup) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        ResponseResolver responseResolver =
            ResponseResolver.fromJson(responseJson);
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        if (showErrorPopup) {
          showPopup(context, () {
            Navigator.of(context).pop();
          }, "ERROR", responseResolver.status!.error_message);
        }
        throw BadRequestException([responseResolver..status!.error_message]);
      case 401:
        var responseJson = json.decode(response.body.toString());
        ResponseResolver responseResolver =
            ResponseResolver.fromJson(responseJson);

        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        throw UnauthorisedException([responseResolver.status!.error_message]);

      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 500:

      default:
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        if (showErrorPopup) {
          showPopup(context, () {
            Navigator.of(context).pop();
          }, "ERROR", "Something Went Wrong!");
        }
        throw FetchDataException(
            "Bad Communication" + '${response.statusCode}');
    }
  }

  dynamic _responseReturnFail(http.Response response, context,
      Function(String) onFail, bool showErrorPopup) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        ResponseResolver responseResolver =
            ResponseResolver.fromJson(responseJson);
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        onFail(responseResolver.data.toString());
        if (showErrorPopup) {
          showPopup(context, () {
            Navigator.of(context).pop();
          }, "ERROR", responseResolver.status!.error_message);
        }
        throw BadRequestException([responseResolver.status!.error_message]);
      case 401:
        var responseJson = json.decode(response.body.toString());
        ResponseResolver responseResolver =
            ResponseResolver.fromJson(responseJson);
        onFail(responseResolver.data);
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        throw UnauthorisedException([responseResolver.status!.error_message]);

      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 500:

      default:
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        onFail("Something Went Wrong!");
        if (showErrorPopup) {
          showPopup(context, () {
            Navigator.of(context).pop();
          }, "ERROR", "Something Went Wrong!");
        }
        throw FetchDataException(
            "Bad Communication" + '${response.statusCode}');
    }
  }
}
