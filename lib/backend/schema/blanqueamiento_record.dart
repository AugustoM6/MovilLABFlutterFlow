import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlanqueamientoRecord extends FirestoreRecord {
  BlanqueamientoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Blanqueamiento')
          : FirebaseFirestore.instance.collectionGroup('Blanqueamiento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Blanqueamiento').doc(id);

  static Stream<BlanqueamientoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlanqueamientoRecord.fromSnapshot(s));

  static Future<BlanqueamientoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlanqueamientoRecord.fromSnapshot(s));

  static BlanqueamientoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlanqueamientoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlanqueamientoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlanqueamientoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlanqueamientoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlanqueamientoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlanqueamientoRecordData({
  String? nombre,
  String? imagen,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Imagen': imagen,
      'descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlanqueamientoRecordDocumentEquality
    implements Equality<BlanqueamientoRecord> {
  const BlanqueamientoRecordDocumentEquality();

  @override
  bool equals(BlanqueamientoRecord? e1, BlanqueamientoRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imagen == e2?.imagen &&
        e1?.descripcion == e2?.descripcion;
  }

  @override
  int hash(BlanqueamientoRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.imagen, e?.descripcion]);

  @override
  bool isValidKey(Object? o) => o is BlanqueamientoRecord;
}
