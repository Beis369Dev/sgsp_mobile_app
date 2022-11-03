import 'package:flutter/material.dart';

class DropDown_btn extends StatefulWidget {
  late List<String> list_of_titles = [];
  String dropdownValue = '';

  DropDown_btn(
    this.list_of_titles,
    this.dropdownValue, {
    Key? key,
  }) : super(key: key);

  @override
  State<DropDown_btn> createState() => _DropDown_btnState();
}

class _DropDown_btnState extends State<DropDown_btn> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconEnabledColor: Colors.blue,
      value: widget.dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
        });
      },
      items: widget.list_of_titles.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }
}

class DropDown_btn1 extends StatefulWidget {
  late List<String> list_of_titles = [];
  String dropdownValue = '';
  final Function setData;

  DropDown_btn1(
    this.list_of_titles,
    this.dropdownValue, {
    Key? key,
    required this.setData,
  }) : super(key: key);

  @override
  State<DropDown_btn1> createState() => _DropDown_btn1State();
}

class _DropDown_btn1State extends State<DropDown_btn1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        underline: const Divider(color: Colors.blue, thickness: 1.0),
        iconEnabledColor: Colors.blue,
        value: widget.dropdownValue,
        onChanged: (String? newValue) => widget.setData(newValue),
        items:
            widget.list_of_titles.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownFormBtn extends StatefulWidget {
  late List<String> list_of_titles;
  late String downValue;
  final Function setFn;

  DropDownFormBtn(
      {Key? key,
      required this.list_of_titles,
      required this.downValue,
      required this.setFn})
      : super(key: key);

  @override
  State<DropDownFormBtn> createState() => _DropDownFormBtnState();
}

class _DropDownFormBtnState extends State<DropDownFormBtn> {
  @override
  Widget build(BuildContext context) {
    final String initialValue = widget.downValue;
    return SizedBox(
      height: 70,
      width: 150,
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == "SITUACION" ||
              value == "OCUPACION" ||
              value == "ESTADO CIVIL" ||
              value == "ESTATURA" ||
              value == "COMPLEXIÓN" ||
              value == "CUTIS" ||
              value == "SEXO" ||
              value == "FRANJA ETAREA" ||
              value == "CABELLO" ||
              value == "Lesiones" ||
              value == "Medio Circulacion" ||
              value == "Medio Fuga" ||
              value == "Disparos") {
            return "Debe completar";
          }

          return null;
        },
        value: widget.downValue,
        onChanged: (String? newValue) => widget.setFn(newValue),
        items:
            widget.list_of_titles.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(),
      ),
    );
  }
}

DropdownButton<String> newDrop(
    List<String> listOfData, String data, Function setData) {
  return DropdownButton<String>(
    iconEnabledColor: Colors.blue,
    value: data,
    onChanged: (String? newValue) => setData(newValue),
    items: listOfData.map<DropdownMenuItem<String>>((String val) {
      return DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      );
    }).toList(),
  );
}
