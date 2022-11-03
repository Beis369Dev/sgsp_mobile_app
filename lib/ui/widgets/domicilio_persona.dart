import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/controllers/interviniente_controller.dart';
import 'package:sgsp_app/ui/widgets/dropDown_btn.dart';
import 'package:sgsp_app/ui/widgets/inputs.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';
import 'package:sgsp_app/ui/widgets/supplements.dart';

import '../../providers/pro_Intervinientes.dart';

class DomicilioPersonaView extends StatefulWidget {
  DomicilioPersonaView({Key? key}) : super(key: key);

  @override
  State<DomicilioPersonaView> createState() => _DomicilioPersonaViewState();
}

class _DomicilioPersonaViewState extends State<DomicilioPersonaView> {
  /***Valores tipo domicilio */
  bool sinDomicilio = false;
  bool exterioDomiclio = false;
  bool domiclioUYU = true;
  /**********estado Formulario******** */

  bool estadoFormulario = false;

  /***********controladores de entrada de texto  */

  late TextEditingController _callePrincipal;
  late TextEditingController _calleInterceccion;
  late TextEditingController _numeroPuerta;
  late TextEditingController _numApto;

  //*********** Variable Dep y Localidad********** */
  String departamento = "Todos";
  String localidad = "Todos";

  void setDepartamento(val) {
    setState(() {
      departamento = val;
    });
  }

  void setLocalidad(val) {
    setState(() {
      localidad = val;
    });
  }

  @override
  void initState() {
    _calleInterceccion = TextEditingController();
    _callePrincipal = TextEditingController();
    _numApto = TextEditingController();
    _numeroPuerta = TextEditingController();
    String departamento = "Todos";
    String localidad = "Todos";

    super.initState();
  }

  @override
  void dispose() {
    _calleInterceccion.dispose();
    _callePrincipal.dispose();
    _numApto.dispose();
    _numeroPuerta.dispose();

    super.dispose();
  }

  //*************************Golbal Key Form *************************/
  final _formKey = GlobalKey<FormState>();
  late IntervinientesRepositorio controller;
  @override
  Widget build(BuildContext context) {
    controller = Provider.of<IntervinientesRepositorio>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Domicilio",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
        ),
        Row(
          children: [
            Row(
              children: [
                Text("Sin Domicilio"),
                Checkbox(
                    value: sinDomicilio,
                    onChanged: (val) {
                      val!
                          ? setState(() {
                              sinDomicilio = val;
                              domiclioUYU = false;
                              exterioDomiclio = false;

                              controller.domEstadoSet = true;
                            })
                          : null;
                    })
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Uruguay"),
                  Checkbox(
                      value: domiclioUYU,
                      onChanged: (val) {
                        val!
                            ? setState(() {
                                domiclioUYU = val;
                                sinDomicilio = false;
                                exterioDomiclio = false;
                                controller.domEstadoSet = false;
                              })
                            : null;
                      })
                ],
              ),
            ),
            Row(
              children: [
                Text("Exterior"),
                Checkbox(
                    value: exterioDomiclio,
                    onChanged: (val) {
                      val!
                          ? setState(() {
                              exterioDomiclio = val;
                              domiclioUYU = false;
                              sinDomicilio = false;
                              controller.domEstadoSet = true;
                            })
                          : null;
                    })
              ],
            ),
          ],
        ),
        //**************************Domicilio Uruguay********************* */
        domiclioUYU
            ? Container(
                decoration: customize_Box_white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /***Departamento************* */
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "Departamento  ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            DropDownFormBtn(
                                downValue: departamento,
                                list_of_titles: Departamentos_UYU,
                                setFn: setDepartamento),
                          ],
                        ),
                        /*******Localidad******************* */
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Text(
                                "Localidad  ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            DropDownFormBtn(
                                downValue: localidad,
                                list_of_titles: Departamentos_UYU,
                                setFn: setLocalidad),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(children: [
                              SizedBox(
                                  width: 200,
                                  child: inputAddress(
                                      "Calle Principal", _callePrincipal)),
                              SizedBox(
                                  width: 90,
                                  child:
                                      inputNumber("N° Puerta", _numeroPuerta))
                            ]),
                            Row(children: [
                              SizedBox(
                                  width: 200,
                                  child: inputAddress(
                                      "Esquina", _calleInterceccion)),
                              SizedBox(
                                  width: 90,
                                  child: inputNumber("Apto./Hab", _numApto))
                            ])
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  _calleInterceccion.clear();
                                  _callePrincipal.clear();
                                  _numeroPuerta.clear();
                                  _numApto.clear();
                                  setState(() {
                                    estadoFormulario = false;
                                    controller.domEstadoSet = false;
                                  });
                                },
                                child: const Text("Cambiar Direccion")),
                            const Expanded(
                                child: SizedBox(
                              width: 10,
                            )),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      estadoFormulario = true;
                                      controller.domEstadoSet = true;
                                      String departamento = "Todos";
                                      String localidad = "Todos";
                                    });
                                  }
                                },
                                child: const Text("Localizar"))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            /*** */ : SizedBox(),
        /**********************Sin Domicilio ********** */
        sinDomicilio
            ? Container(
                padding: EdgeInsets.all(30),
                decoration: customize_Box_white,
                child: Center(
                    child: Text(
                  "No tine Domicilio",
                  style: title_style,
                )),
              )
            : SizedBox(),
        /******************************** Domiclio en el  exterior ********************************  */
        exterioDomiclio
            ? Container(
                decoration: customize_Box_white,
                child: Column(
                  children: [
                    inputAddress("Pais", _calleInterceccion),
                    SizedBox(
                      height: 10,
                    ),
                    inputAddress("Localidad", _calleInterceccion),
                    SizedBox(
                      height: 10,
                    ),
                    inputAddress("Direccion", _calleInterceccion)
                  ],
                ),
              )
            : SizedBox(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
