import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RememberMeCheckbox widget.
  bool? rememberMeCheckboxValue;
  // State field(s) for PasswordTextFieldlog widget.
  FocusNode? passwordTextFieldlogFocusNode;
  TextEditingController? passwordTextFieldlogTextController;
  late bool passwordTextFieldlogVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldlogTextControllerValidator;
  // State field(s) for EmailTextFieldlog widget.
  FocusNode? emailTextFieldlogFocusNode;
  TextEditingController? emailTextFieldlogTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldlogTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordTextFieldlogVisibility = false;
  }

  @override
  void dispose() {
    passwordTextFieldlogFocusNode?.dispose();
    passwordTextFieldlogTextController?.dispose();

    emailTextFieldlogFocusNode?.dispose();
    emailTextFieldlogTextController?.dispose();
  }
}
