import 'package:intl/intl.dart';

class Date {
  static format(DateTime date, String format) {
    return DateFormat(format).format(date);
  }
}
