import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Circular progress inidicator"),
          SizedBox(height: 10),
          // Progress circular
          CircularProgressIndicator(
            strokeWidth: 2,
            // Cambiamos el fondo del progress
            backgroundColor: Colors.black45,
          ),

          SizedBox(height: 20),
          Text("Circular y Linear Idicator controlado"),
          SizedBox(height: 10),
          _ControlledProgresIndicator(),
        ],
      ),
    );
  }
}

// Statless Controlado se llenara una ves  completado la animacion
class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    // StreamBuilder --> Contruye algo en tiempo de ejecucion
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100; // 0.0, 1.0
      }).takeWhile((value) => value < 100),
      // builder --> va junto con el StreamBuilder
      // snapshot --> Trabaja con el stream que completamos
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Progress circular
              CircularProgressIndicator(value: progressValue, strokeWidth: 2),
              const SizedBox(height: 20),
              // Expanded --> Indica que tomes todo el espacio que te esta dando el padre, esto nos sirve para q trabajemos con el --> LinearProgressIndicator
              Expanded(child: LinearProgressIndicator(value: progressValue))
            ],
          ),
        );
      },
    );
  }
}
