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
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return querySnapshot.docs.map((doc) {
            final data = doc.data();

            // Extrae los datos del documento
            final numeroFactura = data['numeroFactura']?.toString() ?? 'N/A';
            final nombreDoc = data['nombreDoc'] ?? 'N/A';
            final fecha = data['fecha'] ?? 'N/A';
            final nombrePaciente = data['nombrePaciente'] ?? 'N/A';
            final edad = data['edad']?.toString() ?? 'N/A';
            final genero = data['genero'] ?? 'N/A';

            final recursosCheck =
                List<String>.from(data['recursosCheck'] ?? []);
            final imagenRecursos =
                List<String>.from(data['imagenRecursos'] ?? []);
            final otrosRecursos = data['otrosRecursos'] ?? 'N/A';

            final trabajoCheck = List<String>.from(data['trabajoCheck'] ?? []);
            final otroTrabajo = data['otroTrabajo'] ?? 'N/A';

            final materialCheck =
                List<String>.from(data['materialCheck'] ?? []);

            final marca = data['marca'] ?? 'N/A';
            final numeroPlataforma =
                data['numeroPlataforma']?.toString() ?? 'N/A';
            final imagenImplante = data['imagenImplante'] ?? '';

            final colorMunon = data['colorMunon'] ?? 'N/A';
            final colorFinal = data['colorfinal'] ?? 'N/A';
            final categoriaAcabado = data['categoriaAcabado'] ?? 'N/A';

            // Retorna el contenido para una página del PDF
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text('Factura No: $numeroFactura',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text('Información del Paciente',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 10),
                pw.Text('Doctor: $nombreDoc'),
                pw.Text('Fecha: $fecha'),
                pw.Text('Paciente: $nombrePaciente'),
                pw.Text('Edad: $edad'),
                pw.Text('Género: $genero'),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Recursos',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 10),
                ...recursosCheck.map((recurso) => pw.Text(recurso)).toList(),
                pw.SizedBox(height: 10),
                ...imagenRecursos
                    .map((imgPath) =>
                        pw.Image(pw.MemoryImage(Uint8List.fromList([]))))
                    .toList(),
                pw.Text('Otros Recursos: $otrosRecursos'),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Tipo Trabajo',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                ...trabajoCheck.map((trabajo) => pw.Text(trabajo)).toList(),
                pw.Text('Otro Trabajo: $otroTrabajo'),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Material',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                ...materialCheck.map((material) => pw.Text(material)).toList(),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Información de Implantes',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text('Marca: $marca'),
                pw.Text('Número Plataforma: $numeroPlataforma'),
                pw.Image(pw.MemoryImage(Uint8List.fromList([]))),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Color y Acabado',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text('Color Muñón: $colorMunon'),
                pw.Text('Color Final: $colorFinal'),
                pw.Text('Categoría Acabado: $categoriaAcabado'),
              ],
            );
          }).toList();
        },
      ),
    );

    // Convierte el archivo PDF a bytes
    final pdfBytes = await pdf.save() as Uint8List;

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
