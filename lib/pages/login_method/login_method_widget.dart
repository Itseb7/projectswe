import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_method_model.dart';
export 'login_method_model.dart';

class LoginMethodWidget extends StatefulWidget {
  const LoginMethodWidget({
    super.key,
    required this.aaa,
  });

  final String? aaa;

  @override
  State<LoginMethodWidget> createState() => _LoginMethodWidgetState();
}

class _LoginMethodWidgetState extends State<LoginMethodWidget> {
  late LoginMethodModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginMethodModel());

    _model.emailTextFieldTextController ??= TextEditingController();
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.passwordTextFieldlTextController ??= TextEditingController();
    _model.passwordTextFieldlFocusNode ??= FocusNode();

    _model.passwordTextFieldloTextController ??= TextEditingController();
    _model.passwordTextFieldloFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e-commercemobileapp-full-working-a-p-p-fe00nt/assets/7gq5yugur9fm/WhatsApp_Image_2025-01-26_at_2.57.11_AM.jpeg',
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x00FFFFFF),
                              FlutterFlowTheme.of(context).secondaryBackground
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.11),
                child: TextFormField(
                  controller: _model.emailTextFieldTextController,
                  focusNode: _model.emailTextFieldFocusNode,
                  onFieldSubmitted: (_) async {
                    await authManager.refreshUser();
                    safeSetState(() {
                      _model.emailTextFieldTextController?.text =
                          '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$';
                      _model.emailTextFieldFocusNode?.requestFocus();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _model.emailTextFieldTextController?.selection =
                            TextSelection.collapsed(
                          offset:
                              _model.emailTextFieldTextController!.text.length,
                        );
                      });
                    });
                    if (currentUserEmailVerified ? true : true) {
                      Navigator.pop(context);
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text('please enter a correct email'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      shadows: [
                        Shadow(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0,
                        )
                      ],
                    ),
                    hintText: FFLocalizations.of(context).getText(
                      'xbyffu85' /* Email */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFEFCFC),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _model.emailTextFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.01, -0.08),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'd7eycoi4' /* Sign up */,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.06, 0.03),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'cfoz26i7' /* Create your account */,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF586167),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.19, 0.48),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    if (_model.passwordTextFieldloTextController.text !=
                        _model.passwordTextFieldlTextController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Passwords don\'t match!',
                          ),
                        ),
                      );
                      return;
                    }

                    final user = await authManager.createAccountWithEmail(
                      context,
                      _model.emailTextFieldTextController.text,
                      _model.passwordTextFieldloTextController.text,
                    );
                    if (user == null) {
                      return;
                    }

                    await authManager.sendEmailVerification();

                    context.pushNamedAuth('HomePage', context.mounted);
                  },
                  text: FFLocalizations.of(context).getText(
                    'idja2o5g' /* Create Account */,
                  ),
                  options: FFButtonOptions(
                    height: 54.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(115.0, 0.0, 115.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3D9187),
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFFF4E6E6),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 10.0,
                    borderSide: BorderSide(
                      color: Color(0xFF3D9187),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.13, 0.87),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('Signup');
                  },
                  text: FFLocalizations.of(context).getText(
                    'njwssn10' /* Sign in with Social Media */,
                  ),
                  options: FFButtonOptions(
                    height: 54.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 80.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3D9187),
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Roboto',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 10.0,
                    borderSide: BorderSide(
                      color: Color(0xFF3D9187),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, 0.73),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2qplfirq' /* or */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF050505),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.19, 0.64),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('Login');
                  },
                  text: FFLocalizations.of(context).getText(
                    '0un71lic' /* Already have an account */,
                  ),
                  options: FFButtonOptions(
                    height: 54.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 80.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3D9187),
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Roboto',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 10.0,
                    borderSide: BorderSide(
                      color: Color(0xFF3D9187),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.14, 0.93),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qyap8667' /* By proceeding you also agree t... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF040404),
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.33),
                child: TextFormField(
                  controller: _model.passwordTextFieldlTextController,
                  focusNode: _model.passwordTextFieldlFocusNode,
                  autofocus: false,
                  obscureText: !_model.passwordTextFieldlVisibility,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      '62hrp1hy' /* Confirm Password */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).tfBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => safeSetState(
                        () => _model.passwordTextFieldlVisibility =
                            !_model.passwordTextFieldlVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.passwordTextFieldlVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                  validator: _model.passwordTextFieldlTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.22),
                child: TextFormField(
                  controller: _model.passwordTextFieldloTextController,
                  focusNode: _model.passwordTextFieldloFocusNode,
                  autofocus: false,
                  obscureText: !_model.passwordTextFieldloVisibility,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'ir172gn6' /* Password */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).tfBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => safeSetState(
                        () => _model.passwordTextFieldloVisibility =
                            !_model.passwordTextFieldloVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.passwordTextFieldloVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                  validator: _model.passwordTextFieldloTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
