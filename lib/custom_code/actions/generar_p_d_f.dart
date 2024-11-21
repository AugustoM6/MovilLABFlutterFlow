// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

Future<void> generarPDF() async {
  try {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('PDF generado correctamente'),
          );
        },
      ),
    );

    await output.writeAsBytes(await pdf.save());

    print('PDF generado y guardado en: ${output.path}');
  } catch (e) {
    print('Error al generar el PDF: $e');
  }
}

// Opcional: Abrir el PDF automáticamente después de crearlo
// Usa el paquete 'open_file' para abrir el archivo:
// await OpenFile.open(output.path);
