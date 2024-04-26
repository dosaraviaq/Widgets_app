import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Clase para la presentacion

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

// Contructor
  SlideInfo(this.title, this.caption, this.imageUrl);
}

// Definimos una lista en la variable slides -->
final slides = <SlideInfo>[
  // Llamamos al constructor
  SlideInfo(
      'Busca la comida',
      'Incididunt adipisicing enim cupidatat ut sit cupidatat magna nulla dolore proident fugiat.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Pariatur laboris velit voluptate aliqua magna ut commodo occaecat proident est esse.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ea velit deserunt amet deserunt sint eu irure minim proident in excepteur.',
      'assets/images/3.png'),
];

// StatelessWidget --> convertimos a un StatefulWidget para el manejo de los controllers
class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  // Variable para manejar lo controles asi como los de Youtube
  final PageController pageviewController = PageController();
  // Declaramos la variable para captar la ultima pantalla
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        // Solo entraremos una ves
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // Para no consumir mucha memoria
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Colocamos el fondo blanco
      backgroundColor: Colors.white,
      //  USaremos el Stack --> para agregar la opcion de skip
      body: Stack(
        children: [
          // EL PageView --> es para que podamos desplazarnos
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            // Llamamos a nuestra lista (slides) y al statless (_Slide) pasandole  los parametros
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),

          // Positioned --> Para poder ubicarlo en una buena posicion
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  // FadeInRight --> animate_do
                  child: FadeInRight(
                    // Se movera en 15 unidades
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// Creamos un stateless para llamar a la lista y cargar los datos
class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Para decorar nuestro texto
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // En sus hijos de la columna estructuramos con los valores de la lista
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
