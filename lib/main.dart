import 'package:catbreeds/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización rápida

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(), // La pantalla de splash precarga la HomePage
    );
  }
}