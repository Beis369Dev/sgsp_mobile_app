import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/models/model_prueba.dart';

import '../../providers/reportData.dart';
import '../../validator-report/narrationValidator.dart';
import 'alerts.dart';

AppBar SgspAppBar(int selectedIndex, context) {
  final campoNarracion = Provider.of<NarratioValidator>(context);
  List<String> titleAppBar = [
    "Consultas",
    "Nueva Denucia",
    "Nueva Ampliacion",
    "Perfil de Usuario"
  ];
  if (selectedIndex == 1) {
    final providerDenucnia = Provider.of<StatusReport>(context);
    return AppBar(
      title: Text(titleAppBar[1]),
      actions: [
        providerDenucnia.nuevaDenuncia == true
            ? Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.save_alt_sharp)),
                  IconButton(
                      onPressed: () {
                        cancelReport(context, providerDenucnia, campoNarracion);
                      },
                      icon: Icon(Icons.close))
                ],
              )
            : Text("")
      ],
      centerTitle: true,
    );
  } else {
    return AppBar(
      centerTitle: true,
      title: Text(titleAppBar[selectedIndex]),
    );
  }
}

Future<dynamic> cancelReport(
    context, StatusReport providerDenucnia, campoNarracion) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Antención ",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Icon(
                  Icons.warning_amber,
                  color: Colors.amber,
                  size: 40,
                )
              ],
            ),
            content: const Text(
                "Desea usted abandonar la Denuncia (Se perderan todos los Datos ingresados)"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    providerDenucnia.setnuevaDenucia = false;

                    campoNarracion.setNarratioReport =
                        CampoNarracion(false, "", "", "", "", []);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Si")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("No"))
            ],
          ));
}
