import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormularioRecord extends FirestoreRecord {
  FormularioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  bool hasEdad() => _edad != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "infoRecursos" field.
  String? _infoRecursos;
  String get infoRecursos => _infoRecursos ?? '';
  bool hasInfoRecursos() => _infoRecursos != null;

  // "nombreDoc" field.
  String? _nombreDoc;
  String get nombreDoc => _nombreDoc ?? '';
  bool hasNombreDoc() => _nombreDoc != null;

  // "nombrePaciente" field.
  String? _nombrePaciente;
  String get nombrePaciente => _nombrePaciente ?? '';
  bool hasNombrePaciente() => _nombrePaciente != null;

  // "recursosCheck" field.
  List<String>? _recursosCheck;
  List<String> get recursosCheck => _recursosCheck ?? const [];
  bool hasRecursosCheck() => _recursosCheck != null;

  // "otrosRecursos" field.
  String? _otrosRecursos;
  String get otrosRecursos => _otrosRecursos ?? '';
  bool hasOtrosRecursos() => _otrosRecursos != null;

  // "trabajoCheck" field.
  List<String>? _trabajoCheck;
  List<String> get trabajoCheck => _trabajoCheck ?? const [];
  bool hasTrabajoCheck() => _trabajoCheck != null;

  // "otroTrabajo" field.
  String? _otroTrabajo;
  String get otroTrabajo => _otroTrabajo ?? '';
  bool hasOtroTrabajo() => _otroTrabajo != null;

  // "materialCheck" field.
  List<String>? _materialCheck;
  List<String> get materialCheck => _materialCheck ?? const [];
  bool hasMaterialCheck() => _materialCheck != null;

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "numeroPlataforma" field.
  int? _numeroPlataforma;
  int get numeroPlataforma => _numeroPlataforma ?? 0;
  bool hasNumeroPlataforma() => _numeroPlataforma != null;

  // "colorMunon" field.
  String? _colorMunon;
  String get colorMunon => _colorMunon ?? '';
  bool hasColorMunon() => _colorMunon != null;

  // "colorfinal" field.
  String? _colorfinal;
  String get colorfinal => _colorfinal ?? '';
  bool hasColorfinal() => _colorfinal != null;

  // "categoriaAcabado" field.
  String? _categoriaAcabado;
  String get categoriaAcabado => _categoriaAcabado ?? '';
  bool hasCategoriaAcabado() => _categoriaAcabado != null;

  // "observacionesFinales" field.
  String? _observacionesFinales;
  String get observacionesFinales => _observacionesFinales ?? '';
  bool hasObservacionesFinales() => _observacionesFinales != null;

  // "imagenImplante" field.
  String? _imagenImplante;
  String get imagenImplante => _imagenImplante ?? '';
  bool hasImagenImplante() => _imagenImplante != null;

  // "imagenRecursos" field.
  List<String>? _imagenRecursos;
  List<String> get imagenRecursos => _imagenRecursos ?? const [];
  bool hasImagenRecursos() => _imagenRecursos != null;

  // "NumeroFactura" field.
  double? _numeroFactura;
  double get numeroFactura => _numeroFactura ?? 0.0;
  bool hasNumeroFactura() => _numeroFactura != null;

  // "count" field.
  List<double>? _count;
  List<double> get count => _count ?? const [];
  bool hasCount() => _count != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _edad = castToType<int>(snapshotData['edad']);
    _genero = snapshotData['genero'] as String?;
    _infoRecursos = snapshotData['infoRecursos'] as String?;
    _nombreDoc = snapshotData['nombreDoc'] as String?;
    _nombrePaciente = snapshotData['nombrePaciente'] as String?;
    _recursosCheck = getDataList(snapshotData['recursosCheck']);
    _otrosRecursos = snapshotData['otrosRecursos'] as String?;
    _trabajoCheck = getDataList(snapshotData['trabajoCheck']);
    _otroTrabajo = snapshotData['otroTrabajo'] as String?;
    _materialCheck = getDataList(snapshotData['materialCheck']);
    _marca = snapshotData['marca'] as String?;
    _numeroPlataforma = castToType<int>(snapshotData['numeroPlataforma']);
    _colorMunon = snapshotData['colorMunon'] as String?;
    _colorfinal = snapshotData['colorfinal'] as String?;
    _categoriaAcabado = snapshotData['categoriaAcabado'] as String?;
    _observacionesFinales = snapshotData['observacionesFinales'] as String?;
    _imagenImplante = snapshotData['imagenImplante'] as String?;
    _imagenRecursos = getDataList(snapshotData['imagenRecursos']);
    _numeroFactura = castToType<double>(snapshotData['NumeroFactura']);
    _count = getDataList(snapshotData['count']);
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('formulario');

  static Stream<FormularioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormularioRecord.fromSnapshot(s));

  static Future<FormularioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormularioRecord.fromSnapshot(s));

  static FormularioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormularioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormularioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormularioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormularioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormularioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormularioRecordData({
  int? edad,
  String? genero,
  String? infoRecursos,
  String? nombreDoc,
  String? nombrePaciente,
  String? otrosRecursos,
  String? otroTrabajo,
  String? marca,
  int? numeroPlataforma,
  String? colorMunon,
  String? colorfinal,
  String? categoriaAcabado,
  String? observacionesFinales,
  String? imagenImplante,
  double? numeroFactura,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'edad': edad,
      'genero': genero,
      'infoRecursos': infoRecursos,
      'nombreDoc': nombreDoc,
      'nombrePaciente': nombrePaciente,
      'otrosRecursos': otrosRecursos,
      'otroTrabajo': otroTrabajo,
      'marca': marca,
      'numeroPlataforma': numeroPlataforma,
      'colorMunon': colorMunon,
      'colorfinal': colorfinal,
      'categoriaAcabado': categoriaAcabado,
      'observacionesFinales': observacionesFinales,
      'imagenImplante': imagenImplante,
      'NumeroFactura': numeroFactura,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormularioRecordDocumentEquality implements Equality<FormularioRecord> {
  const FormularioRecordDocumentEquality();

  @override
  bool equals(FormularioRecord? e1, FormularioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.edad == e2?.edad &&
        e1?.genero == e2?.genero &&
        e1?.infoRecursos == e2?.infoRecursos &&
        e1?.nombreDoc == e2?.nombreDoc &&
        e1?.nombrePaciente == e2?.nombrePaciente &&
        listEquality.equals(e1?.recursosCheck, e2?.recursosCheck) &&
        e1?.otrosRecursos == e2?.otrosRecursos &&
        listEquality.equals(e1?.trabajoCheck, e2?.trabajoCheck) &&
        e1?.otroTrabajo == e2?.otroTrabajo &&
        listEquality.equals(e1?.materialCheck, e2?.materialCheck) &&
        e1?.marca == e2?.marca &&
        e1?.numeroPlataforma == e2?.numeroPlataforma &&
        e1?.colorMunon == e2?.colorMunon &&
        e1?.colorfinal == e2?.colorfinal &&
        e1?.categoriaAcabado == e2?.categoriaAcabado &&
        e1?.observacionesFinales == e2?.observacionesFinales &&
        e1?.imagenImplante == e2?.imagenImplante &&
        listEquality.equals(e1?.imagenRecursos, e2?.imagenRecursos) &&
        e1?.numeroFactura == e2?.numeroFactura &&
        listEquality.equals(e1?.count, e2?.count) &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(FormularioRecord? e) => const ListEquality().hash([
        e?.edad,
        e?.genero,
        e?.infoRecursos,
        e?.nombreDoc,
        e?.nombrePaciente,
        e?.recursosCheck,
        e?.otrosRecursos,
        e?.trabajoCheck,
        e?.otroTrabajo,
        e?.materialCheck,
        e?.marca,
        e?.numeroPlataforma,
        e?.colorMunon,
        e?.colorfinal,
        e?.categoriaAcabado,
        e?.observacionesFinales,
        e?.imagenImplante,
        e?.imagenRecursos,
        e?.numeroFactura,
        e?.count,
        e?.fecha
      ]);

  @override
  bool isValidKey(Object? o) => o is FormularioRecord;
}
