import 'package:flutter/material.dart';

import 'package:sgsp_app/ui/widgets/alerts.dart';
import 'package:sgsp_app/ui/widgets/inputs.dart';

import '../../widgets/styles_customize.dart';

class Search_person_Page extends StatefulWidget {
  const Search_person_Page({Key? key}) : super(key: key);

  @override
  State<Search_person_Page> createState() => _Search_person_PageState();
}

class _Search_person_PageState extends State<Search_person_Page> {
  bool valueSwtich = false;

//***********Variables Form******** */
  late TextEditingController _cedula;
  late TextEditingController _passPort;
  late TextEditingController _primerNombre;
  late TextEditingController _primerApellido;
  late TextEditingController _segundoNombre;
  late TextEditingController _segundoApellido;
  late TextEditingController _telefono;

  @override
  void initState() {
    _cedula = TextEditingController();
    _passPort = TextEditingController();
    _primerNombre = TextEditingController();
    _primerApellido = TextEditingController();
    _segundoNombre = TextEditingController();
    _segundoApellido = TextEditingController();
    _telefono = TextEditingController();

    super.initState();
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  "Personas ",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            // height: 50,
            // color: Colors.red,
            child: Row(
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
          ),

          input_c_i_and_passport(valueSwtich, _cedula, _passPort),
          SizedBox(
            height: 20,
          ),

          //*******************Campo nombre y apellido ******************** */
          Row(
            children: const [
              Icon(Icons.person_search),
              Text("Nombre y Apellido"),
            ],
          ),
          Container(
            width: double.infinity,
            height: h * 0.30,
            decoration: customize_Box_white,
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      inputText(_primerNombre, "Primer Nombre"),
                      inputText(_primerApellido, "Primer Apellido")
                    ]),
                    TableRow(children: [
                      inputText(_segundoNombre, "Segundo Nombre"),
                      inputText(_segundoApellido, "Segundo Apellido")
                    ]),
                    TableRow(children: [
                      inputText(_telefono, "Telefono"),
                      TextField(
                          decoration:
                              InputDecoration(labelText: "Nacionalidad"))
                    ])
                  ],
                )),
          ), //*************************Button Search****************** */
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    List campos = [
                      _primerApellido.text.isEmpty,
                      _primerNombre.text.isEmpty,
                      _segundoNombre.text.isEmpty,
                      _segundoApellido.text.isEmpty
                    ];

                    int contador = 0;

                    for (var i = 0; i < campos.length; i++) {
                      if (campos[i] == true) {
                        contador++;
                      }
                    }

                    if (_cedula.text.isEmpty &&
                        _passPort.text.isEmpty &&
                        _telefono.text.isEmpty &&
                        contador >= 3) {
                      AlertMethod(context,
                          "Debe ingresar al menos un N° de Cedula o  Passaporte o  Telefono o Nombres y/o Apellidos");
                      print(contador.toString());
                    } else {
                      var data = {
                        "cedula": _cedula.text,
                        "passPort": _passPort.text,
                        "primerNombre": _primerNombre.text,
                        "segundoNombre": _segundoNombre.text,
                        "primerApellido": _primerApellido.text,
                        "segundoApellido": _segundoApellido.text
                      };

                      print(data);
                    }
                  },
                  child: Text(
                    "Buscar",
                    style: title_style,
                  )),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    _cedula.clear();
                    _passPort.clear();
                    _primerNombre.clear();
                    _primerApellido.clear();
                    _segundoNombre.clear();
                    _segundoApellido.clear();
                    _telefono.clear();
                  },
                  child: const Text("Limpiar"))
            ],
          )
        ],
      ),
    );
  }
}
