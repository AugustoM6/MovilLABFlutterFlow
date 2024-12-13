import '/components/chat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CHAT component.
  late ChatModel chatModel;

  @override
  void initState(BuildContext context) {
    chatModel = createModel(context, () => ChatModel());
  }

  @override
  void dispose() {
    chatModel.dispose();
  }
}
