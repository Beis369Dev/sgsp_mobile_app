import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/models/model_prueba.dart';
import 'package:sgsp_app/providers/pro_Intervinientes.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/add_or_edit_interveners.dart';
import 'package:sgsp_app/ui/widgets/alerts.dart';

class Intervenes extends StatefulWidget {
  const Intervenes({Key? key}) : super(key: key);

  @override
  State<Intervenes> createState() => _IntervenesState();
}

class _IntervenesState extends State<Intervenes> {
  late IntervinientesRepositorio controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<IntervinientesRepositorio>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Intervinientes"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => Add_or_Edit_Interveners(
                                  controller: controller,
                                  modo: {
                                    "modificar": false,
                                  })));
                },
                icon: const Icon(
                  Icons.person_add,
                  size: 30,
                ))
          ],
        ),
        body: controller.listInterviniente.isEmpty
            ? const Center(child: Text("No existen registros"))
            : ListView.builder(
                itemCount: controller.listInterviniente.length,
                itemBuilder: (BuildContext contexto, int i) {
                  final List<Interviniente> loquita =
                      controller.listInterviniente;
                  return Card(
                    child: ListTile(
                      onTap: () {
                        QuestionAction(context, loquita[i]);
                      },
                      title: Text(
                          "${loquita[i].persona.primerNombre} ${loquita[i].persona.segundoNombre}  ${loquita[i].persona.primerApellido} ${loquita[i].persona.segundoApellido}"),
                      subtitle: Text("C.I: ${loquita[i].persona.cedula}"),
                      leading: CircleAvatar(
                          child:
                              Text(loquita[i].rol[0])), //Text(loquita[i].rol),
                      trailing: const CircleAvatar(
                          backgroundImage: AssetImage("img/icon_user.png")),
                    ),
                  );
                },
              ));
  }

  deletInterviniente(inte) {
    setState(() {
      controller.deleteInterviniente(inte);
    });
  }

  editarIntervieninte(inte) {}

  Future<dynamic> QuestionAction(BuildContext context, interviniente) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Elija una Opcion",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.help,
                    color: Colors.blue,
                    size: 40,
                  )
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => Add_or_Edit_Interveners(
                                        controller: controller,
                                        modo: {
                                          "modificar": true,
                                          "data": interviniente
                                        }))),
                        child: const Text("Editar")),
                    ElevatedButton(
                        onPressed: () {
                          deletInterviniente(interviniente);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Eliminar"))
                  ],
                )
              ],
            ));
  }
}
