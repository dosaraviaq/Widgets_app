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
]);
