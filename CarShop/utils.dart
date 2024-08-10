import 'package:intl/intl.dart';

class Utils {
  static String formatCurrency(int value) {
    final format = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 0);
    return format.format(value);
  }
}
