import 'package:app_movie/Screens/registro.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 39, 80, 155),
              Color.fromARGB(255, 18, 9, 110),
              Color.fromARGB(234, 2, 4, 67),
            ],
          ),
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/free-photo/movie-background-collage_23-2149876005.jpg?semt=ais_hybrid"),
            fit: BoxFit.cover,
            opacity:
                0.4, // Opcional: disminuye la opacidad de la imagen para no ocultar los campos
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titulo de la aplicación
              Text(
                "Iniciar sesión",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: emailInput(),
               ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: passwordInput(),
               ),
               iniciar_btn(context),
               registro_btn(context)
             
            ],
          ),
        ),
      ),
    );
  }
}


TextEditingController emailController = TextEditingController();
Widget emailInput(){
  return TextField(
    controller: emailController,
    decoration: InputDecoration(
         label: Text("Ingrese su correo"),
        fillColor: Colors.white,
       filled: true,
      border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
   
}

TextEditingController passwordController = TextEditingController();
Widget passwordInput(){
  return TextField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Contraseña',
        fillColor: Colors.white,
       filled: true,
      border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
      ),
      
    ),
  );
}

Widget iniciar_btn(context){
  return FilledButton(onPressed: ()=>(context),
   child: Text("Iniciar sesión"),
   );
}

Widget registro_btn(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,  // Alinea el botón al centro en la parte inferior
    child: Padding(
      padding: const EdgeInsets.all(16.0), // Padding para dejar espacio
      child: FilledButton(
        onPressed: () {
          // Navegación hacia la pantalla de registro
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistroScreen()),
          );
        },
        child: Text("Registrarse"),
      ),
    ),
  );
}