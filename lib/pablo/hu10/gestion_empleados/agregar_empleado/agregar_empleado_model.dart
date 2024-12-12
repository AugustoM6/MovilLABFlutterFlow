import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_empleado_widget.dart' show AgregarEmpleadoWidget;
import 'package:flutter/material.dart';

class AgregarEmpleadoModel extends FlutterFlowModel<AgregarEmpleadoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtFdNombre widget.
  FocusNode? txtFdNombreFocusNode;
  TextEditingController? txtFdNombreTextController;
  String? Function(BuildContext, String?)? txtFdNombreTextControllerValidator;
  // State field(s) for txtFdEmail widget.
  FocusNode? txtFdEmailFocusNode;
  TextEditingController? txtFdEmailTextController;
  String? Function(BuildContext, String?)? txtFdEmailTextControllerValidator;
  // State field(s) for txtFdTelefono widget.
  FocusNode? txtFdTelefonoFocusNode;
  TextEditingController? txtFdTelefonoTextController;
  String? Function(BuildContext, String?)? txtFdTelefonoTextControllerValidator;
  // State field(s) for txtFdDepartamento widget.
  FocusNode? txtFdDepartamentoFocusNode;
  TextEditingController? txtFdDepartamentoTextController;
  String? Function(BuildContext, String?)?
      txtFdDepartamentoTextControllerValidator;
  // State field(s) for txtFdEstado widget.
  FocusNode? txtFdEstadoFocusNode;
  TextEditingController? txtFdEstadoTextController;
  String? Function(BuildContext, String?)? txtFdEstadoTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

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

    txtFdEmailFocusNode?.dispose();
    txtFdEmailTextController?.dispose();

    txtFdTelefonoFocusNode?.dispose();
    txtFdTelefonoTextController?.dispose();

    txtFdDepartamentoFocusNode?.dispose();
    txtFdDepartamentoTextController?.dispose();

    txtFdEstadoFocusNode?.dispose();
    txtFdEstadoTextController?.dispose();
  }
}
