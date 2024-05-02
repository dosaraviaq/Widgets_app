import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgtes_app/presentation/providers/theme_provider.dart';

// StatelessWidget --> ConsumerWidget --> manejo de Riverpod
class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

// WidgetRef --> riverpod
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            // Para el tema dark o ligth
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              // Aca agregamos la funcionalidad de los botones
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      // Colores disponibles
      body: const _ThemeChangerView(),
    );
  }
}

// Lista de colores
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    // LLamamos a la variable q usa Riverpod para los colores
    final List<Color> colors = ref.watch(colorListProvider);
    // Para seleccionar el color
    final int selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      // Agarra el tamaño de la lista
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              // Color seleccionado
              ref.read(selectedColorProvider.notifier).state = index;
            });
      },
    );
  }
}
