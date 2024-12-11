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

Future<void> exportPedidosToPdf() async {
  final collection = FirebaseFirestore.instance.collection('pedidos');

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
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Título
              pw.Text('Pedidos',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              // Encabezados de tabla
              pw.Table.fromTextArray(
                headers: [
                  'Número Pedido',
                  'Fecha',
                  'Producto',
                  'Cantidad',
                  'Total'
                ],
                data: querySnapshot.docs.map((doc) {
                  final data = doc.data();

                  final numeroPedido =
                      data['numeroPedido']?.toString() ?? 'N/A';
                  final fechaTimestamp = data['fecha'];
                  final fecha = (fechaTimestamp is Timestamp)
                      ? fechaTimestamp
                          .toDate()
                          .toLocal()
                          .toString()
                          .split(' ')[0]
                      : 'N/A';
                  final producto = data['producto'] ?? 'N/A';
                  final cantidad = data['cantidad']?.toString() ?? 'N/A';
                  final total = data['total']?.toString() ?? 'N/A';

                  return [numeroPedido, fecha, producto, cantidad, total];
                }).toList(),
              )
            ],
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
      ..download = 'pedidos.pdf'
      ..click();

    // Libera la URL
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print('Error al exportar a PDF: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
