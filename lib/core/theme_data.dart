import 'package:flutter/material.dart';

///[ThemeData:lightTheme] Tema claro de la aplicacion.
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF2098F3),
  // Azul brillante
  colorScheme: ColorScheme.light(
    primary: Color(0xFF2098F3),
    // Azul brillante
    secondary: Color(0xFFF39C20),
    // Naranja cálido
    surface: Color(0xFFF8F5F5),
    // Fondo claro (superficie)
    onPrimary: Colors.white,
    // Texto sobre colores primarios
    onSecondary: Colors.black,
    // Texto sobre colores secundarios
    onSurface: Colors.black,
    // Texto sobre superficies claras
    error: Color(0xFFFF5252),
    // Rojo para errores
    onError: Colors.white, // Texto sobre fondos de error
  ),
  cardColor: Colors.white,
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF2098F3),
    foregroundColor: Colors.white, // Texto en el AppBar
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.black), // Texto principal
    bodyMedium: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.black87), // Texto secundario
    bodySmall: TextStyle(
        fontFamily: 'MyriadRoman',
        color: Colors.black54), // Texto menos destacado
    titleLarge: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.black), // Títulos destacados
  ),
);

///[ThemeData:darkTheme] Tema oscuro de la aplicacion.
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF212625),
  // Verde oliva
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF212625),
    // Verde oliva
    secondary: Color(0xFF2BA2AD),
    // Amarillo vibrante
    surface: Color(0xFF1E1E1E),
    // Superficie oscura
    onPrimary: Colors.white,
    // Texto sobre colores primarios
    onSecondary: Colors.black,
    // Texto sobre colores secundarios
    onSurface: Colors.white,
    // Texto sobre superficies oscuras
    error: Color(0xFFFF5252),
    // Rojo para errores
    onError: Colors.white, // Texto sobre fondos de error
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF212625),
    foregroundColor: Colors.white, // Texto en el AppBar
  ),
  cardColor: Color(0xFF292D2C),
  canvasColor: Color(0xFF212625),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.white), // Texto principal
    bodyMedium: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.white70), // Texto secundario
    bodySmall: TextStyle(
        fontFamily: 'MyriadRoman',
        color: Colors.white54), // Texto menos destacado
    titleLarge: TextStyle(
        fontFamily: 'MyriadRoman', color: Colors.white), // Títulos destacados
  ),
);
