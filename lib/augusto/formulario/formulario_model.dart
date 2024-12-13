import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'formulario_widget.dart' show FormularioWidget;
import 'package:flutter/material.dart';

class FormularioModel extends FlutterFlowModel<FormularioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNumeroFac widget.
  FocusNode? txtNumeroFacFocusNode;
  TextEditingController? txtNumeroFacTextController;
  String? Function(BuildContext, String?)? txtNumeroFacTextControllerValidator;
  // State field(s) for txtNombreDoc widget.
  FocusNode? txtNombreDocFocusNode;
  TextEditingController? txtNombreDocTextController;
  String? Function(BuildContext, String?)? txtNombreDocTextControllerValidator;
  String? _txtNombreDocTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p6or509x' /* Ingres su nombre  */,
      );
    }

    return null;
  }

  // State field(s) for txtNombrePaciente widget.
  FocusNode? txtNombrePacienteFocusNode;
  TextEditingController? txtNombrePacienteTextController;
  String? Function(BuildContext, String?)?
      txtNombrePacienteTextControllerValidator;
  String? _txtNombrePacienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3xq6ydwz' /* Por favor ingrese e nombre del... */,
      );
    }

    return null;
  }

  // State field(s) for txtEdad widget.
  FocusNode? txtEdadFocusNode;
  TextEditingController? txtEdadTextController;
  String? Function(BuildContext, String?)? txtEdadTextControllerValidator;
  String? _txtEdadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ukyk3wov' /* Ingrese la edad  */,
      );
    }

    return null;
  }

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

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

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
  String? _txtMarcaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '39mfg4a5' /* In  la  marca  */,
      );
    }

    return null;
  }

  // State field(s) for txtNumeroPlataforma widget.
  FocusNode? txtNumeroPlataformaFocusNode;
  TextEditingController? txtNumeroPlataformaTextController;
  String? Function(BuildContext, String?)?
      txtNumeroPlataformaTextControllerValidator;
  String? _txtNumeroPlataformaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'crwzc61o' /* Ingrese el numero de plataform... */,
      );
    }

    return null;
  }

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for txtColorMu widget.
  FocusNode? txtColorMuFocusNode;
  TextEditingController? txtColorMuTextController;
  String? Function(BuildContext, String?)? txtColorMuTextControllerValidator;
  String? _txtColorMuTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yv7cj1zb' /* Ingrese el color del Muñon */,
      );
    }

    return null;
  }

  // State field(s) for txtColorFinal widget.
  FocusNode? txtColorFinalFocusNode;
  TextEditingController? txtColorFinalTextController;
  String? Function(BuildContext, String?)? txtColorFinalTextControllerValidator;
  String? _txtColorFinalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mirywcic' /* Ingrese el color final */,
      );
    }

    return null;
  }

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
  void initState(BuildContext context) {
    txtNombreDocTextControllerValidator = _txtNombreDocTextControllerValidator;
    txtNombrePacienteTextControllerValidator =
        _txtNombrePacienteTextControllerValidator;
    txtEdadTextControllerValidator = _txtEdadTextControllerValidator;
    txtMarcaTextControllerValidator = _txtMarcaTextControllerValidator;
    txtNumeroPlataformaTextControllerValidator =
        _txtNumeroPlataformaTextControllerValidator;
    txtColorMuTextControllerValidator = _txtColorMuTextControllerValidator;
    txtColorFinalTextControllerValidator =
        _txtColorFinalTextControllerValidator;
  }

  @override
  void dispose() {
    txtNumeroFacFocusNode?.dispose();
    txtNumeroFacTextController?.dispose();

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
