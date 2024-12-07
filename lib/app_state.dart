import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _generoSeleccionado = '';
  String get generoSeleccionado => _generoSeleccionado;
  set generoSeleccionado(String value) {
    _generoSeleccionado = value;
  }

  int _textSize = 12;
  int get textSize => _textSize;
  set textSize(int value) {
    _textSize = value;
  }
}
