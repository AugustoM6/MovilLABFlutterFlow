import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_pedido_widget.dart' show EditarPedidoWidget;
import 'package:flutter/material.dart';

class EditarPedidoModel extends FlutterFlowModel<EditarPedidoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtFdNombre widget.
  FocusNode? txtFdNombreFocusNode;
  TextEditingController? txtFdNombreTextController;
  String? Function(BuildContext, String?)? txtFdNombreTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for txtFdTecnico widget.
  FocusNode? txtFdTecnicoFocusNode;
  TextEditingController? txtFdTecnicoTextController;
  String? Function(BuildContext, String?)? txtFdTecnicoTextControllerValidator;
  // State field(s) for txtFdEstado widget.
  FocusNode? txtFdEstadoFocusNode;
  TextEditingController? txtFdEstadoTextController;
  String? Function(BuildContext, String?)? txtFdEstadoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    txtFdNombreFocusNode?.dispose();
    txtFdNombreTextController?.dispose();

    txtFdTecnicoFocusNode?.dispose();
    txtFdTecnicoTextController?.dispose();

    txtFdEstadoFocusNode?.dispose();
    txtFdEstadoTextController?.dispose();
  }
}
