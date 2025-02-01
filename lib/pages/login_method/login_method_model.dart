import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_method_widget.dart' show LoginMethodWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMethodModel extends FlutterFlowModel<LoginMethodWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for PasswordTextFieldl widget.
  FocusNode? passwordTextFieldlFocusNode;
  TextEditingController? passwordTextFieldlTextController;
  late bool passwordTextFieldlVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldlTextControllerValidator;
  // State field(s) for PasswordTextFieldlo widget.
  FocusNode? passwordTextFieldloFocusNode;
  TextEditingController? passwordTextFieldloTextController;
  late bool passwordTextFieldloVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldloTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordTextFieldlVisibility = false;
    passwordTextFieldloVisibility = false;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldlFocusNode?.dispose();
    passwordTextFieldlTextController?.dispose();

    passwordTextFieldloFocusNode?.dispose();
    passwordTextFieldloTextController?.dispose();
  }
}
