import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: const Center(
        child: Text('Hola Flutter'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //Item 1
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            activeIcon: const Icon(Icons.home_filled),
            label: 'Inicio',
            backgroundColor: colors.primary,
          ),
          //Item 2
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: 'Perfíl',
            backgroundColor: colors.tertiary,
          ),
          //Item 3
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: 'Configutacion',
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }
}
