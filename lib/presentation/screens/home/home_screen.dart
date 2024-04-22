import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgtes_app/config/menu/menu_items.dart';
import 'package:widgtes_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  // Para el name de las rutas nunca cambiara
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
        // centerTitle: true,
      ),
      // ListView
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
//  Text('nombre');
// ListTitle
  @override
  Widget build(BuildContext context) {
    // Manejo de ListView
    return ListView.builder(
      // Moviemiento cuando se hace scroll
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        // Se muestra lo de la lista
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

// Lista que se muestra en pantalla
class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    // Para Manejar los colores primarios y secundarios
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      // Vemos la diferencia en los iconos
      // Icono que usamos al lado izquierdo
      leading: Icon(menuItem.icon, color: colors.primary),
      // Icono en el lado derecho
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
      // Habiltams en ontap para el evento del Splash
      onTap: () {
        // Todo navegar a otra pantalla
        //  contex --> arbol de componentes
        // push --> otra pagina otra y otra pantalla
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // ); forma 1
        // Segunda Forma
        // Llama a las rutas
        // -------
        // Para cambiar la pantalla es --> go
        // Para regresar la pantalla es --> push
        context.push(menuItem.link);
        // Solo con go_router
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
