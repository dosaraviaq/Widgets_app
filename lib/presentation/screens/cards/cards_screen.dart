import 'package:flutter/material.dart';

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
      body: const Placeholder(),
    );
  }
}
