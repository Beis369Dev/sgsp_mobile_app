import 'package:flutter/material.dart';

class StatusReport extends ChangeNotifier {
  bool _nuevaDenuncia = false;
  bool _titleEvent = false;
  bool _locationEvent = false;
  bool _intervenerEvent = false;
  bool _narrationEvent = false;
  bool _generalStatusReport = false;

  get nuevaDenuncia => _nuevaDenuncia;
  set setnuevaDenucia(bool val) {
    _nuevaDenuncia = val;
    notifyListeners();
  }
}
