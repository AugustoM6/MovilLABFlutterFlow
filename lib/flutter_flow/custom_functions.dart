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

int? numeroFac() {
  FirebaseFirestore.instance
      .collection('formulario')
      .orderBy('numFactura', descending: true)
      .limit(1)
      .get()
      .then((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final lastFactura = snapshot.docs.first.data()['numFactura'] as int;
      return lastFactura + 1;
    } else {
      return 1;
    }
  }).catchError((error) {
    print('Error al consultar el número de factura: $error');
    return null;
  });
}
