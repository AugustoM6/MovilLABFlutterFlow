import 'package:flutter/material.dart';
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
    _safeInit(() {
      _listaUsuarios = prefs
              .getStringList('ff_listaUsuarios')
              ?.map((path) => path.ref)
              .toList() ??
          _listaUsuarios;
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

  DocumentReference? _Pedidos;
  DocumentReference? get Pedidos => _Pedidos;
  set Pedidos(DocumentReference? value) {
    _Pedidos = value;
  }

  List<DocumentReference> _listaUsuarios = [
    FirebaseFirestore.instance.doc('/formulario/example')
  ];
  List<DocumentReference> get listaUsuarios => _listaUsuarios;
  set listaUsuarios(List<DocumentReference> value) {
    _listaUsuarios = value;
    prefs.setStringList('ff_listaUsuarios', value.map((x) => x.path).toList());
  }

  void addToListaUsuarios(DocumentReference value) {
    listaUsuarios.add(value);
    prefs.setStringList(
        'ff_listaUsuarios', _listaUsuarios.map((x) => x.path).toList());
  }

  void removeFromListaUsuarios(DocumentReference value) {
    listaUsuarios.remove(value);
    prefs.setStringList(
        'ff_listaUsuarios', _listaUsuarios.map((x) => x.path).toList());
  }

  void removeAtIndexFromListaUsuarios(int index) {
    listaUsuarios.removeAt(index);
    prefs.setStringList(
        'ff_listaUsuarios', _listaUsuarios.map((x) => x.path).toList());
  }

  void updateListaUsuariosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listaUsuarios[index] = updateFn(_listaUsuarios[index]);
    prefs.setStringList(
        'ff_listaUsuarios', _listaUsuarios.map((x) => x.path).toList());
  }

  void insertAtIndexInListaUsuarios(int index, DocumentReference value) {
    listaUsuarios.insert(index, value);
    prefs.setStringList(
        'ff_listaUsuarios', _listaUsuarios.map((x) => x.path).toList());
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
