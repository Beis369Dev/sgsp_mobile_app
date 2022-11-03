import 'package:flutter/material.dart';

//*******BoxDecoration white with shadow grey************** */

BoxDecoration customize_Box_white = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(1, 1),
          blurRadius: 10)
    ]);
// Box decoration error

BoxDecoration boxDecorationError = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(color: Color.fromARGB(255, 243, 63, 50), width: 2),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(1, 1),
          blurRadius: 10)
    ]);
//***********************Text style of titles************** */

TextStyle title_style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

///******************* Decoration input border ****************/

BoxDecoration input_decoration = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 1.5),
    borderRadius: BorderRadius.circular(10));

TextStyle titleEventeContainer = TextStyle(fontSize: 18);
