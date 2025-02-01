import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_method_item_model.dart';
export 'payment_method_item_model.dart';

class PaymentMethodItemWidget extends StatefulWidget {
  const PaymentMethodItemWidget({
    super.key,
    this.title,
    this.icon,
    bool? isDefault,
    this.photo,
    bool? showIcon,
  })  : this.isDefault = isDefault ?? false,
        this.showIcon = showIcon ?? false;

  final String? title;
  final Widget? icon;
  final bool isDefault;
  final String? photo;
  final bool showIcon;

  @override
  State<PaymentMethodItemWidget> createState() =>
      _PaymentMethodItemWidgetState();
}

class _PaymentMethodItemWidgetState extends State<PaymentMethodItemWidget> {
  late PaymentMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodItemModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.showIcon) widget!.icon!,
              ].divide(SizedBox(width: 8.0)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.title,
                    'p',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: Color(0xFF7BCED3),
                  icon: Icon(
                    Icons.arrow_forward,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
