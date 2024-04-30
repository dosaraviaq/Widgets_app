import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgtes_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  // Especificamos el key
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Para el menu
  int navDrawerIndex = 1;
  @override
  Widget build(BuildContext context) {
    // Definimos una variable para poder controlar el espacio de arriba en ios o android
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      // Agarra la variable definida
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          // Para obtener el valor del menu
          navDrawerIndex = value;
        });

        // LLamaremos al enlace del menuItem
        final menuItem = appMenuItems[value];
        // aca nos dirigimos a la seccion
        context.push(menuItem.link);
        // Para q cierre el menu con la variable local
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 16)),

        // Barrmos el menu, llamamos los elementos del menu
        ...appMenuItems.sublist(0, 3).map(
              (item) =>
                  // Construimos sus hijos
                  NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        // Despues de la linea divisora
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
// Texto de referencia
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 16),
          child: Text('More options'),
        ),

// Comienza desde la posicion 3
        ...appMenuItems.sublist(3).map(
              (item) =>
                  // Construimos sus hijos
                  NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
