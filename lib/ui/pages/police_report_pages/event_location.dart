import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/widgets/dropDown_btn.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';
import 'package:sgsp_app/ui/widgets/supplements.dart';

import '../../widgets/formatters.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late TextEditingController _eventoFecha;
  late TextEditingController _eventoConocimeinto;
  late String tipoLugar;

  @override
  void initState() {
    _eventoFecha = TextEditingController();
    _eventoConocimeinto = TextEditingController();
    tipoLugar = "nulo";
    super.initState();
  }

  @override
  void dispose() {
    _eventoFecha.dispose();
    _eventoConocimeinto.dispose();

    super.dispose();
  }

  bool estado = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ubicacion"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //********************Fecha evento********************** */
              const Text("Fecha Evento",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: customize_Box_white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: inputDate("Fecha Hecho", _eventoFecha)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: inputDate(
                              "Fecha Conocimiento", _eventoConocimeinto)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //********************Derivar Evento*************************** */
              const Text("Derivar a",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: customize_Box_white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Unidad Ejecutora"),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: DropDown_btn(Departamentos_UYU, "Todos"))
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Dependencia"),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: DropDown_btn(Departamentos_UYU, "Todos"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //***********Ubicacion****************************** */
              const Text("Ubicación",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: customize_Box_white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Departamento"),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: DropDown_btn(Departamentos_UYU, "Todos"))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text("Localidad"),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: DropDown_btn(Departamentos_UYU, "Todos"))
                        ],
                      ),
                      const SizedBox(height: 10),

                      builActionCips(), //////*****SELECT TYPE OF PLACE******* */
                      const SizedBox(height: 20),
                      buildFormAddress(
                          tipoLugar), //*******CREATE FORM TO INPUT ADDRESS */
                      const SizedBox(height: 10),
                      //*******BUTTONS LOCATION AND CLEAR LOCATION************** */
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Cambiar direccón")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Localizar")),
                ],
              ),
            ]),
          ),
        ));
  }
  //***********************FUNCTIONS ************************************** */

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

  selectDate(controller) {
    _showDataPicker(controller);
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

  //****************** function to create the ActionsClips********** */

  Widget builActionCips() => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        children: chipsLocation
            .map((e) => InputChip(
                backgroundColor: Colors.blue,
                label: Text(e.title, style: TextStyle(color: Colors.white)),
                avatar: CircleAvatar(
                  child: Icon(e.iconChip),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    tipoLugar = e.title;
                  });
                }))
            .toList(),
      );

//**** buil form to address */
  Widget buildFormAddress(val) {
    Widget valor = Container();
    switch (val) {
      case "Casa":
        valor = Container(
          child: Column(
            children: [
              Text("Direccion Casa", style: title_style),
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
                    child: Container(child: inputNumber("N° Puerta")),
                  )
                ],
              ),
              SizedBox(height: 10),
              inputAddress("Cruce"),
              SizedBox(height: 10),
            ],
          ),
        );
        break;
      case "Apto.":
        valor = Container(
          child: Column(
            children: [
              Text("Direccion Apartamento", style: title_style),
              SizedBox(height: 10),
              inputAddress("Calle Principal"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: inputNumber("N° Puerta")),
                  SizedBox(width: 40),
                  Expanded(child: inputNumber("Apto"))
                ],
              ),
              SizedBox(height: 10),
              inputAddress("Cruce"),
              SizedBox(height: 20),
            ],
          ),
        );

        break;

      case "Pensión-Hotel":
        valor = Container(
          child: Column(
            children: [
              Text("Direccion Pensión/Hotel", style: title_style),
              SizedBox(height: 10),
              inputAddress("Calle Principal"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: inputNumber("N° Puerta")),
                  SizedBox(width: 40),
                  Expanded(child: inputNumber("Hab"))
                ],
              ),
              SizedBox(height: 10),
              inputAddress("Curce"),
              SizedBox(height: 20),
            ],
          ),
        );

        break;
      case "Vía Publica":
        valor = Container(
          child: Column(
            children: [
              Text("Direccion Vía Pública", style: title_style),
              SizedBox(height: 10),
              inputAddress("Calle Principal"),
              SizedBox(height: 10),
              inputAddress("Curce 1"),
              SizedBox(height: 10),
              inputAddress("Curce 2"),
              SizedBox(height: 20),
            ],
          ),
        );

        break;
    }
    return valor;
  }

  TextField inputAddress(String label) {
    return TextField(
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(labelText: label));
  }

  TextField inputNumber(String label) {
    return TextField(
        // controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label));
  }
}
