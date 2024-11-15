import '/flutter_flow/flutter_flow_util.dart';
import 'create_user_widget.dart' show CreateUserWidget;
import 'package:flutter/material.dart';

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameTextController;
  String? Function(BuildContext, String?)? txtNameTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordTextController;
  String? Function(BuildContext, String?)? txtPasswordTextControllerValidator;
  // State field(s) for txtPasswordConfirmation widget.
  FocusNode? txtPasswordConfirmationFocusNode;
  TextEditingController? txtPasswordConfirmationTextController;
  String? Function(BuildContext, String?)?
      txtPasswordConfirmationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtPasswordFocusNode?.dispose();
    txtPasswordTextController?.dispose();

    txtPasswordConfirmationFocusNode?.dispose();
    txtPasswordConfirmationTextController?.dispose();
  }
}
