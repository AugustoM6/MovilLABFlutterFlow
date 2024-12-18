import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_producto_widget.dart' show AgregarProductoWidget;
import 'package:flutter/material.dart';

class AgregarProductoModel extends FlutterFlowModel<AgregarProductoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtFdNombre widget.
  FocusNode? txtFdNombreFocusNode;
  TextEditingController? txtFdNombreTextController;
  String? Function(BuildContext, String?)? txtFdNombreTextControllerValidator;
  // State field(s) for txtFdDescrip widget.
  FocusNode? txtFdDescripFocusNode;
  TextEditingController? txtFdDescripTextController;
  String? Function(BuildContext, String?)? txtFdDescripTextControllerValidator;
  // State field(s) for txtFdDepartam widget.
  FocusNode? txtFdDepartamFocusNode;
  TextEditingController? txtFdDepartamTextController;
  String? Function(BuildContext, String?)? txtFdDepartamTextControllerValidator;
  // State field(s) for txtFdTecnico widget.
  FocusNode? txtFdTecnicoFocusNode;
  TextEditingController? txtFdTecnicoTextController;
  String? Function(BuildContext, String?)? txtFdTecnicoTextControllerValidator;
  // State field(s) for txtFdCategoria widget.
  FocusNode? txtFdCategoriaFocusNode;
  TextEditingController? txtFdCategoriaTextController;
  String? Function(BuildContext, String?)?
      txtFdCategoriaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFdNombreFocusNode?.dispose();
    txtFdNombreTextController?.dispose();

    txtFdDescripFocusNode?.dispose();
    txtFdDescripTextController?.dispose();

    txtFdDepartamFocusNode?.dispose();
    txtFdDepartamTextController?.dispose();

    txtFdTecnicoFocusNode?.dispose();
    txtFdTecnicoTextController?.dispose();

    txtFdCategoriaFocusNode?.dispose();
    txtFdCategoriaTextController?.dispose();
  }
}
