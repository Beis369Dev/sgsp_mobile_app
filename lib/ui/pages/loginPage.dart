import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 10, 72, 122),
              width: double.infinity,
              height: h * 0.35,
              child: Center(
                child: Text(
                  "SGSP",
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              child: Form(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ingresar",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(1, 1),
                                blurRadius: 10)
                          ]),
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Usuario",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(1, 1),
                                blurRadius: 10)
                          ]),
                      child: TextFormField(
                          obscureText: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                              labelText: "Contraseña",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
              width: w * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            TextButton(onPressed: () {}, child: Text("Olvidó su contraseña?")),
            Divider(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
