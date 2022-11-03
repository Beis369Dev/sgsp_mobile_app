import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/controllers/file_Piker.dart';

import 'package:sgsp_app/ui/pages/police_report_pages/event_location.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/event_title.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/interveners.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/narration_view.dart';

import '../../../providers/reportData.dart';
import '../../../validator-report/narrationValidator.dart';

class DenunciaPage extends StatefulWidget {
  const DenunciaPage({Key? key}) : super(key: key);

  @override
  State<DenunciaPage> createState() => _DenunciaPageState();
}

class _DenunciaPageState extends State<DenunciaPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final providerDenucnia = Provider.of<StatusReport>(context);
    bool estadoDenuncia = providerDenucnia.nuevaDenuncia;
    final narration = Provider.of<NarratioValidator>(context);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.add_box_rounded)),
        body: ListView(children: [
          //**************HEADER SGSP******************
          Container(
            child: Center(
              child: Text(
                "SGSP",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            height: h * 0.25,
            width: double.infinity,
            color: Color.fromARGB(255, 10, 72, 122),
          ),
          SizedBox(height: 40),
          //** *****************TITULO****** */
          estadoDenuncia == false
              ? Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: (() {
                        providerDenucnia.setnuevaDenucia = true;
                        setState(() {});
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ingresar Denuncia",
                            style: TextStyle(
                              fontSize: 25,
                            )),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EventTitle()));
                          },
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.title),
                              ),
                              Text(
                                "Titulo",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          )),
                      //***********************UBICACION********** */
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationPage()));
                          },
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.location_on),
                              ),
                              Text(
                                "Ubicacion",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )
                            ],
                          )),
                      //*************INTERVINIENTES*************** */
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Intervenes()));
                          },
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.people),
                              ),
                              Text(
                                "Intervinietes",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )
                            ],
                          )),
                      //***********NARRACION******************* */
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: narration.getStatusCampNarration
                            ? Color.fromARGB(255, 124, 240, 128)
                            : Color.fromARGB(255, 250, 108, 98),
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NarrationInput()));
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.edit_note),
                                ),
                                Text(
                                  "Narracion e Informe",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            )),
                      ),
                      //*************AJUNTAR ARCHIVO***************** */
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PikerFile()));
                          },
                          child: Row(
                            children: const [
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.file_present)),
                              Text(
                                "Archivos Adjuntos",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 20, right: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.save,
                                    size: 25,
                                  ),
                                  Text(
                                    " Guardar",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
        ]));
  }
}
