import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiciosRecord extends FirestoreRecord {
  ServiciosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  bool hasPrecio() => _precio != null;

  // "empleadoId" field.
  String? _empleadoId;
  String get empleadoId => _empleadoId ?? '';
  bool hasEmpleadoId() => _empleadoId != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _precio = castToType<int>(snapshotData['precio']);
    _empleadoId = snapshotData['empleadoId'] as String?;
    _estado = snapshotData['estado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicios');

  static Stream<ServiciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiciosRecord.fromSnapshot(s));

  static Future<ServiciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiciosRecord.fromSnapshot(s));

  static ServiciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiciosRecordData({
  String? id,
  String? nombre,
  String? descripcion,
  int? precio,
  String? empleadoId,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'empleadoId': empleadoId,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiciosRecordDocumentEquality implements Equality<ServiciosRecord> {
  const ServiciosRecordDocumentEquality();

  @override
  bool equals(ServiciosRecord? e1, ServiciosRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.empleadoId == e2?.empleadoId &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ServiciosRecord? e) => const ListEquality().hash(
      [e?.id, e?.nombre, e?.descripcion, e?.precio, e?.empleadoId, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is ServiciosRecord;
}
