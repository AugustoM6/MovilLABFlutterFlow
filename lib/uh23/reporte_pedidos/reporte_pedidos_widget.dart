import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'reporte_pedidos_model.dart';
export 'reporte_pedidos_model.dart';

class ReportePedidosWidget extends StatefulWidget {
  const ReportePedidosWidget({super.key});

  @override
  State<ReportePedidosWidget> createState() => _ReportePedidosWidgetState();
}

class _ReportePedidosWidgetState extends State<ReportePedidosWidget> {
  late ReportePedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportePedidosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FlutterFlowIconButton(
              borderRadius: 200.0,
              buttonSize: 40.0,
              fillColor: const Color(0xFF92D8E2),
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
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
                            Icons.chat,
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
                    'Juan Pablo Pérez Arroyo',
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
                      'Reporte pedidos',
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
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Enero',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Enero',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(8.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Febrero',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Febrero',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Marzo',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Marzo',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Abril',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Abril',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Mayo',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Mayo',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Junio',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Junio',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -9.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Julio',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Julio',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -9.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Agosto',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Agosto',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -9.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Setiembre',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Setiembre',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -13.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Octubre',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Octubre',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -13.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Noviembre',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Noviembre',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-10.0, -13.0),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await queryPedidosRecordOnce();

                            context.pushNamed(
                              'HistorialPedidos',
                              queryParameters: {
                                'mes': serializeParam(
                                  'Diciembre',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Diciembre',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
                        await actions.generarPDF();
                      },
                      text: 'Generar',
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
                          'HistorialPedidos',
                          queryParameters: {
                            'mes': serializeParam(
                              '',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Consultar',
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
