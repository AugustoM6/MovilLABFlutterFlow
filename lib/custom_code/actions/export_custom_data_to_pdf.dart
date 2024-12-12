// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<void> exportCustomDataToPdf() async {
  final collection = FirebaseFirestore.instance.collection('formulario');

  try {
    // Obtén los documentos de la colección
    final querySnapshot = await collection.get();

    // Crea un documento PDF
    final pdf = pw.Document();

    // Añade una página al PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.ListView(
            children: querySnapshot.docs.map((doc) {
              final data = doc.data();

              // Extrae los datos del documento
              final edad = data['edad']?.toString() ?? 'N/A';
              final genero = data['genero'] ?? 'N/A';
              final infoRecursos = data['infoRecursos'] ?? 'N/A';
              final nombreDoc = data['nombreDoc'] ?? 'N/A';
              final nombrePaciente = data['nombrePaciente'] ?? 'N/A';
              final otrosRecursos = data['otrosRecursos'] ?? 'N/A';
              final otroTrabajo = data['otroTrabajo'] ?? 'N/A';
              final marca = data['marca'] ?? 'N/A';
              final numeroPlataforma =
                  data['numeroPlataforma']?.toString() ?? 'N/A';
              final colorMunon = data['colorMunon'] ?? 'N/A';
              final colorfinal = data['colorfinal'] ?? 'N/A';
              final categoriaAcabado = data['categoriaAcabado'] ?? 'N/A';
              final observacionesFinales =
                  data['observacionesFinales'] ?? 'N/A';
              final fecha = data['fecha'] ?? 'N/A';
              final numeroFactura = data['numeroFactura']?.toString() ?? 'N/A';

              // Retorna una sección por documento
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Edad: $edad'),
                  pw.Text('Género: $genero'),
                  pw.Text('Info Recursos: $infoRecursos'),
                  pw.Text('Nombre Doc: $nombreDoc'),
                  pw.Text('Nombre Paciente: $nombrePaciente'),
                  pw.Text('Otros Recursos: $otrosRecursos'),
                  pw.Text('Otro Trabajo: $otroTrabajo'),
                  pw.Text('Marca: $marca'),
                  pw.Text('Número Plataforma: $numeroPlataforma'),
                  pw.Text('Color Muñón: $colorMunon'),
                  pw.Text('Color Final: $colorfinal'),
                  pw.Text('Categoría Acabado: $categoriaAcabado'),
                  pw.Text('Observaciones Finales: $observacionesFinales'),
                  pw.Text('Fecha: $fecha'),
                  pw.Text('Número Factura: $numeroFactura'),
                  pw.Divider(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );

    // Convierte el archivo PDF a bytes
    final pdfBytes = await pdf.save();

    // Crea un blob y una URL para descargar el archivo
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Crea un enlace de descarga
    final anchor = html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = 'customData.pdf'
      ..click();

    // Libera la URL
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print('Error al exportar a PDF: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
