import 'package:flutter/material.dart';

Future<dynamic> AlertMethod(BuildContext context, String info) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "ERROR ",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                  size: 40,
                )
              ],
            ),
            content: Text(info),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Entendido"))
            ],
          ));
}

// Future<dynamic> QuestionAction(BuildContext context, interviniente) {
//   return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text(
//                   "Elija una Opcion",
//                   style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20),
//                 ),
//                 Icon(
//                   Icons.help,
//                   color: Colors.blue,
//                   size: 40,
//                 )
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: const Text("Editar")),
//               ElevatedButton(
//                   onPressed: () {
                    
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text("Eliminar"))
//             ],
//           ));
// }
