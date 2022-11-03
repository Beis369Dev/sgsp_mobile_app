import 'package:flutter/material.dart';
// import 'package:sgsp_app/ui/pages/police_report_pages/add_or_edit_interveners.dart';
// import 'package:sgsp_app/ui/widgets/dropDown_btn.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';
// import 'package:sgsp_app/ui/widgets/supplements.dart';

// import '../../../widgets/inputs.dart';

// //validar y armar el json
// //**********Validaciones************
// //PERSONA => tine que tener un Rol,  tipo domiclio, situacion, ocupacion,

// //INDAGADO => req. Persona + ficha Indagado SITUACION*/
// // FUNCIONARIO ACTUNATE => cedula,sexo, campo ff.pp
// // DENUNCIANTE => Domicilio,telefono, situacion*,primer nombre ,ocupacion,sexo
// // VICITMA => Campo Victima, domicilio, situacion* , primer nombre ,ocupacion,sexo
// //T.Evento lo mimso que denucnainte

// //Modularizar mi fromulario, cada modulo maneja sus variables que se comunicon con una clase control
// //  con provider. Los modulos que son obligatorios a todos los intervienites se validan y envian su estado

// //   /*******Valores FF.PP******** */
// //   String ff_ppUnidad = "";
// //   String ff_ppGrado = "";
// //   String ff_ppDependenicia = "";
// //   /************VICTIMA************ */
// //   String lesionesVictima = "";
// //   /************INDAGADO************ */
// //   String lesionesIndagado = "";
// //   String medioFuga = "";
// //   String medioCirculacion = "";
// //   String disparos = "";
// // /**********CONDUCTOR*************** */
// //   String espirometria = "";

// // //***** validaciones segun roles ************/
// // // paso un objeto con todos los datos ingresados al momento y el rol a ingresar, valido y devuelvo un estado dentro de un objeto con los errores
validarIntervinientModelo(rol) {
  switch (rol) {
    case "INDAGADO":
      break;
    case "VICTIMA":
      break;
    case "FUNCIONARIO ACTUANTE":
      break;
    case "DENUNCIANTE":
      break;
    case "CONDUCTOR":
      break;
    case "TESTIGO EVENTO":
      break;

    case "TESTIGO ADMINISTRATIVO":
      break;
  }
}

//*********************************validaciones  Indagado********************** */

Map validarIndagado(
    {estatura, complexionFiscia, cutis, franjaEtarea, cabello}) {
  Map estado = {};
  if (estatura != "ESTATURA" &&
      complexionFiscia != "COMPLEXIÓN" &&
      cutis != "CUTIS" &&
      franjaEtarea != "FRANJA ETAREA" &&
      cabello != "CABELLO") {
    print("Ficha completa");
    return estado = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
  } else {
    print("todo mal");
    return estado = {"estado": true, Color: Colors.blue, "mensaje": ""};
  }
}

Map fichafuga(lesiones, medioFuga, medioCirculacion, disparos) {
  Map estadoFuga = {};
  if (lesiones != "lesiones" &&
      medioFuga != "medio de Fuga" &&
      medioCirculacion != "Medio de Circulacion" &&
      disparos != "disparos") {
    estadoFuga = {"estado": true, Color: Colors.blue, "mensaje": ""};
  } else {
    estadoFuga = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
  }
  return estadoFuga;
}

//*********************Validaciones Victima************************ */

lesionesVictima(lesiones) {
  Map estadoLesiones = {};

  if (lesiones != "Lesiones") {
    estadoLesiones = {"estado": true, Color: Colors.blue, "mensaje": ""};
  } else {
    estadoLesiones = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
    return estadoLesiones;
  }
}

//***********************Validacion ficha funcionario actuante************* */

Map validacionFichaFFPP(unidadEjecutora, dependencia, grado) {
  Map estadoFFPP = {};
  if (unidadEjecutora != "Unidad Ejecutora" &&
      dependencia != "dependencia" &&
      grado != "grado") {
    estadoFFPP = {"estado": true, Color: Colors.blue, "mensaje": ""};
  } else {
    estadoFFPP = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
  }
  return estadoFFPP;
}

//*************************Validaciones Denucniante y testigos****************** */

Map validacionesDenTes(primerNombre, ocupacion, sexo) {
  Map estadoCapo = {};

  if (primerNombre != "" && ocupacion != "ocupacion" && sexo != "Sexo") {
    estadoCapo = {"estado": true, Color: Colors.blue, "mensaje": ""};
  } else {
    estadoCapo = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
  }

  return estadoCapo;
}

//****Validacion Cedula ***********************/

Map validarCedula(cedula) {
  Map estadoCedula = {};
  if (cedula != "") {
    estadoCedula = {"estado": true, Color: Colors.blue, "mensaje": ""};
  } else {
    estadoCedula = {
      "estado": false,
      Color: Colors.red,
      "mensaje": "Debe completar la descripcion fisica"
    };
  }
  return estadoCedula;
}
