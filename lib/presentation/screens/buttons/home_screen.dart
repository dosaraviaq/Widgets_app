import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  // name de la rutaa
  static const String name = 'button_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      // Primer tipo de btn
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();
  @override
  Widget build(BuildContext context) {
    // Colores primarios
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //Wrap-->Similar a las columns y rows, va acomodando a la derecha segun el espacio
        child: Wrap(
          spacing: 10, // Para el espacio de botones
          alignment: WrapAlignment.center, // Centrar Los botones
          //children--> Botones que voy a colocar
          children: [
            // Segundo btn
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated Button")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("Elevated Icon"),
            ),
            // Tercera forma de realizar un btn
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            //Cuarta forma de realizar un btn
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ad_units),
              label: const Text("Filled Icon"),
            ),
            // Quinta forma de realizar un btn
            OutlinedButton(onPressed: () {}, child: const Text("Outline")),
            // Sexta forma de realizar un btn
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text("Outline Icon"),
              icon: const Icon(Icons.nat_sharp),
            ),
            // Septima forma de realizar un btn
            TextButton(onPressed: () {}, child: const Text('text')),
            // Octaba forma de realizar un btn
            TextButton.icon(
              onPressed: () {},
              label: const Text('text'),
              icon: const Icon(Icons.zoom_out_outlined),
            ),
            // Novena forma de realizar un btn
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.app_registration)),
            // Decima forma de realizar un btn
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            const CustomButtom(),
          ],
        ),
      ),
    );
  }
}

// Mis Botones personalizados
class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    // LLamamos a nuestros colores definidos
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      // Para redondear el btn
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        // Material-->widget especial, es para definir el splas entr cosas.
        child: InkWell(
          // InkWell--> efecto de aplastar la pantalla
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text(
              "Hola Mundo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
