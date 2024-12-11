import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DocumentReference> getListaPedidos(
  int rangoMin,
  int rangoMax,
  List<DocumentReference> lista,
) {
  List<DocumentReference> listaPedidos = <DocumentReference<Object?>>[];

  for (int i = 0; i < lista.length; i++) {
    if (rangoMin <= i && rangoMax >= i) {
      listaPedidos.add(lista[i]);
    }
  }

  return listaPedidos;
}

int paginaActual(
  int rangoMax,
  int pagina,
) {
  int paginaActual = (rangoMax - 1) ~/ pagina + 1;
  return paginaActual;
}

int numeroPagina(
  int total,
  int pagina,
) {
  int totalPaginas = (total + pagina - 1) ~/ pagina;
  return totalPaginas;
}

int conversionInteger(double value) {
  int resultado = value.toInt();
  return resultado;
}

int factura() {
  // Realizame uncodigo para que se consulte la colleccion formulario, el campo numeroFactura de tipo integer y que se sume +1 y lo devuelva esta funcion se debe hacer autromaticamente y no usar Nullable
  int numeroFactura = 0;

  // Consultar la colección 'formulario' en Firestore
  FirebaseFirestore.instance
      .collection('formulario')
      .get()
      .then((QuerySnapshot querySnapshot) {
    // Iterar sobre los documentos en la colección
    querySnapshot.docs.forEach((doc) {
      // Obtener el valor del campo 'numeroFactura' como entero
      int factura = doc['numeroFactura'] as int;
      // Sumar 1 al valor obtenido
      numeroFactura += factura + 1;
    });
  });

  return numeroFactura;
}
