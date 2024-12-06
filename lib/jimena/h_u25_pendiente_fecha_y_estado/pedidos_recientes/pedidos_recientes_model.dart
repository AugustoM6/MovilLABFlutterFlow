import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pedidos_recientes_widget.dart' show PedidosRecientesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PedidosRecientesModel extends FlutterFlowModel<PedidosRecientesWidget> {
  ///  Local state fields for this page.

  int minRango = 0;

  int maxRango = 1;

  int paginas = 2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
