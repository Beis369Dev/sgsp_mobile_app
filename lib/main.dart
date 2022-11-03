import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgsp_app/providers/pro_Intervinientes.dart';
import 'package:sgsp_app/providers/reportData.dart';
import 'package:sgsp_app/ui/pages/homePage.dart';
import 'package:camera/camera.dart';
import 'package:sgsp_app/ui/pages/police_report_pages/add_or_edit_interveners.dart';
import 'package:sgsp_app/validator-report/narrationValidator.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late IntervinientesRepositorio controller;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NarratioValidator()),
        ChangeNotifierProvider(
            create: (context) => IntervinientesRepositorio()),
        ChangeNotifierProvider(
          create: (context) => StatusReport(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sgsp App',
          theme: ThemeData(

              // primarySwatch: MaterialColor(255, 255),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          routes: {
            "/": (context) => const HomePage(),
          }),
    );
  }
}
