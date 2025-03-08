import 'package:intl/intl.dart';

class AppFormat {
  static String shortPrice(num number) {
    return NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);
  }

  static String longPrice(num number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);
  }

  static String justDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Format: Monday, 2 Jan 23
  static String shortDate(dynamic source) {
    DateTime? date = _parseDate(source);
    return date != null
        ? DateFormat('EEEE, d MMM yy').format(date)
        : 'Not valid';
  }

  /// Format: Monday, 2 January 2023
  static String fullDate(dynamic source) {
    DateTime? date = _parseDate(source);
    return date != null
        ? DateFormat('EEEE, d MMMM yyyy').format(date)
        : 'Not valid';
  }

  /// Helper untuk parsing tanggal dengan error handling
  static DateTime? _parseDate(dynamic source) {
    if (source is DateTime) return source;
    if (source is String) {
      try {
        return DateTime.parse(source);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
