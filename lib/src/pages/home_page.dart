import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> formas = ['cuadrado', 'Círculo', 'Triángulo'];
    final List<String> colores = ['Celeste', 'Rosado', 'Amarillo'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Formas y Colores'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            _DropButtom(
              formas: formas,
            ),
            _DropButtom(
              formas: [],
              colores: colores,
            ),
            SizedBox(
              height: 30,
            ),
            _Cuadrado(),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Agregar')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Sincronizar')),
                ],
              ),
            )
          ],
        ));
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    int randomValor = (random.nextInt(150) + 80);

    return Container(
      width: randomValor.toDouble(),
      height: randomValor.toDouble(),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class _DropButtom extends StatelessWidget {
  final List<String>? formas;
  final List<String>? colores;

  const _DropButtom({this.formas, this.colores});

  @override
  Widget build(BuildContext context) {
    List<String>? items = [];
    if (formas!.isNotEmpty) {
      items = formas;
    } else {
      items = colores;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButtonFormField(
          onChanged: (_) {},
          hint: Text('Seleccione Opcioón'),
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          items: items!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}


//  '0xff00FFF9',
//       '0Xffff0f9f',
//       '0xffFFEA53'