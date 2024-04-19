import 'package:flutter/material.dart';
import 'package:widgtes_app/config/theme/app_theme.dart';
import 'package:widgtes_app/presentation/screens/buttons/home_screen.dart';
import 'package:widgtes_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgtes_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: const HomeScreen(),
      // Rutas para navegar desde el home_screen.dart
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
