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

  List<DocumentReference> _pedidosList = [];
  List<DocumentReference> get pedidosList => _pedidosList;
  set pedidosList(List<DocumentReference> value) {
    _pedidosList = value;
  }

  void addToPedidosList(DocumentReference value) {
    pedidosList.add(value);
  }

  void removeFromPedidosList(DocumentReference value) {
    pedidosList.remove(value);
  }

  void removeAtIndexFromPedidosList(int index) {
    pedidosList.removeAt(index);
  }

  void updatePedidosListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    pedidosList[index] = updateFn(_pedidosList[index]);
  }

  void insertAtIndexInPedidosList(int index, DocumentReference value) {
    pedidosList.insert(index, value);
  }
}
