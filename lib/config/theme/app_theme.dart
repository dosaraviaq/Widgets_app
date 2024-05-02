import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  // Tema oscuro o claro
  final bool isDarkMode;
// Lo que nos permite realizar los asserts es que no execdamos los colores del vector.
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        // Para el tema oscuro o claro
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        // Configuracion de centrado de los AppBar, posicion en left
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

// Exportamos el tema, una copia actual
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
