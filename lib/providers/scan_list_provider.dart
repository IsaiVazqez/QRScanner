import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/services.dart';

import '../models/scan_model.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  newScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  loadScans() async {
    var scans = await DBProvider.db.getAllScans();

    scans = [...scans!];

    notifyListeners();
  }

  loadSCansbyType(String tipo) async {
    var scans = await DBProvider.db.getAllScans();

    scans = [...scans!];

    tipoSeleccionado = tipo;

    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();

    scans = [];

    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScan(id);

    loadSCansbyType(tipoSeleccionado);
  }
}
