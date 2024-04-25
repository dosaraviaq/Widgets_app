import 'package:flutter/material.dart';

// Definimos un listado de varias tarjetas
const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  // name de la rutaa[app_route.dart]
  static const String name = 'card_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards  Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    // Controlaremos el desbordamiento con --> SingleChildScrollView
    return SingleChildScrollView(
      child: Column(
        children: [
          // Barremos todas las tarjetas que tenemos y regresaremos un nuevo widget
          ...cards.map(
            (card) =>
                _CardType1(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType2(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType3(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType4(elevation: card['elevation'], label: card['label']),
          ),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // Tarjeta
    return Card(
      elevation: elevation,
      // Espacio adentro de la caja
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          // Los hijos de la columna
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // Importante para cambiar la apariencia de los boton
    final colors = Theme.of(context).colorScheme;
    // Tarjeta
    return Card(
      // forma de la tarjeta
      shape: RoundedRectangleBorder(
          // Para tener un borde algo redondeado
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: colors.outline,
          )),
      elevation: elevation,
      // Espacio adentro de la caja
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          // Los hijos de la columna
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // Tarjeta
    return Card(
      // Utilizamos el color --> surfaceVariant
      color: colors.surfaceVariant,
      elevation: elevation,
      // Espacio adentro de la caja
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          // Los hijos de la columna
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // Tarjeta
    return Card(
      // Evitamios que sus hijos se salgan --> clipBehavior
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      // Espacio adentro de la caja
      child: Stack(
        // Stack --> Coloca sus hijos uno sobre otros
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
