import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      // Cuerpo
      body: const _UiControlsView(),
    );
  }
}

// StatefulWidget --> Para manejar el estado del checkbook
class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

// RadioListTile --> trabajaremos con enum
enum Tranportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  // Para el checkboxlist
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  // De la lista de los enum sacamos el dato car
  Tranportation selectedTransportation = Tranportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Quitamos el rebote
      physics: const ClampingScrollPhysics(),
      // Manejamos a sus hijos
      children: [
        // SwitchListTile --> manejo de checkbooks
        SwitchListTile(
            title: const Text("Developer Mode"),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                // Para que vaya cambiando el estado de true a false
                isDeveloper = !isDeveloper;
              });
            }),

        // Trabajaremos con  ExpansionTile(es como algo desplegable)
        ExpansionTile(
          title: const Text('Vehiculo'),
          // Ipotesis trabajamos en un statefull y estamos en el build, eso nos permite ver los cambios
          subtitle: Text('$selectedTransportation'),
          // en los hijos colocaremos todos los RadioListTile
          children: [
            // Trabajaremos con el radioListTile
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Tranportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Tranportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Tranportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Tranportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avión'),
              value: Tranportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Tranportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Tranportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Tranportation.submarine;
              }),
            ),
          ],
        ),

        // Ahora trabajaremos con lo que es CheckboxListTile
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
