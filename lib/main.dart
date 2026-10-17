import 'package:flutter/material.dart';

import 'people_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador random de noms',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900], //Añadiendo un numero el color tendra mayor o menor intesidad de color, en este caso es un rojo oscuro (aunque realmente no hace falta poner un numero)
          foregroundColor: Colors.black, //En cambio el negro el blanco no hace falta ponerle un numero
          title: const Text(
            'Generador random de noms',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ), //La letra es negrita con este codigo
          ),
        ),
        body: PeopleList(),
      ),
    );
  }
}
