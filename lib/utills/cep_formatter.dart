import 'package:flutter/services.dart';

class CEPInputFormatter extends TextInputFormatter {
  CEPInputFormatter() : super();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    var newText = newValue.text.replaceAll(RegExp('[^0-9]+'), '');

    if (newText.length > 4) {
      if (newText.length > 5) {
        newText = '${newText.substring(0, 5)}-${newText.substring(5)}';
      } else {
        newText = '${newText.substring(0, 5)}-';
      }
    }

    return TextEditingValue(
      text: newText,
      selection: _returnTextSelection(newText: newText, oldValue: oldValue),
    );
  }

  TextSelection _returnTextSelection({
    required String newText,
    required TextEditingValue oldValue,
  }) {
    if (newText.length < oldValue.text.length) {
      return _selectionWhenDeleteCharacter(
        newText: newText,
        oldValue: oldValue,
      );
    } else {
      return _selectionWhenAddCharacter(
        newText: newText,
        oldValue: oldValue,
      );
    }
  }

  TextSelection _selectionWhenDeleteCharacter({
    required String newText,
    required TextEditingValue oldValue,
  }) {
    if (oldValue.selection.baseOffset == oldValue.text.length) {
      return TextSelection.collapsed(
        offset: newText.length,
      );
    } else if (oldValue.selection.baseOffset ==
        oldValue.selection.extentOffset) {
      return TextSelection.collapsed(
        offset: oldValue.selection.baseOffset -
            (oldValue.text.length - newText.length),
      );
    } else {
      return TextSelection.fromPosition(
        TextPosition(
          offset: oldValue.selection.baseOffset,
        ),
      );
    }
  }

  TextSelection _selectionWhenAddCharacter({
    required String newText,
    required TextEditingValue oldValue,
  }) {
    if (oldValue.selection.baseOffset == oldValue.text.length) {
      return TextSelection.collapsed(
        offset: newText.length,
      );
    } else if (oldValue.selection.baseOffset ==
        oldValue.selection.extentOffset) {
      return TextSelection.collapsed(
        offset: oldValue.selection.baseOffset +
            (newText.length - oldValue.text.length),
      );
    } else {
      return TextSelection.collapsed(
        offset: oldValue.selection.extentOffset +
            (newText.length - oldValue.text.length),
      );
    }
  }
}
