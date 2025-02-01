import '/components/na_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    String? activePage,
  }) : this.activePage = activePage ?? 'Home';

  final String activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Current naBar items:
        //
        // Home
        // Cart
        // Orders
        // Wallet
        // Profile
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 25.0,
                  color: Color(0x1D000000),
                  offset: Offset(
                    0.0,
                    -8.0,
                  ),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.naBarItemModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: NaBarItemWidget(
                      actiePage: widget!.activePage,
                      currentItemName: 'Home',
                      unselectedIcon: Icon(
                        Icons.home_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      selectedIcon: Icon(
                        Icons.home,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      wrapWithModel(
                        model: _model.naBarItemModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: NaBarItemWidget(
                          actiePage: widget!.activePage,
                          currentItemName: 'Cart',
                          unselectedIcon: Icon(
                            Icons.shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          selectedIcon: Icon(
                            Icons.shopping_cart_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.ordersModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NaBarItemWidget(
                      actiePage: widget!.activePage,
                      currentItemName: 'Orders',
                      unselectedIcon: Icon(
                        Icons.document_scanner_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      selectedIcon: Icon(
                        Icons.document_scanner,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.walleModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NaBarItemWidget(
                      actiePage: widget!.activePage,
                      currentItemName: 'Wallet',
                      unselectedIcon: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      selectedIcon: Icon(
                        Icons.account_balance_wallet_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.profilModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NaBarItemWidget(
                      actiePage: widget!.activePage,
                      currentItemName: 'Profile',
                      unselectedIcon: Icon(
                        Icons.people_outline,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      selectedIcon: Icon(
                        Icons.people_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
