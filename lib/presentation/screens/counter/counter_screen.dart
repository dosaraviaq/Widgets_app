import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgtes_app/presentation/providers/counter_provider.dart';
import 'package:widgtes_app/presentation/providers/theme_provider.dart';

// Trabajaremos con Riverpod para lo cual convertiremos un (StatelessWidget) a un (ConsumerWidget)
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

// (WidgetRef ref) --> Riverpod
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Para que empiece a contar
    final int clickCounter = ref.watch(counterProvider);
    // Para cambiar el them a
    final bool isDarkMode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
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
      body: Center(
        child: Text(
          // Mostramos el valor incrementado con RiverPOd
          "Valor: ${clickCounter}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          // Incremento de valores
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
