import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoronasRecord extends FirestoreRecord {
  CoronasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Coronas')
          : FirebaseFirestore.instance.collectionGroup('Coronas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Coronas').doc(id);

  static Stream<CoronasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoronasRecord.fromSnapshot(s));

  static Future<CoronasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoronasRecord.fromSnapshot(s));

  static CoronasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoronasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoronasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoronasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoronasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoronasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoronasRecordData({
  String? nombre,
  String? descripcion,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Descripcion': descripcion,
      'Imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoronasRecordDocumentEquality implements Equality<CoronasRecord> {
  const CoronasRecordDocumentEquality();

  @override
  bool equals(CoronasRecord? e1, CoronasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(CoronasRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.descripcion, e?.imagen]);

  @override
  bool isValidKey(Object? o) => o is CoronasRecord;
}
