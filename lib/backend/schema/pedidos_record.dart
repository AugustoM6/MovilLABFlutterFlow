import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "tecnicoACargo" field.
  String? _tecnicoACargo;
  String get tecnicoACargo => _tecnicoACargo ?? '';
  bool hasTecnicoACargo() => _tecnicoACargo != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _tecnicoACargo = snapshotData['tecnicoACargo'] as String?;
    _estado = snapshotData['estado'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  String? nombre,
  DateTime? fecha,
  String? tecnicoACargo,
  String? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'fecha': fecha,
      'tecnicoACargo': tecnicoACargo,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.fecha == e2?.fecha &&
        e1?.tecnicoACargo == e2?.tecnicoACargo &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.fecha, e?.tecnicoACargo, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
