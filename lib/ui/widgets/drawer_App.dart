import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/event_location.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/event_title.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/interveners.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/narration_view.dart';

myDrawer(page, context) {
  double h = MediaQuery.of(context).size.height;
  if (page == 1) {
    return Drawer(
      child: Column(children: [
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
        OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Intervenes()));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.people),
                ),
                Text("Intervinietes")
              ],
            )),
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LocationPage()));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.location_on),
                ),
                Text("Ubicacion")
              ],
            )),
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NarrationInput()));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.edit_note),
                ),
                Text("Narracion e Informe")
              ],
            )),
        OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EventTitle()));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.title),
                ),
                Text("Titulo")
              ],
            )),
        OutlinedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.add_a_photo)),
                Text("Adjuntar Archivo")
              ],
            )),
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Borrador")),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Guardar"))
          ],
        ),
        Container(
          child: Center(
              child: ElevatedButton(onPressed: () {}, child: Text("Borrar"))),
        )
      ]),
    );
  } else {
    return null;
  }
}
