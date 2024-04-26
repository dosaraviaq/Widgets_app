import 'package:go_router/go_router.dart';
// Importacion correcta (export)
import 'package:widgtes_app/presentation/screens/screens.dart';

// Configuracion de go router
final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    // Los path deben ser unicos
    path: '/',
    // LLamamos al nombre
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardsScreen.name,
    builder: (context, state) => const CardsScreen(),
  ),
  // Ruta del menu progress
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  // Ruta del menu de snackbars
  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.name,
    builder: (context, state) => const SnackbarScreen(),
  ),
  // Ruta del menu de Animaciones
  GoRoute(
    path: '/animated',
    name: AnimatedScreen.name,
    builder: (context, state) => const AnimatedScreen(),
  ),
  // Ruta del menu de UI
  GoRoute(
    path: '/ui-controls',
    name: UiControlsScreen.name,
    builder: (context, state) => const UiControlsScreen(),
  ),
]);
