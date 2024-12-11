import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _InvoiceNo = prefs.getInt('ff_InvoiceNo') ?? _InvoiceNo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  DocumentReference? _Pedidos;
  DocumentReference? get Pedidos => _Pedidos;
  set Pedidos(DocumentReference? value) {
    _Pedidos = value;
  }

  bool _mostrarTexto = false;
  bool get mostrarTexto => _mostrarTexto;
  set mostrarTexto(bool value) {
    _mostrarTexto = value;
  }

  int _InvoiceNo = 2001;
  int get InvoiceNo => _InvoiceNo;
  set InvoiceNo(int value) {
    _InvoiceNo = value;
    prefs.setInt('ff_InvoiceNo', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
