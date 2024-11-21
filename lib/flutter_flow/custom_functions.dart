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
    if (lista[i] >= rangoMin && lista[i] <= rangoMax) {
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
