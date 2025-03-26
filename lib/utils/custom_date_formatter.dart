import 'package:intl/intl.dart';

class CustomDateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }
}
