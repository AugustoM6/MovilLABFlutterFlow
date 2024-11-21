import '/flutter_flow/flutter_flow_util.dart';
import 'password_olvidado_widget.dart' show PasswordOlvidadoWidget;
import 'package:flutter/material.dart';

class PasswordOlvidadoModel extends FlutterFlowModel<PasswordOlvidadoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
