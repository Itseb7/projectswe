import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'applepay_model.dart';
export 'applepay_model.dart';

class ApplepayWidget extends StatefulWidget {
  const ApplepayWidget({super.key});

  @override
  State<ApplepayWidget> createState() => _ApplepayWidgetState();
}

class _ApplepayWidgetState extends State<ApplepayWidget> {
  late ApplepayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplepayModel());

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
        appBar: AppBar(
          backgroundColor: Color(0xFF3D9187),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              FFIcons.karrowLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('PaymentMethods');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'b04bvfvh' /* back */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.22),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'thoa0prq' /*  "Apple Pay is currently unava... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF0B0B0B),
                    letterSpacing: 0.0,
                    shadows: [
                      Shadow(
                        color: Color(0xFF831928),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'dl61w2sm' /* Pleas try another Payment Meth... */,
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    letterSpacing: 0.0,
                    shadows: [
                      Shadow(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 7.0,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.08, -0.82),
                child: Icon(
                  Icons.apple_sharp,
                  color: Colors.black,
                  size: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
