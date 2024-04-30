import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// StatelessWidget --> StatefulWidget --> para el listView.Builder
class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
// Creamos una lista para el listView
  List<int> imagesIds = [1, 2, 3, 4, 5];
  // Definimos un ScrollController para cargar las imagenes de la lista
  final ScrollController scrollController = ScrollController();
  // Colocamos una bandera
  bool isLoading = false;
  // Otra bandera para cuando se salga de la seccion del menu
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    // En aca vamos a definir si nos encontramos en el final
    // scrollController.position.pixels --> Posicion actual
    // scrollController.position.maxScrollExtent --> Posicion Final
    // Añadimos mas imagenes al final del scroller
    scrollController.addListener(() {
      // En el if preguntamos si se llego al final de la pantalla
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // Limpiamos el controlador
    scrollController.dispose();
    // Para destruir las secciones de las tarjetas
    isMounted = false;
    super.dispose();
  }

// Para que se cargen mas imagenes
  Future loadNextPage() async {
    // Si esta cargado entonces debe salirse
    if (isLoading) return;
    isLoading = true;
    // Para q se recargue en tiempo real
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
// Aca controlamos la salida brusca de la seccion se maneja en el (Dispoose)
    if (!isMounted) return;
    setState(() {});
    moveScrollBottom();
  }

// Colocaremos un icono al finalizar el scroll
  void moveScrollBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    // Agarramos el ultimo valor de la lista
    final lastId = imagesIds.last;
    // Insertamos elementos a la lista
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

// Para agregar el icono de refresh en la parte superior
  Future<void> onRefresh() async {
    // Aca para el icono del boton
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    // Si no esta montado q se salga
    if (!isMounted) return;
    isLoading = false;
    // La logica q usa aca es para que cambie las imagenes
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    // Para q refresque en tiempo de ejecucion
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // MediaQuery.removePadding -->  lo usaremos para quitar el espacio de arriba y de abajo de la pantalla
      body: MediaQuery.removePadding(
        context: context,
        // Parte de arriba
        removeTop: true,
        // Parte de abajo
        removeBottom: true,
        // RefreshIndicator --> Para colocar la imagen de cargando en la parte superior
        child: RefreshIndicator(
          // LLamamos al metodo q muestra el icono de refrescar en la parte superior
          onRefresh: onRefresh,
          // Pocisiones
          edgeOffset: 10,
          strokeWidth: 2,
          // ListView.builder --> lista inifinita Eficiente
          child: ListView.builder(
              // Llamammos al (scrollController) que lo definimos arriba
              controller: scrollController,
              // Agarramos el tamaño de la lista (imagesIds)
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                // FadeInImage Carga las imagenes
                return FadeInImage(
                  // Para que tome el espacio q tiene
                  fit: BoxFit.cover,
                  // Agarra todo el ancho disponible
                  width: double.infinity,
                  height: 300,
                  // Esta imagene se encuentra en la carpeta de los assets
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  // Llamamos a las imagenes con el id de la lista (imagesIds)
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                );
              }),
        ),
      ),
      // Boton Flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // Colocamos un ternario para el usurio para q sepa que hay mas imagenes
        child: isLoading
            ? FadeIn(
                // SpinPerfect --> es para que gire
                child: SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                ),
              )
            //  Utilizamos FadeIn--> para que sea mas amigable su animacion
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}

// Video 0,18 min 62