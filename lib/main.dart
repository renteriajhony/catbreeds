import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'lib.dart';


/// Punto de entrada principal de la aplicación.
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización rápida

  runApp(const ProviderScope(child: MyApp()));
}

/// `MyApp` es la clase principal de la aplicación que extiende `StatelessWidget`.
/// Esta clase configura el `MaterialApp` con temas, localización y la pantalla de inicio.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale('es'),
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}
