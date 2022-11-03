import 'package:flutter/material.dart';

import '../models/model_prueba.dart';

class IntervinientesRepositorio extends ChangeNotifier {
  final List<Interviniente> _eventoIntervinientes = [];
  bool _domicilioEstado = false;
  bool _fichaPersona = false;

  get domEstado => _domicilioEstado;
  set domEstadoSet(val) {
    _domicilioEstado = val;
    notifyListeners();
  }

  get estadoPersona => _fichaPersona;
  set estadoPersonaSet(val) {
    _fichaPersona = val;
    notifyListeners();
  }

  get listInterviniente => _eventoIntervinientes;

  void addInterviniente(obj) {
    _eventoIntervinientes.add(obj);
    _domicilioEstado = false;
    notifyListeners();
  }

  void deleteInterviniente(Intervineite) {
    _eventoIntervinientes.remove(Intervineite);
    notifyListeners();
  }

//*****editarRepositorio************** */
  void edictInterviniente(Interviniente inte, obj) {
    if (inte.persona.cedula == "") {
      inte.persona.primerNombre = obj["primerNombre"];
      inte.persona.primerApellido = obj["primerApellido"];
      inte.persona.segundoNombre = obj["segundoNombre"];
      inte.persona.segundoApellido = obj["segundoApellido"];
    }
    inte.persona.situacion = obj["situacion"];
    inte.persona.ocupacion = obj["ocupacion"];
    inte.persona.estadoCivil = obj["estadoCivil"];
    notifyListeners();
  }
}
