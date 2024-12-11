import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'formulario_widget.dart' show FormularioWidget;
import 'package:flutter/material.dart';

class FormularioModel extends FlutterFlowModel<FormularioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtNombreDoc widget.
  FocusNode? txtNombreDocFocusNode;
  TextEditingController? txtNombreDocTextController;
  String? Function(BuildContext, String?)? txtNombreDocTextControllerValidator;
  // State field(s) for txtNombrePaciente widget.
  FocusNode? txtNombrePacienteFocusNode;
  TextEditingController? txtNombrePacienteTextController;
  String? Function(BuildContext, String?)?
      txtNombrePacienteTextControllerValidator;
  // State field(s) for txtEdad widget.
  FocusNode? txtEdadFocusNode;
  TextEditingController? txtEdadTextController;
  String? Function(BuildContext, String?)? txtEdadTextControllerValidator;
  // State field(s) for choiceGenero widget.
  FormFieldController<List<String>>? choiceGeneroValueController;
  String? get choiceGeneroValue =>
      choiceGeneroValueController?.value?.firstOrNull;
  set choiceGeneroValue(String? val) =>
      choiceGeneroValueController?.value = val != null ? [val] : [];
  // State field(s) for checkRecursos widget.
  FormFieldController<List<String>>? checkRecursosValueController;
  List<String>? get checkRecursosValues => checkRecursosValueController?.value;
  set checkRecursosValues(List<String>? v) =>
      checkRecursosValueController?.value = v;

  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  // State field(s) for txOtrosRecursos widget.
  FocusNode? txOtrosRecursosFocusNode;
  TextEditingController? txOtrosRecursosTextController;
  String? Function(BuildContext, String?)?
      txOtrosRecursosTextControllerValidator;
  // State field(s) for checkTrabajo widget.
  FormFieldController<List<String>>? checkTrabajoValueController;
  List<String>? get checkTrabajoValues => checkTrabajoValueController?.value;
  set checkTrabajoValues(List<String>? v) =>
      checkTrabajoValueController?.value = v;

  // State field(s) for txtOtroTrabajo widget.
  FocusNode? txtOtroTrabajoFocusNode;
  TextEditingController? txtOtroTrabajoTextController;
  String? Function(BuildContext, String?)?
      txtOtroTrabajoTextControllerValidator;
  // State field(s) for checkMaterial widget.
  FormFieldController<List<String>>? checkMaterialValueController;
  List<String>? get checkMaterialValues => checkMaterialValueController?.value;
  set checkMaterialValues(List<String>? v) =>
      checkMaterialValueController?.value = v;

  // State field(s) for txtMarca widget.
  FocusNode? txtMarcaFocusNode;
  TextEditingController? txtMarcaTextController;
  String? Function(BuildContext, String?)? txtMarcaTextControllerValidator;
  // State field(s) for txtNumeroPlataforma widget.
  FocusNode? txtNumeroPlataformaFocusNode;
  TextEditingController? txtNumeroPlataformaTextController;
  String? Function(BuildContext, String?)?
      txtNumeroPlataformaTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for txtColorMu widget.
  FocusNode? txtColorMuFocusNode;
  TextEditingController? txtColorMuTextController;
  String? Function(BuildContext, String?)? txtColorMuTextControllerValidator;
  // State field(s) for txtColorFinal widget.
  FocusNode? txtColorFinalFocusNode;
  TextEditingController? txtColorFinalTextController;
  String? Function(BuildContext, String?)? txtColorFinalTextControllerValidator;
  // State field(s) for ChoiceAcabado widget.
  FormFieldController<List<String>>? choiceAcabadoValueController;
  String? get choiceAcabadoValue =>
      choiceAcabadoValueController?.value?.firstOrNull;
  set choiceAcabadoValue(String? val) =>
      choiceAcabadoValueController?.value = val != null ? [val] : [];
  // State field(s) for txtObservacionesFinal widget.
  FocusNode? txtObservacionesFinalFocusNode;
  TextEditingController? txtObservacionesFinalTextController;
  String? Function(BuildContext, String?)?
      txtObservacionesFinalTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreDocFocusNode?.dispose();
    txtNombreDocTextController?.dispose();

    txtNombrePacienteFocusNode?.dispose();
    txtNombrePacienteTextController?.dispose();

    txtEdadFocusNode?.dispose();
    txtEdadTextController?.dispose();

    txOtrosRecursosFocusNode?.dispose();
    txOtrosRecursosTextController?.dispose();

    txtOtroTrabajoFocusNode?.dispose();
    txtOtroTrabajoTextController?.dispose();

    txtMarcaFocusNode?.dispose();
    txtMarcaTextController?.dispose();

    txtNumeroPlataformaFocusNode?.dispose();
    txtNumeroPlataformaTextController?.dispose();

    txtColorMuFocusNode?.dispose();
    txtColorMuTextController?.dispose();

    txtColorFinalFocusNode?.dispose();
    txtColorFinalTextController?.dispose();

    txtObservacionesFinalFocusNode?.dispose();
    txtObservacionesFinalTextController?.dispose();
  }
}
