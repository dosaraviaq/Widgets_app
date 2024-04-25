// Para manejar los numeros randon
import 'dart:math' show Random;
import 'package:flutter/material.dart';

// Transformamos el StatelessWidget a un StatefulWidget
class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 120;

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        // AnimatedContainer -->
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          //  curve --> para definir su tipo de animacion
          curve: Curves.elasticOut,
          // Prevenimos si los valores randomicos son menores a 0
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          // Caja
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      // Boton
      floatingActionButton: FloatingActionButton(
        // Llamamos a la funcion que nos retornna valores aleatorios
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
