import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpleadosRecord extends FirestoreRecord {
  EmpleadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "fechaContatacion" field.
  DateTime? _fechaContatacion;
  DateTime? get fechaContatacion => _fechaContatacion;
  bool hasFechaContatacion() => _fechaContatacion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _email = snapshotData['email'] as String?;
    _telefono = snapshotData['telefono'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _estado = snapshotData['estado'] as bool?;
    _fechaContatacion = snapshotData['fechaContatacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empleados');

  static Stream<EmpleadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpleadosRecord.fromSnapshot(s));

  static Future<EmpleadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpleadosRecord.fromSnapshot(s));

  static EmpleadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpleadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpleadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpleadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpleadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpleadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpleadosRecordData({
  String? nombre,
  String? email,
  String? telefono,
  String? departamento,
  String? imagen,
  bool? estado,
  DateTime? fechaContatacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'email': email,
      'telefono': telefono,
      'departamento': departamento,
      'imagen': imagen,
      'estado': estado,
      'fechaContatacion': fechaContatacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpleadosRecordDocumentEquality implements Equality<EmpleadosRecord> {
  const EmpleadosRecordDocumentEquality();

  @override
  bool equals(EmpleadosRecord? e1, EmpleadosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.email == e2?.email &&
        e1?.telefono == e2?.telefono &&
        e1?.departamento == e2?.departamento &&
        e1?.imagen == e2?.imagen &&
        e1?.estado == e2?.estado &&
        e1?.fechaContatacion == e2?.fechaContatacion;
  }

  @override
  int hash(EmpleadosRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.email,
        e?.telefono,
        e?.departamento,
        e?.imagen,
        e?.estado,
        e?.fechaContatacion
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpleadosRecord;
}
