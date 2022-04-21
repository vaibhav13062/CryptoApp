import 'dart:math';

import 'package:crypto_app/Providers/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainUtils {
  String formatPrice(double price) {
    var formatter;
    if (price < 5000) {
      formatter = NumberFormat('#,##,##0.00');
    } else {
      formatter = NumberFormat('#,##,##0');
    }
    return "₹ " + formatter.format(price).toString();
  }

  String formatPriceWithCommas(double price) {
    var formatter;
    if (price < 5000) {
      formatter = NumberFormat('#,##,##0.00');
    } else {
      formatter = NumberFormat('#,##,##0');
    }

    return formatter.format(price).toString();
  }
 String formatPriceWithCommasWithoutDecimal(double price) {
    var formatter= NumberFormat('#,##,###');


    return formatter.format(price).toString();
  }

  String getGrapghImage(double percent, BuildContext context) {
    var isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    if (isDarkMode) {
      if (percent > 0) {
        var list = [
          "assets/images/gain_dark1.png",
          "assets/images/gain_dark2.png"
        ];
        final _random = Random();

        return list[_random.nextInt(list.length)];
      } else {
        var list = [
          "assets/images/loss_dark1.png",
          "assets/images/loss_dark2.png"
        ];
        final _random = Random();

        return list[_random.nextInt(list.length)];
      }
    } else {
      if (percent > 0) {
        var list = [
          "assets/images/gain_light1.png",
          "assets/images/gain_light2.png"
        ];
        final _random = Random();

        return list[_random.nextInt(list.length)];
      } else {
        var list = [
          "assets/images/loss_light1.png",
          "assets/images/loss_light2.png"
        ];
        final _random = Random();

        return list[_random.nextInt(list.length)];
      }
    }
  }
}
