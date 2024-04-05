import 'package:intl/intl.dart';

class Formatter {
  static String ddMMMyyyy(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy', 'ru').format(parsedDate);
  }
}