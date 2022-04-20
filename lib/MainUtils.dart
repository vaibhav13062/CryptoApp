import 'package:intl/intl.dart';

class MainUtils {
  String formatPrice(double price) {
    var formatter = NumberFormat('#,##,##0');
    return "₹ " + formatter.format(price).toString();
  }

  String formatPriceWithCommas(double price) {
    var formatter = NumberFormat('#,##,000');
    return formatter.format(price).toString();
  }
}
