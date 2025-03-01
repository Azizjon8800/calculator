import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  String _displayText = '0';
  String get displayText => _displayText;
  void setValue(String value) {
    if (_displayText == '0' && value != '=') {
      _displayText = value;
    } else {
      switch (value) {
        case 'AC':
          _displayText = '0';
          break;
        case '*':
          _displayText += '*';
          break;
        case '=':
          calculate();
          break;
        default:
          _displayText += value;
      }
    }
    notifyListeners();
  }

  void calculate() {
    try {
      String expression = _displayText;
      num result = expression.interpret();
      _displayText = result == result.toInt()
      ? result.toInt().toString()
      : result.toString();
    } catch (e) {
      _displayText = 'Error';
    }
    notifyListeners();
  }
}