import 'dart:math';

import 'package:flutter/material.dart';

class ColorsProvider extends ChangeNotifier {
  Color _textColor = Colors.white;
  Color _backgroundColor = Colors.blue;
  double _deepNeumorphicText = 0;
  int _indexShape = 0;

  Color get textColor => _textColor;

  Color get backgroundColor => _backgroundColor;

  double get deepNeumorphicText => _deepNeumorphicText;

  int get indexShape => _indexShape;

  final Random _randomizer = Random();

  void getNewColors() {
    final red = _randomizer.nextInt(255);
    final blue = _randomizer.nextInt(255);
    final green = _randomizer.nextInt(255);
    _backgroundColor = Color.fromRGBO(red, green, blue, 1);
    _textColor = Color.fromRGBO(
      _getOppositeInt(red),
      _getOppositeInt(green),
      _getOppositeInt(blue),
      1,
    );
    notifyListeners();
  }

  int _getOppositeInt(int actualNum) {
    return (actualNum + 100 > 255) ? actualNum - 100 : actualNum + 100;
  }

  void changeDeepText(double actualValue) {
    _deepNeumorphicText = actualValue;
    notifyListeners();
  }

  void changeShape(int newIndexShape) {
    _indexShape = newIndexShape;
    notifyListeners();
  }
}
