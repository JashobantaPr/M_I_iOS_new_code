import 'package:flutter/services.dart';

class ConditionalLengthInputFormatter extends TextInputFormatter {
  final int maxLengthWhenNumeric;
  final int maxLengthWhenNotNumeric;

  ConditionalLengthInputFormatter({
    required this.maxLengthWhenNumeric,
    required this.maxLengthWhenNotNumeric,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    bool isFirstLetterAlphabetic = newValue.text.isNotEmpty &&
        RegExp(r'[a-zA-Z]').hasMatch(newValue.text.substring(0, 1));

    int maxLength = isFirstLetterAlphabetic
        ? maxLengthWhenNotNumeric
        : maxLengthWhenNumeric;

    if (newValue.text.length <= maxLength) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
