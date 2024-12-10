import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de URLs de imágenes
    final List<String> imageUrls = [
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fairytale-old-vintage-book-cover-template-design-5ff0b48b07be66f694dcd67101cefa12.webp?ts=1698539848',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/cat-book-cover-design-template-621e8ade895070312b4c1449a90cd0a5.jpg?ts=1637017314',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fairy-fiction-gold-woman-book-cover-template-design-ad3fb54ade2edab814993b8f00f2c5c7.jpg?ts=1637015206',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-ebfefbf4ede371be0f6f9148ccd4d393.webp?ts=1698538444',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/black-modern-%26-minimal-thriller-movie-a4-design-template-f7699e08783a8d09096c14bc784f29ec.webp?ts=1726113621',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/black-3d-burlesque-party-poster-design-template-6ef303db74f71429f86eaba7be1cdece.webp?ts=1730377818',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/small-town-stories-book-cover-design-template-f1530f89ef696891023f99926dd2608c.jpg?ts=1637015773',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/haunted-house-horror-book-cover-template-design-5b76d0d801b76b48642aa0f65e3d4547.webp?ts=1698538144',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/dragon-fantasy-adventure-book-cover-design-template-1f296b2e3e609f67012e09def36d9cc2.jpg?ts=1637015687',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/horror-stories-book-cover-template-design-a24f59cce3d3f3b88d31bf56630bb84b.webp?ts=1698537718',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/night-stars-adventure-camp-stars-book-cover-design-template-9ab06209f88e28cfc52495d40c0f77ee.webp?ts=1698543262',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/surreal-winter-book-cover-movie-template-design-e16233a39b4eac187203001e59562119.jpg?ts=1636989545',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/romance-book-love-tree-cover-design-template-a07ada3d2dd482d4609180bf762c69ac.webp?ts=1698539872',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fiction-robot-woman-book-cover-template-design-dbd0a99e83a4926f2ce4de52de48b23b.webp?ts=1698543483',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/film-poster-design-template-81f17589e382892e2b3ec385f7fa232c_screen.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogo de Peliculas'),
        backgroundColor: Color.fromARGB(255, 113, 39, 155), // Color del AppBar
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Icono de salir
            onPressed: () {
              // Aquí va la lógica para cerrar sesión
              print("Cerrar sesión");
              // Puedes usar Navigator.pop(context) si es necesario
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings), // Icono de configuración
            onPressed: () {
              // Aquí va la lógica para las configuraciones
              print("Ir a la configuración");
            },
          ),
        ],
      ),
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
        ),
        child: Column(
          children: [
            // Navegación mediante botón
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pantalla2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                       Color.fromARGB(255, 113, 39, 155), // Color del botón
                ),
                child: const Text(
                  'Ir al Reproductor de Video',
                  style: TextStyle(color: Colors.white), // Color del texto
                ),
                // color para el texto
              ),
            ),
            // Cartas con imágenes
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/pantalla2');
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              imageUrls[index],
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Opcion ${index + 1}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                             
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
