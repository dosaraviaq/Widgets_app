import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgtes_app/config/router/app_router.dart';
import 'package:widgtes_app/config/theme/app_theme.dart';
import 'package:widgtes_app/presentation/providers/theme_provider.dart';

void main() {
  // ProviderScope --> Si no me equivoco es una alternativa a provider
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

// En el main convertiremos un StatelessWidget a un (ConsumerWidget) para poder manejar los temas de la aplicacion
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

// WidgetRef ref --> Riverpod
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Varible para el tema dark o light
    // final bool isModeProvider = ref.watch(isDarkmodeProvider);
    // Variable de colores de la app
    // final int selectedProvider = ref.watch(selectedColorProvider);
// USAMOS NOTIFIER PROVIDER
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      // Titulo del dialogo
      title: 'Flutter Widgets',
      // Configuracion de las rutas gorouter
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // appTheme --> NotifierProvider
      theme: appTheme
          // AppTheme(selectedColor: selectedProvider, isDarkMode: isModeProvider)
          .getTheme(),
    );
  }
}

// pausa en el video 8 min4
