import 'dart:async';

import 'package:desafio2_firebase/models/forma_modelo.dart';

class FormaProvider {
  static final FormaProvider _FormaProvider = new FormaProvider._();

  FormaProvider._();

  factory FormaProvider() {
    return _FormaProvider;
  }

  static final StreamController<List<FormaModelo>> _streamFormaController =
      new StreamController.broadcast();
  List<FormaModelo> lista = [];
  static Stream<List<FormaModelo>> get streamController =>
      _streamFormaController.stream;

  void limpiarLista() {
    _streamFormaController.sink.add(List.empty());
  }

  void cargarListado(List<FormaModelo> lista) {
    this.lista = [];
    this.lista.addAll(lista);
    _streamFormaController.sink.add(this.lista);
  }

  // String agregar(String nombre, String edad, Sexo sexo) {
  //   if (nombre.isEmpty) {
  //     return 'Ingrese un nombre';
  //   } else if (edad.isEmpty || int.tryParse(edad) == null) {
  //     return 'Ingrese una edad';
  //   }
  //   final persona =
  //       new PersonaModel(nombre: nombre, edad: int.parse(edad), sexo: sexo);
  //   this.lista.add(persona);
  //   _streamFormaController.sink.add(this.lista);

  //   return '';
  //}

  dispose() {
    _streamFormaController.close();
  }
}
