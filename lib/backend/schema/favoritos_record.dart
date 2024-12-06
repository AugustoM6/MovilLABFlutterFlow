import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritosRecord extends FirestoreRecord {
  FavoritosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoritos');

  static Stream<FavoritosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritosRecord.fromSnapshot(s));

  static Future<FavoritosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritosRecord.fromSnapshot(s));

  static FavoritosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritosRecordData({
  String? nombre,
  String? imagen,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Imagen': imagen,
      'Descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritosRecordDocumentEquality implements Equality<FavoritosRecord> {
  const FavoritosRecordDocumentEquality();

  @override
  bool equals(FavoritosRecord? e1, FavoritosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imagen == e2?.imagen &&
        e1?.descripcion == e2?.descripcion;
  }

  @override
  int hash(FavoritosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.imagen, e?.descripcion]);

  @override
  bool isValidKey(Object? o) => o is FavoritosRecord;
}
