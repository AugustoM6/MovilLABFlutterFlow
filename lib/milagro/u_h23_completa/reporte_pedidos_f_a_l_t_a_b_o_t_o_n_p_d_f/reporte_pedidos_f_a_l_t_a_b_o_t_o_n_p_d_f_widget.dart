import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'reporte_pedidos_f_a_l_t_a_b_o_t_o_n_p_d_f_model.dart';
export 'reporte_pedidos_f_a_l_t_a_b_o_t_o_n_p_d_f_model.dart';

class ReportePedidosFALTABOTONPDFWidget extends StatefulWidget {
  const ReportePedidosFALTABOTONPDFWidget({
    super.key,
    required this.mes,
    this.fecha,
    this.selectedMonth,
  });

  final String? mes;
  final DateTime? fecha;
  final DateTime? selectedMonth;

  @override
  State<ReportePedidosFALTABOTONPDFWidget> createState() =>
      _ReportePedidosFALTABOTONPDFWidgetState();
}

class _ReportePedidosFALTABOTONPDFWidgetState
    extends State<ReportePedidosFALTABOTONPDFWidget> {
  late ReportePedidosFALTABOTONPDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportePedidosFALTABOTONPDFModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
            child: FlutterFlowIconButton(
              borderRadius: 30.0,
              buttonSize: 30.0,
              fillColor: FlutterFlowTheme.of(context).secondary,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('Home');
              },
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.asset(
                        'assets/images/OIP.jpg',
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 200.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).tertiary,
                          icon: Icon(
                            Icons.help_center_outlined,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'qtn88dqo' /* Juan Pablo Pérez Arroyo */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(200.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.network(
                        'https://png.pngtree.com/png-vector/20190504/ourlarge/pngtree-report-icon-design-png-image_1018828.jpg',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '5qs46woe' /* Reporte pedidos */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: widget.selectedMonth?.toString(),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '01',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'fdqvxsga' /* Enero */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '02',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '0j1xf420' /* Febrero */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '03',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'gtfv6lc5' /* Marzo */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '04',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '4djhx21k' /* Abril */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '05',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'l3yhpzf6' /* Mayo */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '06',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '8kk45azp' /* Junio */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '07',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'nkr469ts' /* Julio */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '08',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'c45kk4zf' /* Agosto */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '09',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'ng7gs6uh' /* Setiembre */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '10',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '9k4tfb1q' /* Octubre */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "M",
                                          widget.fecha,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '11',
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'zlxtwrf6' /* Noviembre */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder<List<FormularioRecord>>(
                          stream: queryFormularioRecord(
                            queryBuilder: (formularioRecord) =>
                                formularioRecord.where(
                              'fecha',
                              isEqualTo: dateTimeFormat(
                                "M",
                                widget.selectedMonth,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).ultramarine,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FormularioRecord> buttonFormularioRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonFormularioRecord =
                                buttonFormularioRecordList.isNotEmpty
                                    ? buttonFormularioRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'HistorialPedidosFALTABOTONPDF',
                                  queryParameters: {
                                    'selectedMonth': serializeParam(
                                      dateTimeFormat(
                                        "M",
                                        widget.fecha,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'lxu01e9g' /* Diciembre */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await actions.exportCustomDataToPdf();
                      },
                      text: FFLocalizations.of(context).getText(
                        'e9jlje35' /* Generar */,
                      ),
                      icon: const Icon(
                        Icons.picture_as_pdf,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'HistorialPedidosFALTABOTONPDF',
                          queryParameters: {
                            'selectedMonth': serializeParam(
                              widget.mes,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'gecw9dqc' /* Consultar */,
                      ),
                      icon: const Icon(
                        Icons.cloud_sync_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
