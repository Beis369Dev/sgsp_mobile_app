import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sgsp_app/ui/widgets/alerts.dart';
import 'package:sgsp_app/ui/widgets/formatters.dart';
import '../../widgets/inputs.dart';
import '../../widgets/styles_customize.dart';
import '../../widgets/supplements.dart';
import 'package:expandable/expandable.dart';

class Search_police_report_Page extends StatefulWidget {
  const Search_police_report_Page({Key? key}) : super(key: key);

  @override
  State<Search_police_report_Page> createState() =>
      _Search_police_report_PageState();
}

class _Search_police_report_PageState extends State<Search_police_report_Page> {
//*****************Controllers********* */

  DateTime eventoDesde = DateTime.now();
  DateTime eventoHasta = DateTime.now();

  late TextEditingController _evento_sgsp;
  late TextEditingController _telefono_eveto;
  late TextEditingController _num_puerta;
  late TextEditingController _num_hab;
  late TextEditingController _calle_principal;
  late TextEditingController _calle_esquina;

  //*********DropDown_Btn Variables************ */
  late String title_Val = "Todos";
  late String dep_Val = 'Todos';
  late String Jus_Val = 'Todas';
  //***State of Form************** */

  bool fecha = false;
  bool evento = false;
  bool telefono = false;

  //*******Hour Variable****** */
  TimeOfDay horaDesde = TimeOfDay.now();
  TimeOfDay horaHasta = TimeOfDay.now();

  void setHoraDesde(val) {
    setState(() {
      horaDesde = val;
    });
  }

  void setHoraHasta(val) {
    setState(() {
      horaHasta = val;
    });
  }

  void setEventoDesde(val) {
    setState(() {
      eventoDesde = val;
    });
  }

  void setEventoHasta(val) {
    setState(() {
      eventoHasta = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _evento_sgsp = TextEditingController();

    _telefono_eveto = TextEditingController();
    _num_puerta = TextEditingController();
    _num_hab = TextEditingController();
    _calle_principal = TextEditingController();
    _calle_esquina = TextEditingController();
  }

  @override
  void dispose() {
    _evento_sgsp.dispose();

    _telefono_eveto.dispose();
    _num_puerta.dispose();
    _num_hab.dispose();
    _calle_principal.dispose();
    _calle_esquina.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            children: const [
              Text(
                "Eventos ",
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                Icons.search,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: customize_Box_white,
              child: text_input(" N° Evento", _evento_sgsp)),
          const SizedBox(
            height: 20,
          ),

          //******* title of event ***************************/
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(1, 1),
                      blurRadius: 10)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Título",
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  iconEnabledColor: Colors.blue,
                  value: title_Val,
                  onChanged: (String? newValue) {
                    setState(() {
                      title_Val = newValue!;
                    });
                  },
                  items: titulo_Delitos
                      .map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //**************Event Date Cantainer************** */
          Container(
            decoration: customize_Box_white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandablePanel(
                  header: Row(
                    children: const [
                      Text(
                        "Fecha Evento ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(Icons.date_range)
                    ],
                  ),
                  collapsed: const Text("Ver Opciones..."),
                  expanded: Column(children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        height: h * 0.25,
                        width: double.infinity,
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.bottom,
                          children: [
                            TableRow(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Fecha Desde ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Fecha Hasta ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SelectDate(setDate: setEventoDesde)),
                              SelectDate(setDate: setEventoHasta)
                            ]),
                            TableRow(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Hora Desde ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Hora Hasta ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SelectTimeHour(setHour: setHoraDesde)),
                              SelectTimeHour(setHour: setHoraHasta)
                            ])
                          ],
                        ))
                  ])),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          //********Event Location*********************** */

          Container(
            decoration: customize_Box_white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandablePanel(
                header: Row(
                  children: const [
                    Text(
                      "Lugar del Hecho ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.location_on)
                  ],
                ),
                collapsed: const Text("Mas Opciones..."),
                expanded: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      height: h * 0.35,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Departamento  ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton<String>(
                                  iconEnabledColor: Colors.blue,
                                  value: dep_Val,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dep_Val = newValue!;
                                    });
                                  },
                                  items: Departamentos_UYU.map<
                                      DropdownMenuItem<String>>((String val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Jurisdiccion  ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton<String>(
                                  iconEnabledColor: Colors.blue,
                                  value: Jus_Val,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      Jus_Val = newValue!;
                                    });
                                  },
                                  items: Secc.map<DropdownMenuItem<String>>(
                                      (String val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: inputAddress("Calle Principal"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      child: inputNumber(
                                          "N° Puerta", _num_puerta)),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: inputAddress("Esquina"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      child:
                                          inputNumber("Apto./Hab.", _num_hab)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //******Search event for phone number */
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: customize_Box_white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandablePanel(
                header: Row(
                  children: const [
                    Text(
                      "Telefono Asociado ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.phone)
                  ],
                ),
                collapsed: const Text("Mas Opciones..."),
                expanded: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    height: h * 0.1,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputNumber("N° Telefono", _telefono_eveto),
                    )),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                validarEvento();
                validarTelefono();
                validarFecha(eventoDesde, eventoHasta);

                validarConsulta();
              },
              child: const Text(
                "Buscar",
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }

  TextField text_input(String label, controller) {
    return TextField(
        controller: controller,
        maxLength: 10,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))));
  }

  TextField inputDate(String label, controller) {
    return TextField(
      textAlign: TextAlign.center,
      inputFormatters: [dateFormatter],
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.red,
            ),
            onPressed: () => selectDate(controller),
          )),
    );
  }

  TextField inputAddress(String label) {
    return TextField(
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(labelText: label));
  }

  TextField inputNumber(String label, controller) {
    return TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label));
  }

  void _showDataPicker(controller) {
    showDatePicker(
            confirmText: "ACEPTAR",
            cancelText: "CANCELAR",
            helpText: "Seleccionar Fecha",
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1996),
            lastDate: DateTime.now())
        .then((value) {
      controller.text =
          "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
    });
  }

  selectDate(controller) {
    _showDataPicker(controller);
  }

//**** Validate Date************** */
  void validarFecha(DateTime D1, DateTime D2) {
    if (D1 != null && D2 != null) {
      if (D1.isAfter(D2)) {
        print("La fecha de Inicio no Puede ser mayor a la Fecha Final ");
        setState(() {
          fecha = false;
        });
      } else {
        setState(() {
          fecha = true;
        });
      }
    }
  }

  validarEvento() {
    if (_evento_sgsp.text != "") {
      setState(() {
        evento = true;
      });
    } else if (_evento_sgsp.text == "") {
      setState(() {
        evento = false;
      });
    }
  }

  validarTelefono() {
    if (_telefono_eveto.text != "") {
      setState(() {
        telefono = true;
      });
    } else if (_telefono_eveto.text == "") {
      setState(() {
        telefono = false;
      });
    }
  }

  validarConsulta() {
    if (dep_Val == "Todos" && evento == false && telefono == false) {
      AlertMethod(context,
          "Debe ingresar un N° de Novedad a buscar o una ubicacion o un N° de Telefono");
    } else if (fecha == true && dep_Val != "Todos") {
      print("ejecutar consulta");
    } else if (evento == true) {
      print("Ejecutar consulta");
    } else if (telefono == true) {
      print("Ejecutar consulta");
    } else if (fecha == false && dep_Val != "Todos") {
      AlertMethod(
          context, "La fecha de inicio no puede ser mayor que la fecha final");
    }
  }
}
