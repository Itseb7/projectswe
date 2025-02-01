import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shipping_item_radio_b_tn_model.dart';
export 'shipping_item_radio_b_tn_model.dart';

class ShippingItemRadioBTnWidget extends StatefulWidget {
  const ShippingItemRadioBTnWidget({
    super.key,
    required this.addressName,
    required this.address,
    required this.isDeafult,
    required this.addressRef,
  });

  final String? addressName;
  final String? address;
  final bool? isDeafult;
  final DocumentReference? addressRef;

  @override
  State<ShippingItemRadioBTnWidget> createState() =>
      _ShippingItemRadioBTnWidgetState();
}

class _ShippingItemRadioBTnWidgetState
    extends State<ShippingItemRadioBTnWidget> {
  late ShippingItemRadioBTnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingItemRadioBTnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).pageViewDots,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF398DEF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF397AEF),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.directions_bus_rounded,
                            color: Color(0xFFF2EDED),
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zcgwtxr3' /* Blue Route */,
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cdiayd09' /* الدار البيضاء-البنك الاول */,
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Stack(
                children: [
                  if (widget!.isDeafult ?? true)
                    Icon(
                      FFIcons.kcheckboxChecked,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  if (!widget!.isDeafult!)
                    Icon(
                      Icons.open_in_full_outlined,
                      color: FlutterFlowTheme.of(context).pageViewDots,
                      size: 24.0,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
