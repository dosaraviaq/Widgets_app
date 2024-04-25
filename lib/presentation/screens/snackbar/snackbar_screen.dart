import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'Snackbar_screen';
  const SnackbarScreen({super.key});

// Metodo para mostrar nuestro SnackBar
  void showCustomSnackbar(BuildContext context) {
    // Limpiamos el snackbar para mejorar la eficiencia de la app
    ScaffoldMessenger.of(context).clearSnackBars();

    final snakback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
// Caegamos la operacion
    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

// Metodo de nuestro proopio dialogo
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      // Este --> barrierDismissible --> sirve para que no se cierre la alerta cuando se toque la pantalla.
      barrierDismissible: false,
      // builder --> tiempo de ejecución
      builder: (context) => AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: const Text(
            'Consectetur adipisicing voluptate fugiat velit et ullamco mollit tempor voluptate veniam nulla. Reprehenderit exercitation ipsum elit velit anim aliquip commodo Lorem labore qui commodo occaecat aute. Ea proident est Lorem officia sunt magna sunt nulla officia reprehenderit.'),
        // Botones del dialogo
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () {}, child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbaras y Dialogos'),
      ),

      body: Center(
        child: Column(
          // Centra el boton
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  // Parrafo del dialogo de las licencias
                  const Text(
                      'Enim irure non amet reprehenderit aute. Nisi minim ad adipisicing quis aliqua in do proident quis. Cillum aliqua cupidatat elit pariatur qui irure sunt culpa occaecat occaecat culpa nulla aute..')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              // Mandamos a llamar el metodo
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo de pantalla'),
            ),
          ],
        ),
      ),
      // Bottom Flotante
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        // Llamamos a nuestro snackbar
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
