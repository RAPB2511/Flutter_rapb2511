import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <String>[];
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.black);
  final _randomNames = RandomNames(Zone.catalonia);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          for (var j = 0; j < 10; j++) {
            _suggestions.add(_randomNames.fullName());
          }
        }
        final bool esPar = i.isEven; //Con esto miramos si es par o impar

        return Column(
          children: [
            ListTile(
              tileColor: esPar ? Colors.red[100] : Colors.blue[100],
              title: Text(_suggestions[i], style: _biggerFont),
              onTap: () {
                //Aqui se le dice que si se presiona el nombre se muestre el mismo en la parte inferior de la pantalla con el nombre seleccionado
                ScaffoldMessenger.of(context).clearSnackBars(); //con esto al presionar otro nombre mientras el mensaje anterior esta en pantalla, el mensaje anterior desaparece y se muestra el nuevo nombre
                ScaffoldMessenger.of(context).showSnackBar(
                  //te muestra un nombre en la parte inferior de la pantalla
                  SnackBar(
                    content: Text(
                      'Has seleccionat a: ${_suggestions[i]}',
                      style: _biggerFont,
                    ), //color del texto de la snackbar
                    backgroundColor: Colors.yellow[300], //el mensaje que se mostrara en la parte inferior de la pantalla con el fondo amarillo y el texto en negro
                    duration: Duration(seconds: 10), // la duracion del mensaje en la parte inferior de la pantalla, en este caso 10 segundos
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
