import 'package:flutter/material.dart';
import 'package:widgtes_app/config/router/app_router.dart';
import 'package:widgtes_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Titulo del dialogo
      title: 'Flutter Widgets',
      // Configuracion de las rutas gorouter
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 6).getTheme(),
    );
  }
}
