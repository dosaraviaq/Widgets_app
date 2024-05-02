// Estado => isDarkmodeProvider=bool
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgtes_app/config/theme/app_theme.dart';

// Listado de colores inmutable, llammos a los colores de (colorList)
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Para que volvamos poderosa la clase app_theme
// objeto de tipo AppTheme(custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE =Estado = new  AppTheme();
  ThemeNotifier() : super(AppTheme());

// Ahora con este metodo cambiaremos el tema de la app
  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
