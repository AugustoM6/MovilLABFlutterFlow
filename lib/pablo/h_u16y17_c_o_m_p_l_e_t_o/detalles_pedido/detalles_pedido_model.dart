import '/flutter_flow/flutter_flow_util.dart';
import 'detalles_pedido_widget.dart' show DetallesPedidoWidget;
import 'package:flutter/material.dart';

class DetallesPedidoModel extends FlutterFlowModel<DetallesPedidoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtFdNombre widget.
  FocusNode? txtFdNombreFocusNode;
  TextEditingController? txtFdNombreTextController;
  String? Function(BuildContext, String?)? txtFdNombreTextControllerValidator;
  // State field(s) for txtFdFecha widget.
  FocusNode? txtFdFechaFocusNode;
  TextEditingController? txtFdFechaTextController;
  String? Function(BuildContext, String?)? txtFdFechaTextControllerValidator;
  // State field(s) for txtFdTecnico widget.
  FocusNode? txtFdTecnicoFocusNode;
  TextEditingController? txtFdTecnicoTextController;
  String? Function(BuildContext, String?)? txtFdTecnicoTextControllerValidator;
  // State field(s) for txtFdEstado widget.
  FocusNode? txtFdEstadoFocusNode;
  TextEditingController? txtFdEstadoTextController;
  String? Function(BuildContext, String?)? txtFdEstadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFdNombreFocusNode?.dispose();
    txtFdNombreTextController?.dispose();

    txtFdFechaFocusNode?.dispose();
    txtFdFechaTextController?.dispose();

    txtFdTecnicoFocusNode?.dispose();
    txtFdTecnicoTextController?.dispose();

    txtFdEstadoFocusNode?.dispose();
    txtFdEstadoTextController?.dispose();
  }
}
