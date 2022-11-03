import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PikerFile extends StatefulWidget {
  const PikerFile({Key? key}) : super(key: key);

  @override
  State<PikerFile> createState() => _PikerFileState();
}

class _PikerFileState extends State<PikerFile> {
  @override
  List<PlatformFile> fileS = [];

  Widget build(BuildContext context) {
    FilePickerResult? result;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archivos Adjuntos"),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30),
            child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.file_present),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        " Cargar Archivo",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                onPressed: () async {
                  result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (result != null) {
                    setState(() {
                      fileS = result!.files;
                    });
                  }
                  if (result == null) return;
                }),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        (fileS.length > 0)
            ? Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5)),
                padding: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.75,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: fileS.length,
                    itemBuilder: (context, index) {
                      final file = fileS[index];

                      return buildFile(file);
                    }),
              )
            : const Padding(
                padding: EdgeInsets.only(top: 150),
                child: Center(
                  child: Text(
                    "No hay archivos aun",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
      ]),
    );
  }
}

Widget buildFile(PlatformFile file) {
  final extension = file.extension ?? "none";
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final fileSize =
      mb >= 1 ? "${mb.toStringAsFixed(2)} MB" : "${kb.toStringAsFixed(2)} KB";

  return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue[900]!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12)),
            child: extension == "jpg"
                ? Image.file(File(file.path.toString()))
                : Text(
                    ".${extension}",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
          )),
          SizedBox(
            height: 8,
          ),
          Text(
            file.name,
            style: TextStyle(fontSize: 18),
          ),
          Text(fileSize),
          TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Eliminar",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ))
        ],
      ));
}
