import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'forgot_pass_widget.dart' show ForgotPassWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassModel extends FlutterFlowModel<ForgotPassWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTextFieldrecover widget.
  FocusNode? emailTextFieldrecoverFocusNode;
  TextEditingController? emailTextFieldrecoverTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldrecoverTextControllerValidator;
  String? _emailTextFieldrecoverTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0lpnh5xu' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextFieldrecoverTextControllerValidator =
        _emailTextFieldrecoverTextControllerValidator;
  }

  @override
  void dispose() {
    emailTextFieldrecoverFocusNode?.dispose();
    emailTextFieldrecoverTextController?.dispose();
  }
}
