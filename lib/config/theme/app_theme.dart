import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorTheme = [
  _customColor,
  Colors.orange,
  Colors.cyan,
  Colors.green,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme( { this.selectedColor= 2}): assert(selectedColor>=0 && selectedColor <= _colorTheme.length-1);

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorTheme[selectedColor]);
  }
}
