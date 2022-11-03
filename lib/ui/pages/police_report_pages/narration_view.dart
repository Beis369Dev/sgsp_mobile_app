import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/ui/widgets/dropDown_btn.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';
import 'package:sgsp_app/ui/widgets/supplements.dart';

import '../../../models/model_prueba.dart';
import '../../../providers/pro_Intervinientes.dart';
import '../../../validator-report/narrationValidator.dart';

class NarrationInput extends StatefulWidget {
  const NarrationInput({Key? key}) : super(key: key);

  @override
  State<NarrationInput> createState() => _NarrationInputState();
}

class _NarrationInputState extends State<NarrationInput> {
  final _formKey = GlobalKey<FormState>();

// ************controllers imputs***********
  final TextEditingController _narrationController = TextEditingController();
  final TextEditingController _medicalDiagnosticController =
      TextEditingController();
  final TextEditingController _judicialResolutionController =
      TextEditingController();
  late bool nar;
  late bool res;

  @override
  void initState() {
    _narrationController.text = "";
    _medicalDiagnosticController.text = "";
    _judicialResolutionController.text = "";
  }

  @override
  void dispose() {
    _judicialResolutionController.dispose();
    _medicalDiagnosticController.dispose();
    _narrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final narration = Provider.of<NarratioValidator>(context);
    final interProvider = Provider.of<IntervinientesRepositorio>(context);
    _narrationController.text = narration.naratioReport;
    _judicialResolutionController.text = narration.getResolucionJudicial;
    _medicalDiagnosticController.text = narration.getDiagnosticoMedico;
    List<String> fiscaliaJuzgado = narration.getListaFisJuc;

    String supervisrValue = narration.naratioSupervisorEvent;

    bool validarPantallaNarracion(nar, res) {
      bool sup = supervisrValue != "";
      if (sup && nar && res) {
        return true;
      } else {
        return false;
      }
    }

    Widget showFisJus(List<String> data) {
      List<Widget> btn = [];
      if (data.length > 0) {
        for (String element in data) {
          btn.add(TextButton(
              onPressed: () {
                data.removeWhere((e) => (e == element));
                narration.setListaFisJuce = data;
                setState(() {});
                print(element);
              },
              child: Text(element)));
        }
        return Column(children: btn);
      }

      return const Text("Aun no hay fiscalias o Juzgados ");
    }

    Future<dynamic> showListIntervinientes() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Container(
                  height: 300,
                  width: 300,
                  child: interProvider.listInterviniente.length == 0
                      ? const Center(
                          child: Text("No hay Intervinientes Cargados"),
                        )
                      : ListView.builder(
                          itemCount: interProvider.listInterviniente.length,
                          itemBuilder: (BuildContext contexto, int i) {
                            final List<Interviniente> intePersona =
                                interProvider.listInterviniente;
                            return Card(
                              child: ListTile(
                                onTap: (() {
                                  _narrationController
                                      .text = _narrationController
                                          .text +
                                      "${intePersona[i].persona.primerNombre} ${intePersona[i].persona.segundoNombre}  ${intePersona[i].persona.primerApellido} ${intePersona[i].persona.segundoApellido}";
                                  Navigator.pop(context);
                                }),
                                leading: CircleAvatar(
                                    child: Text(intePersona[i].rol[0])),
                                title: Text(
                                    "${intePersona[i].persona.primerNombre} ${intePersona[i].persona.segundoNombre}  ${intePersona[i].persona.primerApellido} ${intePersona[i].persona.segundoApellido}"),
                              ),
                            );
                          }),
                ),
              ));
    }

    Widget buildSheet() {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Seleccionar Fiscalia / Juzgado",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => upDateList(value.toUpperCase()),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Buscar Fislcalia Juzgado")),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: 200,
                  child: displaySearchList.length > 0
                      ? ListView.builder(
                          itemCount: displaySearchList.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(displaySearchList[index]),
                                onTap: () {
                                  fiscaliaJuzgado.add(displaySearchList[index]);

                                  narration.setNarratioReport = CampoNarracion(
                                      false,
                                      _narrationController.text,
                                      narration.naratioSupervisorEvent,
                                      _medicalDiagnosticController.text,
                                      _judicialResolutionController.text,
                                      fiscaliaJuzgado);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ))
                      : const Center(
                          child: Text("No se encontraron resultados"),
                        ),
                ),
              )
            ],
          ),
        ),
      );
    }

    void setSupervisor(val) {
      narration.setNarratioReport = CampoNarracion(
          false,
          _narrationController.text,
          val,
          _medicalDiagnosticController.text,
          _judicialResolutionController.text,
          fiscaliaJuzgado);
    }

    return WillPopScope(
      onWillPop: () async {
        if (_formKey.currentState!.validate()) {
          narration.setNarratioReport = CampoNarracion(
              validarPantallaNarracion(nar, res),
              _narrationController.text,
              supervisrValue,
              _medicalDiagnosticController.text,
              _judicialResolutionController.text,
              fiscaliaJuzgado);
        } else {
          return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Los campos estan incompletos"),
                    actions: [
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text("Salir")),
                    ],
                  ));
        }
        return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Quiere salir"),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Salir")),
                  ],
                ));
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => showListIntervinientes(),
                  icon: Icon(
                    Icons.person_add,
                    size: 35,
                  ))
            ],
            title: Text("Nueva Denuncia"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // ********************Narracion******************
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Narracion e Informe",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 10),
                      width: double.infinity,
                      decoration: customize_Box_white,
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: SingleChildScrollView(
                          child: TextFormField(
                        controller: _narrationController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            nar = false;
                            return "Debe Completar la Narracion";
                          }
                          nar = true;
                        },
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        maxLines: 20,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ******************Supervisor Evento *******************
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Supervisor:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: customize_Box_white,
                    child: newDrop(supervisores, supervisrValue, setSupervisor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //**Diagnostico Medico*********** */
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Diagnostico Medico",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 10),
                    decoration: customize_Box_white,
                    child: TextFormField(
                        controller: _medicalDiagnosticController,
                        textCapitalization: TextCapitalization.characters,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 11, top: 11, right: 15),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //*****************Resoluicion Judical ******************* */
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Resolucion Judicial / Fiscal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),

                  showFisJus(narration.getListaFisJuc),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 10),
                    decoration: customize_Box_white,
                    child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              narration.getListaFisJuc.isEmpty) {
                            res = false;
                            return " Debe Cargar Ficalia o Juzgado ";
                          }
                          res = true;
                        },
                        controller: _judicialResolutionController,
                        textCapitalization: TextCapitalization.characters,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                          contentPadding:
                              EdgeInsets.only(bottom: 11, top: 11, right: 15),
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          context: context, builder: (context) => buildSheet()),
                      child: const Text("Agregar Fislcalia Juzgado")),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )),
    );
  }

  List<String> displaySearchList = List.from(filcaliasJuzgadosLista);

  void upDateList(String value) {
    setState(() {
      displaySearchList = filcaliasJuzgadosLista
          .where((element) => element.contains(value))
          .toList();
    });
  }
}
