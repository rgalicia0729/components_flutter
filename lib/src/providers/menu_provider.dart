import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map<String, dynamic> dataMap = json.decode(resp);
    return dataMap['rutas'];
  }
}

final menuProvider = new _MenuProvider();