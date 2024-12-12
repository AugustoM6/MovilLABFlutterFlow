import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).ultramarine,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'InfoLab1': ParameterData.none(),
  'Contactenos': ParameterData.none(),
  'GuardarProductosLista': ParameterData.none(),
  'HistorialPedidosFALTABOTONPDF': (data) async => ParameterData(
        allParams: {
          'selectedMonth': getParameter<String>(data, 'selectedMonth'),
        },
      ),
  'InfoLab2': ParameterData.none(),
  'Conozcanos': ParameterData.none(),
  'AccesibilidadEIdioma': ParameterData.none(),
  'PedidosRecientes': ParameterData.none(),
  'MenuAdministrador': ParameterData.none(),
  'IndexProducto': ParameterData.none(),
  'Login': ParameterData.none(),
  'agregarProducto': ParameterData.none(),
  'PasswordOlvidado': ParameterData.none(),
  'Perfil': ParameterData.none(),
  'ConfiguracionCuenta': ParameterData.none(),
  'editarProducto': (data) async => ParameterData(
        allParams: {
          'paramProductos': await getDocumentParameter<ProductoRecord>(
              data, 'paramProductos', ProductoRecord.fromSnapshot),
        },
      ),
  'indexEmpleados': ParameterData.none(),
  'detallesEmpleado': (data) async => ParameterData(
        allParams: {
          'paramEmpleados': await getDocumentParameter<EmpleadosRecord>(
              data, 'paramEmpleados', EmpleadosRecord.fromSnapshot),
        },
      ),
  'indexServicio': ParameterData.none(),
  'agregarServicios': ParameterData.none(),
  'editarServicio': (data) async => ParameterData(
        allParams: {
          'paramServicio': await getDocumentParameter<ServiciosRecord>(
              data, 'paramServicio', ServiciosRecord.fromSnapshot),
        },
      ),
  'Home': ParameterData.none(),
  'ChaBot': ParameterData.none(),
  'editarEmpleado': (data) async => ParameterData(
        allParams: {
          'paramEmpleados': await getDocumentParameter<EmpleadosRecord>(
              data, 'paramEmpleados', EmpleadosRecord.fromSnapshot),
        },
      ),
  'Recordatorios': ParameterData.none(),
  'Notificaciones': ParameterData.none(),
  'VerCatalogoOLD': ParameterData.none(),
  'VerCatalogo': ParameterData.none(),
  'VerCatalogoPorCategoria': ParameterData.none(),
  'Promociones': ParameterData.none(),
  'ReportePedidosAdmin': (data) async => ParameterData(
        allParams: {
          'fecha': getParameter<DateTime>(data, 'fecha'),
          'selectedMonth': getParameter<DateTime>(data, 'selectedMonth'),
        },
      ),
  'ReportePedidosUsuario': (data) async => ParameterData(
        allParams: {
          'fecha': getParameter<DateTime>(data, 'fecha'),
          'selectedMonth': getParameter<DateTime>(data, 'selectedMonth'),
        },
      ),
  'Formulario': ParameterData.none(),
  'agregarEmpleado': ParameterData.none(),
  'indexPedidos': ParameterData.none(),
  'editarPedido': (data) async => ParameterData(
        allParams: {
          'paramPedidos': await getDocumentParameter<PedidosRecord>(
              data, 'paramPedidos', PedidosRecord.fromSnapshot),
        },
      ),
  'agregarPedido': ParameterData.none(),
  'detallesPedido': (data) async => ParameterData(
        allParams: {
          'paramPedidos': await getDocumentParameter<PedidosRecord>(
              data, 'paramPedidos', PedidosRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
