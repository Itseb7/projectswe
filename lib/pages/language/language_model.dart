import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/components/languages_item/languages_item_widget.dart';
import 'dart:ui';
import 'language_widget.dart' show LanguageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageModel extends FlutterFlowModel<LanguageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for en.
  late LanguagesItemModel enModel;
  // Model for es.
  late LanguagesItemModel esModel;
  // Model for fr.
  late LanguagesItemModel frModel;
  // Model for ar.
  late LanguagesItemModel arModel;

  @override
  void initState(BuildContext context) {
    enModel = createModel(context, () => LanguagesItemModel());
    esModel = createModel(context, () => LanguagesItemModel());
    frModel = createModel(context, () => LanguagesItemModel());
    arModel = createModel(context, () => LanguagesItemModel());
  }

  @override
  void dispose() {
    enModel.dispose();
    esModel.dispose();
    frModel.dispose();
    arModel.dispose();
  }
}
