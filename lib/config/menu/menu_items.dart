import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

// Constructor constante no disponible
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  // Menu con5tadors
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'Introduccion a riverpod',
    link: '/counter-river',
    icon: Icons.add,
  ),
  // Tipos de botones
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botonrd en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  // Menu de tarjetas
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  // Menu de progress
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  // Menu de los snackbars
  MenuItem(
    title: 'Snackbras y dialogs',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  // Menu de animaciones
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  // Menu de ui
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  // Menu dela presentacion de nuestra app
  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  // Menu para el infinite scroll
  MenuItem(
    title: 'InfiniteScroll y Pull',
    subTitle: 'Listas infinites y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  // Para cambiar el tema de la app
  MenuItem(
    title: 'Cambiar tema',
    subTitle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
