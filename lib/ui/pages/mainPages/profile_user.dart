import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        Container(
          height: h * 0.30,
          width: double.infinity,
          child: Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: h * 0.25,
                  color: Color.fromARGB(255, 10, 72, 122),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  maxRadius: 70.0,
                  backgroundImage: AssetImage(
                    "img/icon_user.png",
                  ),
                )),
          ]),
        ),
        SizedBox(
          height: h * 0.05,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Perfil",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            TextButton(
                onPressed: () {},
                child: Text("Notificaciones", style: TextStyle(fontSize: 25))),
          ],
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
            TextButton(
                onPressed: () {},
                child: Text("Ajustes", style: TextStyle(fontSize: 25))),
          ],
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.help),
            ),
            TextButton(
                onPressed: () {},
                child: Text("Ayuda", style: TextStyle(fontSize: 25))),
          ],
        ),
        SizedBox(
          height: h * 0.04,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          width: w * 0.55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Cerrar Sesión",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ),
      ]),
    );
  }
}
