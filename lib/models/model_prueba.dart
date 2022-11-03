import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/narration_view.dart';

class Persona {
  String? primerNombre;
  String? segundoNombre;
  String? primerApellido;
  String? segundoApellido;
  DateTime? nacimiento;
  String? cedula;
  String? domicilio;
  String? situacion;
  String? ocupacion;
  String? nacionalidad;
  String? sexo;
  String? estadoCivil;

  Persona(
      {this.cedula,
      this.primerNombre,
      this.segundoNombre,
      this.primerApellido,
      this.segundoApellido,
      this.nacimiento,
      this.situacion,
      this.domicilio,
      this.ocupacion,
      this.nacionalidad,
      this.sexo,
      this.estadoCivil});
}

class Interviniente extends Persona {
  String rol;
  Persona persona;
  DescripcionFisica? descripcion;
  InfoIndagado? fichaIndagado;
  String? espirometria;
  String? lesionesVictima;
  Detenido? detenido;
  FF_PP_Actuante? funcionarioActuante;
  Interviniente(this.rol, this.persona);
}

class FF_PP_Actuante {
  String grado;
  String unidadEjecutora;
  String dependencia;
  bool? tomoDenuncia;
  String? lugarTomoDenucnia;

  FF_PP_Actuante(this.dependencia, this.lugarTomoDenucnia, this.grado,
      this.tomoDenuncia, this.unidadEjecutora);
}

class DescripcionFisica {
  String? estatura;
  String? complexionFisica;
  String? cutis;
  String? franjaEtarea;
  String? sexo;
  String? cabello;

  DescripcionFisica(this.cabello, this.complexionFisica, this.cutis,
      this.estatura, this.franjaEtarea, this.sexo);
}

class InfoIndagado {
  String? lesiones;
  String? medioCirculacion;
  String? medioFuga;
  String? disparos;

  InfoIndagado(
      this.disparos, this.lesiones, this.medioCirculacion, this.medioFuga);
}

class Detenido {
  DateTime fechaDetenido;
  TimeOfDay horaDetenido;

  Detenido(this.fechaDetenido, this.horaDetenido);
}

class Evento {
  late int numSGSP;
  late TituloEvento titulo;
  late Map<String, DateTime> fechaEvento;
  late DateTime conocimiento;
  late Map<String, String> ubicacion;
  late Map<String, Interviniente> intervinientes;
  late CampoNarracion seccionNarracion;
  List<String>? autoridadsIntervivneites;
  List<String>? jusgadosFiscalia;
  List<Vehiculo>? vehiculos;
  List<Objetos>? objetos;

  Evento(
      this.numSGSP,
      this.titulo,
      this.fechaEvento,
      this.conocimiento,
      this.ubicacion,
      this.intervinientes,
      this.seccionNarracion,
      this.autoridadsIntervivneites,
      this.objetos,
      this.vehiculos);
}

class TituloEvento {
  String titulo;
  String tipo;
  String? complemento;
  String modalidad;

  TituloEvento(this.tipo, this.titulo, this.modalidad, this.complemento);
}

class Vehiculo {
  String tipo;
  String matricula;
  String numChasis;
  String numMotor;
  String marca;
  String modelo;
  String estado;
  String color;

  Vehiculo(this.matricula, this.tipo, this.estado, this.marca, this.modelo,
      this.color, this.numChasis, this.numMotor);
}

class Objetos {
  String tipo;
  String estado;
  String descripcion;

  Objetos(this.tipo, this.estado, this.descripcion);
}

class CampoNarracion {
  bool statusNarration = false;
  List<String> fiscaliasJuzgados;
  String narracion;
  String supervisor;
  String? diagnosticoMedico;
  String? resoucionJudicial;

  CampoNarracion(this.statusNarration, this.narracion, this.supervisor,
      this.diagnosticoMedico, this.resoucionJudicial, this.fiscaliasJuzgados);
}
