import '/flutter_flow/flutter_flow_util.dart';
import 'editar_empleado_widget.dart' show EditarEmpleadoWidget;
import 'package:flutter/material.dart';

class EditarEmpleadoModel extends FlutterFlowModel<EditarEmpleadoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtTelefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoTextController;
  String? Function(BuildContext, String?)? txtTelefonoTextControllerValidator;
  // State field(s) for txtDepartamento widget.
  FocusNode? txtDepartamentoFocusNode;
  TextEditingController? txtDepartamentoTextController;
  String? Function(BuildContext, String?)?
      txtDepartamentoTextControllerValidator;
  // State field(s) for txtEstado widget.
  FocusNode? txtEstadoFocusNode;
  TextEditingController? txtEstadoTextController;
  String? Function(BuildContext, String?)? txtEstadoTextControllerValidator;
  // State field(s) for txtFechaContrat widget.
  FocusNode? txtFechaContratFocusNode;
  TextEditingController? txtFechaContratTextController;
  String? Function(BuildContext, String?)?
      txtFechaContratTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoTextController?.dispose();

    txtDepartamentoFocusNode?.dispose();
    txtDepartamentoTextController?.dispose();

    txtEstadoFocusNode?.dispose();
    txtEstadoTextController?.dispose();

    txtFechaContratFocusNode?.dispose();
    txtFechaContratTextController?.dispose();
  }
}
