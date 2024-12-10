import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductoRecord extends FirestoreRecord {
  ProductoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "tecnico" field.
  String? _tecnico;
  String get tecnico => _tecnico ?? '';
  bool hasTecnico() => _tecnico != null;

  // "favoritos" field.
  bool? _favoritos;
  bool get favoritos => _favoritos ?? false;
  bool hasFavoritos() => _favoritos != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _tecnico = snapshotData['tecnico'] as String?;
    _favoritos = snapshotData['favoritos'] as bool?;
    _imagen = snapshotData['imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('producto');

  static Stream<ProductoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductoRecord.fromSnapshot(s));

  static Future<ProductoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductoRecord.fromSnapshot(s));

  static ProductoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductoRecordData({
  int? id,
  String? nombre,
  String? descripcion,
  String? categoria,
  String? departamento,
  String? tecnico,
  bool? favoritos,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'categoria': categoria,
      'departamento': departamento,
      'tecnico': tecnico,
      'favoritos': favoritos,
      'imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductoRecordDocumentEquality implements Equality<ProductoRecord> {
  const ProductoRecordDocumentEquality();

  @override
  bool equals(ProductoRecord? e1, ProductoRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.departamento == e2?.departamento &&
        e1?.tecnico == e2?.tecnico &&
        e1?.favoritos == e2?.favoritos &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(ProductoRecord? e) => const ListEquality().hash([
        e?.id,
        e?.nombre,
        e?.descripcion,
        e?.categoria,
        e?.departamento,
        e?.tecnico,
        e?.favoritos,
        e?.imagen
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductoRecord;
}
