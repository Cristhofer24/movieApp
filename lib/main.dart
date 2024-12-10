import 'package:flutter/material.dart';
import 'package:app_movie/body/container.dart';
import 'screens/inicioSesion.dart';
import 'screens/registro.dart';
import 'screens/pantalla1.dart';
import 'screens/pantalla2.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Body(), // Pantalla inicial
        '/inicio-sesion': (context) => const InicioSesionScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/pantalla1': (context) => const Pantalla1(),
        '/pantalla2': (context) => const Pantalla2(),
      },
    );
  }
}

// Body
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Box(),
    );
  }
}

// Modificar Box para usar navegación
class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: const [
              Color.fromARGB(255, 39, 80, 155),
              Color.fromARGB(255, 18, 9, 110),
              Color.fromARGB(234, 2, 4, 67),
            ],
          ),
          image: const DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/free-photo/movie-background-collage_23-2149876005.jpg?semt=ais_hybrid"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Iniciar sesión",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: emailInput(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: passwordInput(),
              ),
              iniciarBtn(context),
              registroBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget iniciarBtn(BuildContext context) {
    return FilledButton(
      onPressed: () {
        // Navegar directamente a la pantalla 1 (pantalla principal después del inicio de sesión)
        Navigator.pushReplacementNamed(context, '/pantalla1');
      },
      child: const Text("Iniciar sesión"),
    );
  }

  Widget registroBtn(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, '/registro');
          },
          child: const Text("Registrarse"),
        ),
      ),
    );
  }

  Widget emailInput() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        label: const Text("Ingrese su correo"),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
