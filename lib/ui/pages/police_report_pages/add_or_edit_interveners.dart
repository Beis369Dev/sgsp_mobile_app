import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/widgets/alerts.dart';

import 'package:sgsp_app/ui/widgets/dropDown_btn.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';
import 'package:sgsp_app/ui/widgets/supplements.dart';

import '../../../models/model_prueba.dart';
import '../../widgets/domicilio_persona.dart';
import '../../widgets/inputs.dart';
import 'interveners.dart';

class Add_or_Edit_Interveners extends StatefulWidget {
  late var controller;
  late var modo;
  Add_or_Edit_Interveners({Key? key, this.controller, this.modo})
      : super(key: key);

  @override
  State<Add_or_Edit_Interveners> createState() =>
      _Add_or_Edit_IntervenersState();
}

class _Add_or_Edit_IntervenersState extends State<Add_or_Edit_Interveners> {
  //******Variable  Datos Personales******** */
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _passPort = TextEditingController();
  final TextEditingController _primerNombre = TextEditingController();
  final TextEditingController _primerApellido = TextEditingController();
  final TextEditingController _segundoNombre = TextEditingController();
  final TextEditingController _segundoApellido = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _num_puerta = TextEditingController();
  final TextEditingController _num_hab = TextEditingController();

  bool valueSwtich = false;
//******************DROPDOWNBUTTON VALUES Persona*****************/
  String rol = "DENUNCIANTE";
  String situacion = "SITUACION";
  String ocupacion = "OCUPACION";
  String estadoCivil = "ESTADO CIVIL";
  /**************descripcion fiscia*********** */
  String estatura = "ESTATURA";
  String complexionFiscia = "COMPLEXIÓN";
  String cutis = "CUTIS";
  String sexo = "SEXO";
  String franjaEtarea = "FRANJA ETAREA";
  String cabello = "CABELLO";
/*************Detencion Variables************** */
  TimeOfDay horaDetencion = TimeOfDay.now();
  DateTime fechaDetencion = DateTime.now();

//***Variables ficha FF.PP actuante********-/
  bool tomaDenuncia = false;
  String lugarTomaDenuncia = "Dependeicia Polcial";
  String unidadEjecutora = "Uni. Ejecutora";
  String dependeincia = "Dependenicia";
  String grado = "";

/** Variables Conductor********/

  final TextEditingController espirometria = TextEditingController();

/***********variables Indagado Lesiones y medio de fuga */
  String lesionesIndagado = "Lesiones";
  String medioCirculacion = "Medio Circulacion";
  String medioFuga = "Medio Fuga";
  String disparos = "Disparos";

/********Varaibles Lesiones Victima*********/

  String lesionesVictima = "Lesiones";

/** */

  @override
  void initState() {
    if (widget.modo["modificar"]) {
      Interviniente loco = widget.modo["data"];
      _cedula.text = widget.modo["data"].persona.cedula;
      _primerNombre.text = loco.persona.primerNombre!;
      _primerApellido.text = loco.persona.primerApellido!;
      _segundoNombre.text = loco.persona.segundoNombre!;
      _segundoApellido.text = loco.persona.segundoApellido!;
      _telefono.text = loco.persona.primerNombre!;
      espirometria.text =
          (loco.espirometria == null) ? " " : loco.espirometria!;
      //**Set Selectores********* */
      rol = loco.rol;
      situacion = loco.persona.situacion!;
      ocupacion = loco.persona.ocupacion!;
      estadoCivil = loco.persona.estadoCivil!;
      //****ficha indagado******* */
      lesionesIndagado =
          (loco.fichaIndagado == null) ? "" : loco.fichaIndagado!.lesiones!;
      medioFuga =
          (loco.fichaIndagado == null) ? "" : loco.fichaIndagado!.medioFuga!;
      medioCirculacion = (loco.fichaIndagado == null)
          ? ""
          : loco.fichaIndagado!.medioCirculacion!;
      disparos =
          (loco.fichaIndagado == null) ? "" : loco.fichaIndagado!.disparos!;
      //****descripcion fisica********** */
      sexo = (loco.descripcion == null) ? "" : loco.descripcion!.sexo!;
      estatura = (loco.descripcion == null) ? "" : loco.descripcion!.estatura!;
      complexionFiscia =
          (loco.descripcion == null) ? "" : loco.descripcion!.complexionFisica!;
      cabello = (loco.descripcion == null) ? "" : loco.descripcion!.cabello!;
      cutis = (loco.descripcion == null) ? "" : loco.descripcion!.cutis!;
      franjaEtarea =
          (loco.descripcion == null) ? "" : loco.descripcion!.franjaEtarea!;
      //*****Ficha policia********* */
      unidadEjecutora = (loco.funcionarioActuante == null)
          ? ""
          : loco.funcionarioActuante!.unidadEjecutora;
      dependeincia = (loco.funcionarioActuante == null)
          ? ""
          : loco.funcionarioActuante!.dependencia;
      grado = (loco.funcionarioActuante == null)
          ? ""
          : loco.funcionarioActuante!.grado;
      tomaDenuncia = (loco.funcionarioActuante == null)
          ? false
          : loco.funcionarioActuante!.tomoDenuncia!;
      //****Lesiones Victima******* */
      lesionesVictima =
          (loco.lesionesVictima == null) ? "" : loco.lesionesVictima!;

      super.initState();
    }
  }

  @override
  void dispose() {
    _cedula.dispose();
    _passPort.dispose();
    _primerNombre.dispose();
    _primerApellido.dispose();
    _segundoNombre.dispose();
    _segundoApellido.dispose();
    _telefono.dispose();
    _num_puerta.dispose();
    _num_hab.dispose();
    espirometria.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
//*********SetState dropDownButton************************ */
  void setRol(val) {
    setState(() {
      rol = val;
    });
  }

  void setSituacion(val) {
    setState(() {
      situacion = val;
    });
  }

  void setOcupacion(val) {
    setState(() {
      ocupacion = val;
    });
  }

  void setEstadoCivil(val) {
    setState(() {
      estadoCivil = val;
    });
  }

  /**SetState DropDownButon Descripcion Fiscia ************ */

  void setSexo(val) {
    setState(() {
      sexo = val;
    });
  }

  void setEstatura(val) {
    setState(() {
      estatura = val;
    });
  }

  void setComplexionFisica(val) {
    setState(() {
      complexionFiscia = val;
    });
  }

  void setFranjaEtarea(val) {
    setState(() {
      franjaEtarea = val;
    });
  }

  void setCutis(val) {
    setState(() {
      cutis = val;
    });
  }

  void setCabello(val) {
    setState(() {
      cabello = val;
    });
  }

  void setHoraFechaDetenido(F, H) {
    setState(() {
      fechaDetencion = F;
      horaDetencion = H;
    });
  }

  //***********Set ficha FF.PP************** */

  void setUnidadEjecutora(val) {
    setState(() {
      unidadEjecutora = val;
    });
  }

  void setDependencia(val) {
    setState(() {
      dependeincia = val;
    });
  }

  void setGrado(val) {
    setState(() {
      grado = val;
    });
  }

  void setlugarTomaDenuncia(val) {
    setState(() {
      lugarTomaDenuncia = val;
    });
  }

//*********Indagado Lesiones y medio de fuga********** */

  void setlecionesIndagado(val) {
    setState(() {
      lesionesIndagado = val;
    });
  }

  void setMedioCirculacion(val) {
    setState(() {
      medioCirculacion = val;
    });
  }

  void setMedioFuga(val) {
    setState(() {
      medioFuga = val;
    });
  }

  void setDisparos(val) {
    setState(() {
      disparos = val;
    });
  }

  //******************Lesiones Victima***************/

  void setLesionesVictima(val) {
    setState(() {
      lesionesVictima = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Agregar Interviniente"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  if (widget.modo["modificar"]) {
                    widget.controller
                        .edictInterviniente(widget.modo["data"], editInt());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Intervenes()));
                  } else {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();

                      validarIntervinientModelo(rol, widget.controller);
                      setValuesfichas();
                    } else {
                      AlertMethod(context, "Debe completar el domicilio");
                    }
                  }
                },
                icon: const Icon(
                  Icons.check,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Container(
              decoration: customize_Box_white,
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Rol: ",
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                    ),
                  ),
                  DropDown_btn1(
                    rolesList,
                    rol,
                    setData: setRol,
                  )
                ],
              ),
            ),
            //***************************Mensaje detenido******************** */
            (situacion == "DETENIDO")
                ? Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: customize_Box_white,
                    child: Column(
                      children: [
                        DropDown_btn1(motivoDetencionList, "MOTIVO DETENCION",
                            setData: () {}),
                        SelectDateTime(setDateAndTime: setHoraFechaDetenido),
                      ],
                    ),
                  )
                : SizedBox(),

            /************************Busqueda de Cedula y Pasaporte****** */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("C.I"),
                Switch.adaptive(
                    value: valueSwtich,
                    onChanged: (value) =>
                        setState(() => this.valueSwtich = value)),
                Text("Pasaporte"),
              ],
            ),
            input_c_i_and_passport(valueSwtich, _cedula, _passPort),

            /*********Datos Personales **************************** */
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Datos Personales  ",
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Buscar")))
                ],
              ),
            ),
            Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    decoration: customize_Box_white,
                    child: Table(
                      children: [
                        ((widget.modo["modificar"] == true) &&
                                (widget.modo["data"].persona.cedula != ""))
                            ? TableRow(children: [
                                Center(
                                  child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Text(
                                        _primerNombre.text,
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                                Center(
                                  child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Text(
                                        _primerApellido.text,
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                              ])
                            : TableRow(children: [
                                inputText(_primerNombre, "Primer Nombre"),
                                inputText(_primerApellido, "Primer Apellido")
                              ]),
                        ((widget.modo["modificar"] == true) &&
                                (widget.modo["data"].persona.cedula != ""))
                            ? TableRow(children: [
                                Center(
                                  child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Text(
                                        _segundoNombre.text,
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                                Center(
                                  child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Text(
                                        _segundoApellido.text,
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                              ])
                            : TableRow(children: [
                                inputText(_segundoNombre, "Segundo Nombre"),
                                inputText(_segundoApellido, "Segundo Apellido")
                              ]),
                        TableRow(children: [
                          TextField(
                              decoration:
                                  InputDecoration(labelText: "Nacionalidad")),
                          inputText(
                            _telefono,
                            "Telefono",
                          )
                        ]),
                        TableRow(children: [
                          /******Situacion, ocupacion, estado civil******* */
                          Column(children: [
                            DropDownFormBtn(
                                downValue: situacion,
                                list_of_titles: situacionList,
                                setFn: setSituacion),
                            DropDown_btn1(
                              ocupacionList,
                              ocupacion,
                              setData: setOcupacion,
                            ),
                            DropDown_btn1(
                              estado_civilList,
                              estadoCivil,
                              setData: setEstadoCivil,
                            ),
                          ]),
                          /******Foto interviniente******** */
                          Image.asset(
                            "img/icon_user.png",
                            width: 100.0,
                            height: 150.0,
                          )
                        ]),
                        TableRow(children: [
                          /*******Edad*****Naciemiento********* */
                          inputText(
                            _segundoNombre,
                            "Fecha Nacimiento",
                          ),
                          inputText(
                            _segundoApellido,
                            "Edad",
                          )
                        ])
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  //*************Widget Especiales segun el rol en el evento******************* */

                  rol == "FUNCIONARIO ACTUANTE"
                      ? Container(
                          decoration: customize_Box_white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Info. Policia Actunate",
                                  style: title_style,
                                ),
                              ),
                              Table(children: [
                                TableRow(children: [
                                  SizedBox(
                                    width: 100,
                                    child: DropDownFormBtn(
                                        list_of_titles: unidadEje,
                                        downValue: unidadEjecutora,
                                        setFn: setUnidadEjecutora),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: DropDownFormBtn(
                                        list_of_titles: dependenciaList,
                                        downValue: dependeincia,
                                        setFn: setDependencia),
                                  )
                                ]),
                                TableRow(children: [
                                  Text("Grado "),
                                  DropDown_btn1(gradoList, grado,
                                      setData: setGrado),
                                ])
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Text("Tomo denucia"),
                                  Checkbox(
                                      value: tomaDenuncia,
                                      onChanged: (val) {
                                        setState(() {
                                          tomaDenuncia = val!;
                                        });
                                      }),
                                  tomaDenuncia
                                      ? DropDown_btn1(lugarTomaDenunciaList,
                                          lugarTomaDenuncia,
                                          setData: setlugarTomaDenuncia)
                                      : SizedBox()
                                ]),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  //************************Ficha Indagado*************************** */
                  rol == "INDAGADO"
                      ? Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          decoration: customize_Box_white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Info. Indagado",
                                  style: title_style,
                                ),
                              ),
                              Table(children: [
                                TableRow(children: [
                                  DropDownFormBtn(
                                      list_of_titles: lesionesList,
                                      downValue: lesionesIndagado,
                                      setFn: setlecionesIndagado),
                                  DropDownFormBtn(
                                      list_of_titles: circulacionList,
                                      downValue: medioCirculacion,
                                      setFn: setMedioCirculacion)
                                ]),
                                TableRow(children: [
                                  DropDownFormBtn(
                                      list_of_titles: fugaList,
                                      downValue: medioFuga,
                                      setFn: setMedioFuga),
                                  DropDownFormBtn(
                                      list_of_titles: disparosList,
                                      downValue: disparos,
                                      setFn: setDisparos),
                                  // Medios de Circulacion
                                ])
                              ]),
                            ],
                          ))
                      : SizedBox(),
                  //*****Ficha Conductor********************** */
                  rol == "CONDUCTOR"
                      ? Container(
                          decoration: customize_Box_white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(" Conductor Espirometría:"),
                              SizedBox(
                                  width: 50,
                                  child: inputNumber("grs/ltr", espirometria))
                            ],
                          ))
                      : SizedBox(),
                  //********Feicha Victima Lesiones************* */
                  rol == "VICTIMA"
                      ? Container(
                          decoration: customize_Box_white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Info. Vicitma",
                                  style: title_style,
                                ),
                              ),
                              DropDownFormBtn(
                                  list_of_titles: lesionesList,
                                  downValue: lesionesVictima,
                                  setFn: setLesionesVictima)
                            ],
                          ),
                        )
                      : SizedBox(),
                  /***************************************Descripcion Fisca**************** */
                  (rol == "INDAGADO" ||
                          (situacion == "DENUNCIADO" && rol == "VICTIMA"))
                      ? Container(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Descripcíon Física",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue)),
                            ),
                            Container(
                                decoration: customize_Box_white,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Table(
                                      children: [
                                        TableRow(children: [
                                          DropDownFormBtn(
                                              list_of_titles: sexoList,
                                              downValue: sexo,
                                              setFn: setSexo),
                                          DropDownFormBtn(
                                              list_of_titles: estaturaList,
                                              downValue: estatura,
                                              setFn: setEstatura)
                                        ]),
                                        TableRow(children: [
                                          DropDownFormBtn(
                                            list_of_titles:
                                                complexionFisicaList,
                                            downValue: complexionFiscia,
                                            setFn: setComplexionFisica,
                                          ),
                                          DropDownFormBtn(
                                            list_of_titles: cabelloList,
                                            downValue: cabello,
                                            setFn: setCabello,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          DropDownFormBtn(
                                            list_of_titles: cutisList,
                                            downValue: cutis,
                                            setFn: setCutis,
                                          ),
                                          DropDownFormBtn(
                                            list_of_titles: franjaEtareaList,
                                            downValue: franjaEtarea,
                                            setFn: setFranjaEtarea,
                                          ),
                                        ])
                                      ],
                                    ))),
                          ],
                        ))
                      : SizedBox(),
                ])),
            //************************Domicilio**************************** */

            DomicilioPersonaView(),
            //**************************************************************** */
          ]),
        ));
  }

  Container inputText(cont, text1) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextFormField(
          validator: (value) {
            if (value == "" &&
                (rol == "DENUNCIANTE" ||
                    rol == "TESTIGO EVENTO" ||
                    rol == "TESTIGO ADMINISTRATIVO") &&
                text1 == "Primer Nombre") {
              return "Debe completar";
            }
            return null;
          },
          controller: cont,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(labelText: text1)),
    );
  }

  validarIntervinientModelo(rol, controller) {
    switch (rol) {
      case "INDAGADO":
        Interviniente indagadoModel = Interviniente(
          rol,
          Persona(
              estadoCivil: estadoCivil,
              nacionalidad: "uruguayo",
              sexo: sexo,
              cedula: _cedula.text,
              primerNombre: _primerNombre.text,
              primerApellido: _primerApellido.text,
              segundoNombre: _segundoNombre.text,
              segundoApellido: _segundoApellido.text,
              ocupacion: ocupacion,
              nacimiento: DateTime.now(),
              domicilio: "domicilio",
              situacion: situacion),
        );
        indagadoModel.descripcion = DescripcionFisica(
            cabello, complexionFiscia, cutis, estatura, franjaEtarea, sexo);
        indagadoModel.fichaIndagado = InfoIndagado(
            disparos, lesionesIndagado, medioCirculacion, medioFuga);
        indagadoModel.detenido = situacion == "DETENIDO"
            ? Detenido(fechaDetencion, horaDetencion)
            : null;
        controller.addInterviniente(indagadoModel);
        break;
      case "VICTIMA":
        Interviniente victimaModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        victimaModel.lesionesVictima = lesionesVictima;
        controller.addInterviniente(victimaModel);
        break;
      case "FUNCIONARIO ACTUANTE":
        Interviniente funcionarioActunateModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        funcionarioActunateModel.funcionarioActuante = FF_PP_Actuante(
            dependeincia,
            lugarTomaDenuncia,
            grado,
            tomaDenuncia,
            unidadEjecutora);
        controller.addInterviniente(funcionarioActunateModel);
        break;
      case "DENUNCIANTE":
        Interviniente denuncianteModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        controller.addInterviniente(denuncianteModel);
        break;
      case "CONDUCTOR":
        Interviniente conductorModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        conductorModel.espirometria;
        controller.addInterviniente(conductorModel);
        break;
      case "TESTIGO EVENTO":
        Interviniente tEventoModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        controller.addInterviniente(tEventoModel);
        break;

      case "TESTIGO ADMINISTRATIVO":
        Interviniente T_admModel = Interviniente(
            rol,
            Persona(
                estadoCivil: estadoCivil,
                nacionalidad: "uruguayo",
                sexo: sexo,
                cedula: _cedula.text,
                primerNombre: _primerNombre.text,
                primerApellido: _primerApellido.text,
                segundoNombre: _segundoNombre.text,
                segundoApellido: _segundoApellido.text,
                ocupacion: ocupacion,
                nacimiento: DateTime.now(),
                domicilio: "domicilio",
                situacion: situacion));
        controller.addInterviniente(T_admModel);
        break;
    }
  }

  Map editInt() {
    Map obj = {};
    return obj = {
      "primerNombre": _primerNombre.text,
      "primerApellido": _primerApellido.text,
      "segundoApellido": _segundoApellido.text,
      "segundoNombre": _segundoNombre.text,
      "estadoCivil": estadoCivil,
      "ocupacion": ocupacion,
      "situacion": situacion,
    };
  }

  setValuesfichas() {
    setState(() {
      situacion = "SITUACION";
      ocupacion = "OCUPACION";
      estadoCivil = "ESTADO CIVIL";
      /**************descripcion fiscia*********** */
      estatura = "ESTATURA";
      complexionFiscia = "COMPLEXIÓN";
      cutis = "CUTIS";
      sexo = "SEXO";
      franjaEtarea = "FRANJA ETAREA";
      cabello = "CABELLO";
/*************Detencion Variables************** */
      horaDetencion = TimeOfDay.now();
      fechaDetencion = DateTime.now();

//***Variables ficha FF.PP actuante********-/
      tomaDenuncia = false;
      lugarTomaDenuncia = "Dependeicia Polcial";
      unidadEjecutora = "Uni. Ejecutora";
      dependeincia = "Dependenicia";
      grado = "";

/** Variables Conductor********/

/***********variables Indagado Lesiones y medio de fuga */
      lesionesIndagado = "Lesiones";
      medioCirculacion = "Medio Circulacion";
      medioFuga = "Medio Fuga";
      disparos = "Disparos";

/********Varaibles Lesiones Victima*********/

      lesionesVictima = "Lesiones";
    });
  }
}
