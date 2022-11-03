import 'package:flutter/material.dart';
import 'package:sgsp_app/camara/camara_view_detect.dart';

class Search_vehicle_Page extends StatelessWidget {
  const Search_vehicle_Page({Key? key}) : super(key: key);

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
                "Vehiculos ",
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                Icons.search,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CamaraPageDetect())),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              height: h * 0.2,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sacaner IA"),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: text_input("Matricula"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: text_input("N° Motor"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: text_input("N° Chasis"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Buscar",
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }

  Container text_input(
    String label,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(1, 1),
                blurRadius: 10)
          ]),
      child: TextField(
          textCapitalization: TextCapitalization.characters,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              labelText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
    );
  }
}
