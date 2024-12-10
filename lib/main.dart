
import 'package:app_movie/body/container.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Movie_app());
}

class Movie_app extends StatelessWidget {
  const Movie_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Body(),
    );
  }
}

//Body
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Box()
      
    );
  }
}


