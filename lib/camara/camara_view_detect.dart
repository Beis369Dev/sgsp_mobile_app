import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../main.dart';

class CamaraPageDetect extends StatefulWidget {
  CamaraPageDetect({Key? key}) : super(key: key);

  @override
  State<CamaraPageDetect> createState() => _CamaraPageDetectState();
}

class _CamaraPageDetectState extends State<CamaraPageDetect> {
  late CameraImage cameraImage;

  late CameraController cameraController;

  bool isWorking = false;

  String result = "";

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            cameraImage = imageFromStream;
          }
        });
      });
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sacnear Matricula"),
        centerTitle: true,
      ),
      body: Container(
        child: (!cameraController.value.isInitialized)
            ? Container(
                child: Text("La camara no esta inicializada"),
              )
            : Align(
                alignment: Alignment.center,
                child: CameraPreview(cameraController)),
      ),
    );
  }
}
