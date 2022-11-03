import 'package:flutter/material.dart';
import 'package:sgsp_app/ui/widgets/formatters.dart';
import 'package:sgsp_app/ui/widgets/styles_customize.dart';

///*******TEYPE ADDRESS******************** */
Container inputAddress(String label, controller) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Debe completar';
          }
          return null;
        },
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(labelText: label)),
  );
}

//*****TYPE NUMNBER********************** */

Container inputNumber(String label, controller) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label)),
  );
}

///*** Cedula y Pasaporte */
Container input_c_i_and_passport(valueSwtich, c_I_controller, pass_controller) {
  if (valueSwtich) {
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
          controller: pass_controller,
          decoration: InputDecoration(
              labelText: "Pasaporte",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
    );
  } else {
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
          controller: c_I_controller,
          textAlign: TextAlign.center,
          inputFormatters: [ci_Formatter],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "C.I",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
    );
  }
}

Container inputText(cont, text) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: TextField(
        controller: cont,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: text)),
  );
}

//********************Input Date********************************** */
TextField inputDate(String label, controller, context) {
  return TextField(
    textAlign: TextAlign.center,
    inputFormatters: [dateFormatter],
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.red,
          ),
          onPressed: () => selectDate(controller, context),
        )),
  );
}

void showDataPicker(controller, context) {
  showDatePicker(
          confirmText: "ACEPTAR",
          cancelText: "CANCELAR",
          helpText: "Seleccionar Fecha",
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1996),
          lastDate: DateTime.now())
      .then((value) {
    controller.text =
        "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
  });
}

selectDate(controller, context) {
  showDataPicker(controller, context);
}

//*******************Select Hour Widget****************** */
class SelectTimeHour extends StatefulWidget {
  final Function setHour;
  SelectTimeHour({
    Key? key,
    required this.setHour,
  }) : super(key: key);

  @override
  State<SelectTimeHour> createState() => _SelectTimeHourState();
}

class _SelectTimeHourState extends State<SelectTimeHour> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "${time.hour} : ${time.minute}",
        style: title_style,
      ),
      SizedBox(width: 20),
      IconButton(
          icon: const Icon(
            Icons.timer_outlined,
            color: Colors.red,
          ),
          onPressed: (() async {
            TimeOfDay? newtime =
                await showTimePicker(context: context, initialTime: time);
            if (newtime == null) return;
            widget.setHour(newtime);
            setState(() {
              time = newtime;
            });
          }))
    ]);
  }
}

//*******************Select datePicker***************************** */

class SelectDate extends StatefulWidget {
  final Function setDate;
  SelectDate({Key? key, required this.setDate}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${date.day}/${date.month}/${date.year}",
          style: title_style,
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1996),
                  lastDate: DateTime.now());

              if (newDate == null) return;
              widget.setDate(newDate);
              setState(() {
                date = newDate;
              });
            },
            icon: const Icon(Icons.calendar_month, color: Colors.red))
      ],
    );
  }
}

//****************Select date and time at the  same time***********************

class SelectDateTime extends StatefulWidget {
  final Function setDateAndTime;

  SelectDateTime({Key? key, required this.setDateAndTime}) : super(key: key);

  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Detenido",
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fecha:  ${date.day}/${date.month}/${date.year}  Hora:  ${time.hour}:${time.minute}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: pickDateTime,
                icon: const Icon(
                  Icons.access_time_filled,
                  color: Colors.red,
                ))
          ],
        ),
      ],
    );
  }

  Future pickDateTime() async {
    DateTime? sDate = await pickDate();
    if (sDate == null) return;

    TimeOfDay? sTime = await pickTime();
    if (sTime == null) return;

    setState(() {
      date = sDate;
      time = sTime;
    });

    widget.setDateAndTime(sDate, sTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1996),
      lastDate: DateTime.now());

  Future<TimeOfDay?> pickTime() =>
      showTimePicker(context: context, initialTime: time);
}
