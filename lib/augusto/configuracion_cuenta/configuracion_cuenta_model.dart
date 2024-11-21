import '/flutter_flow/flutter_flow_util.dart';
import 'configuracion_cuenta_widget.dart' show ConfiguracionCuentaWidget;
import 'package:flutter/material.dart';

class ConfiguracionCuentaModel
    extends FlutterFlowModel<ConfiguracionCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // State field(s) for txtEdad widget.
  FocusNode? txtEdadFocusNode;
  TextEditingController? txtEdadTextController;
  String? Function(BuildContext, String?)? txtEdadTextControllerValidator;
  // State field(s) for txtDirrecion widget.
  FocusNode? txtDirrecionFocusNode;
  TextEditingController? txtDirrecionTextController;
  String? Function(BuildContext, String?)? txtDirrecionTextControllerValidator;
  // State field(s) for txtTelefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoTextController;
  String? Function(BuildContext, String?)? txtTelefonoTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtEdadFocusNode?.dispose();
    txtEdadTextController?.dispose();

    txtDirrecionFocusNode?.dispose();
    txtDirrecionTextController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoTextController?.dispose();

    tabBarController?.dispose();
  }
}
