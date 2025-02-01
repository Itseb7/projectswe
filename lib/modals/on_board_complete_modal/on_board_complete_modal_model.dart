import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/loading/loading_widget.dart';
import 'dart:ui';
import 'on_board_complete_modal_widget.dart' show OnBoardCompleteModalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnBoardCompleteModalModel
    extends FlutterFlowModel<OnBoardCompleteModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    loadingModel.dispose();
  }
}
