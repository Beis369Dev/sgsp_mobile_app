import 'package:flutter/material.dart';

import '../../widgets/styles_customize.dart';
import '../../widgets/supplements.dart';

class EventTitle extends StatefulWidget {
  const EventTitle({Key? key}) : super(key: key);

  @override
  State<EventTitle> createState() => _EventTitleState();
}

class _EventTitleState extends State<EventTitle> {
  late String titleCrime = "Todos";
  late String tipoDelito = "Seleccionar";
  late String complementoDelito = "Seleccionar";
  late String tipoAcc = "Seleccionar";
  late String complementoAcc = "Seleccionar";

  void setTitle(val) {
    setState(() {
      titleCrime = val;
    });
  }

  void setTipodelito(val) {
    setState(() {
      tipoDelito = val;
    });
  }

  void setComplemntoDelito(val) {
    setState(() {
      complementoDelito = val;
    });
  }

  void setTipoAcc(val) {
    setState(() {
      tipoAcc = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Titulo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Select title event
            Container(
              width: double.infinity,
              height: h * 0.10,
              decoration: customize_Box_white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Título",
                    style: title_style,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  newDrop(titulo_Delitos, titleCrime, setTitle)
                ],
              ),
            ),

            SizedBox(height: 30),
            //Display the title event
            Text(
              titleCrime,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),

            ///********************************** */
            SizedBox(
              height: 20,
            ),

            Column(
              children: [
                // case the type of crimen is null
                titleCrime == "Todos"
                    ? Center(
                        child: Text(
                        "Seleccione un titulo",
                        style: titleEventeContainer,
                      ))
                    :
                    // Container title type crimen
                    titleCrime == "Delitos y Faltas"
                        ? Container(
                            width: double.infinity,
                            height: h * 0.20,
                            decoration: customize_Box_white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "Tipo: ",
                                      style: titleEventeContainer,
                                    ),
                                    newDrop(listTipoDelitos, tipoDelito,
                                        setTipodelito)
                                  ]),
                                  TableRow(children: [
                                    Text("Modalidad: ",
                                        style: titleEventeContainer),
                                    newDrop(
                                        titulo_Delitos, titleCrime, setTitle)
                                  ]),
                                  TableRow(children: [
                                    Text("Complemento: ",
                                        style: titleEventeContainer),
                                    newDrop(listComplemntoDelitos,
                                        complementoDelito, setComplemntoDelito)
                                  ])
                                ],
                              ),
                            ))
                        : SizedBox(height: 10),
                // title type accident
                titleCrime == "Accidente"
                    ? Container(
                        width: double.infinity,
                        height: h * 0.15,
                        decoration: customize_Box_white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(children: [
                                Text(
                                  "Tipo: ",
                                  style: titleEventeContainer,
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                newDrop(listAccidentes, tipoAcc, setTipoAcc)
                              ]),
                              Row(children: [
                                Text("Gravead: ", style: titleEventeContainer),
                                const Expanded(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                newDrop(titulo_Delitos, titleCrime, setTitle)
                              ]),
                            ],
                          ),
                        ))
                    : SizedBox(height: 10),
                titleCrime == "Hecho Policial"
                    ? Container(
                        width: double.infinity,
                        height: h * 0.15,
                        decoration: customize_Box_white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  "Tipo: ",
                                  style: titleEventeContainer,
                                ),
                                newDrop(titulo_Delitos, titleCrime, setTitle)
                              ]),
                              TableRow(children: [
                                Text("Complemento: ",
                                    style: titleEventeContainer),
                                newDrop(titulo_Delitos, titleCrime, setTitle)
                              ]),
                            ],
                          ),
                        ))
                    : SizedBox(height: 10),
              ],
            ),
            const Text(
              "Autoridades Intervinientes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: h * 0.20,
                decoration: customize_Box_white,
                child: Text("Algo")),
            const Text(
              "Armas Utilizadas",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: h * 0.20,
                decoration: customize_Box_white,
                child: Text("Algo")),
            const Text(
              "Fiscalias - Juzgados",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: h * 0.20,
                decoration: customize_Box_white,
                child: Text("Algo")),
            const Text(
              "Otras Informaciones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: h * 0.20,
                decoration: customize_Box_white,
                child: Text("Algo")),
          ],
        ),
      ),
    );
  }

  /// DropButton generic
  DropdownButton<String> newDrop(
      List<String> listOfData, String data, Function setData) {
    return DropdownButton<String>(
      iconEnabledColor: Colors.blue,
      value: data,
      onChanged: (String? newValue) => setData(newValue),
      items: listOfData.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }
}
