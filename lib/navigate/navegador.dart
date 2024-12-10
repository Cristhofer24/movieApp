import 'package:flutter/material.dart';
import 'package:app_movie/screens/pantalla1.dart';
import 'package:app_movie/Screens/pantalla2.dart';

class Navegador extends StatelessWidget {
  const Navegador({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const Pantalla1(),
        '/pantalla2': (context) => const Pantalla2(),
      },
    );
  }
}
