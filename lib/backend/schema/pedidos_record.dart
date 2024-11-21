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

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "producto" field.
  String? _producto;
  String get producto => _producto ?? '';
  bool hasProducto() => _producto != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "numeroPedido" field.
  String? _numeroPedido;
  String get numeroPedido => _numeroPedido ?? '';
  bool hasNumeroPedido() => _numeroPedido != null;

  // "mes" field.
  String? _mes;
  String get mes => _mes ?? '';
  bool hasMes() => _mes != null;

  void _initializeFields() {
    _fecha = snapshotData['fecha'] as DateTime?;
    _producto = snapshotData['producto'] as String?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _total = castToType<double>(snapshotData['total']);
    _numeroPedido = snapshotData['numeroPedido'] as String?;
    _mes = snapshotData['mes'] as String?;
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
  DateTime? fecha,
  String? producto,
  int? cantidad,
  double? total,
  String? numeroPedido,
  String? mes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha': fecha,
      'producto': producto,
      'cantidad': cantidad,
      'total': total,
      'numeroPedido': numeroPedido,
      'mes': mes,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.fecha == e2?.fecha &&
        e1?.producto == e2?.producto &&
        e1?.cantidad == e2?.cantidad &&
        e1?.total == e2?.total &&
        e1?.numeroPedido == e2?.numeroPedido &&
        e1?.mes == e2?.mes;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash(
      [e?.fecha, e?.producto, e?.cantidad, e?.total, e?.numeroPedido, e?.mes]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
