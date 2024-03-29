import 'package:intl/intl.dart';

class MbxFormatVM {
  static String currencyRP(int value,
      {required bool prefix, required bool mutation, required bool masked}) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    var result = '';
    if (masked) {
      result = '***.***';
    } else {
      if (mutation) {
        result = currencyFormatter.format(value.abs());
      } else {
        result = currencyFormatter.format(value);
      }
    }
    if (prefix) {
      result = 'Rp $result';
    }
    if (mutation) {
      if (value < 0) {
        result = '- $result';
      } else if (value > 0) {
        result = '+ $result';
      } else {
        result = '$result';
      }
    }
    return result;
  }

  static String currencyUSD({required value, bool prefix = true}) {
    final currencyFormatter = NumberFormat('#,##0', 'EN');
    if (prefix == true) {
      return 'USD ${currencyFormatter.format(value)}';
    } else {
      return '${currencyFormatter.format(value)}';
    }
  }

  static String accountMasking(String account,
      {required String prefix, required int visibleDigits}) {
    return '$prefix${account.substring(account.length - visibleDigits)}';
  }

  static String longDateTime(String dt) {
    DateTime now = DateTime.parse(dt).toLocal();
    var formatter = DateFormat('dd MMM yyyy hh:mm');
    return formatter.format(now);
  }
}
