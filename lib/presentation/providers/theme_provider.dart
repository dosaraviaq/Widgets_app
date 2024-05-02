// Estado => isDarkmodeProvider=bool
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgtes_app/config/theme/app_theme.dart';

// Listado de colores inmutable, llammos a los colores de (colorList)
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);
