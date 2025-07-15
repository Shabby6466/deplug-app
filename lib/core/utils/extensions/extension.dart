import 'package:flutter_dotenv/flutter_dotenv.dart';

extension CapitalizeWords on String {
  String capitalizeEachWord() {
    return split(' ').map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : word).join(' ');
  }
}

extension StringExtensions on String {
  String removeSpaces() {
    return replaceAll(' ', '');
  }
}

extension StringExtension on String {
  // this method is used to capitalize first word of string
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

/// Checks if a passcode is valid based on predefined rules.
///
/// This extension on `String` provides a `validPasscode`method to validate a passcode against two lists of invalid passcodes:
/// - `samePasswordList`: Passcodes consisting of the same digit repeated (e.g., "1111", "2222").
/// - `regularIncrementPasswordList`: Passcodes with digits incrementing regularly (e.g., "1234", "5678").
///
/// These lists are loaded from environment variables (`samePasswordValidation` and `regularIncrementPasswordValidation`)
/// which are expected to be comma-separated strings.
///
/// **Returns:** `true` if the passcode is valid, `false` otherwise.
extension PasscodeChecker on String {
  bool validPasscode() {
    final userPasscode = this;
    final samePasswordList = dotenv.env['samePasswordValidation']!.split(',');
    final regularIncrementPasswordList = dotenv.env['regularIncrementPasswordValidation']!.split(',');
    for (var val in samePasswordList) {
      if (val == userPasscode) {
        return false;
      }
    }
    for (var val in regularIncrementPasswordList) {
      if (val == userPasscode) {
        return false;
      }
    }
    return true;
  }
}
