import '/flutter_flow/flutter_flow_util.dart';
import 'editar_servicio_widget.dart' show EditarServicioWidget;
import 'package:flutter/material.dart';

class EditarServicioModel extends FlutterFlowModel<EditarServicioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtFdNombre widget.
  FocusNode? txtFdNombreFocusNode;
  TextEditingController? txtFdNombreTextController;
  String? Function(BuildContext, String?)? txtFdNombreTextControllerValidator;
  // State field(s) for txtFdDescrip widget.
  FocusNode? txtFdDescripFocusNode;
  TextEditingController? txtFdDescripTextController;
  String? Function(BuildContext, String?)? txtFdDescripTextControllerValidator;
  // State field(s) for txtFdPrecio widget.
  FocusNode? txtFdPrecioFocusNode;
  TextEditingController? txtFdPrecioTextController;
  String? Function(BuildContext, String?)? txtFdPrecioTextControllerValidator;
  // State field(s) for txtFdEmpleado widget.
  FocusNode? txtFdEmpleadoFocusNode;
  TextEditingController? txtFdEmpleadoTextController;
  String? Function(BuildContext, String?)? txtFdEmpleadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFdNombreFocusNode?.dispose();
    txtFdNombreTextController?.dispose();

    txtFdDescripFocusNode?.dispose();
    txtFdDescripTextController?.dispose();

    txtFdPrecioFocusNode?.dispose();
    txtFdPrecioTextController?.dispose();

    txtFdEmpleadoFocusNode?.dispose();
    txtFdEmpleadoTextController?.dispose();
  }
}
