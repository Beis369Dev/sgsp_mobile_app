import 'package:flutter/material.dart';

import '../models/model_prueba.dart';

class NarratioValidator extends ChangeNotifier {
  late bool _statusCampNarratio = false;
  late String _narrationReport = "";
  late String _supervisorEvent = "";
  late String _resolucionJudicial = "";
  late List<String> _listFiscalesJuces = [];
  late String _diagnosticoMedico = "";

  get naratioReport => _narrationReport;
  get naratioSupervisorEvent => _supervisorEvent;
  get getResolucionJudicial => _resolucionJudicial;
  get getDiagnosticoMedico => _diagnosticoMedico;
  get getListaFisJuc => _listFiscalesJuces;
  get getStatusCampNarration => _statusCampNarratio;

  set setListaFisJuce(List<String> list) {
    _listFiscalesJuces = list;
    notifyListeners();
  }

  set setNarratioReport(
    CampoNarracion campoNarracion,
  ) {
    _statusCampNarratio = campoNarracion.statusNarration;
    _narrationReport = campoNarracion.narracion;
    _supervisorEvent = campoNarracion.supervisor;
    _diagnosticoMedico = campoNarracion.diagnosticoMedico ?? "";
    _resolucionJudicial = campoNarracion.resoucionJudicial ?? "";
    _listFiscalesJuces = campoNarracion.fiscaliasJuzgados;
    notifyListeners();
  }
}
