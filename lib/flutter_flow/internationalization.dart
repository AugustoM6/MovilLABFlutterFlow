import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // InfoLab1
  {
    'edevuccu': {
      'es': 'Horario:\n',
      'en': 'Schedule:',
    },
    'ju8lu7dx': {
      'es': 'De Lunes a Viernes\n',
      'en': 'Monday to Friday',
    },
    '4omp2u46': {
      'es': 'de 7am - 5pm',
      'en': 'from 7am - 5pm',
    },
    'r6qrh6x4': {
      'es': 'Dirección:\n',
      'en': 'Address:',
    },
    'yers8ym0': {
      'es':
          'Del Ice 50m N\nEdificio El Roble \nsegundo piso \nHeredia, 40101, \nCosta Rica.',
      'en':
          'Del Ice 50m N\nEl Roble Building\nsecond floor\nHeredia, 40101,\nCosta Rica.',
    },
    'bj3a1vvo': {
      'es': 'Sobre el laboratorio:\n',
      'en': 'About the laboratory:',
    },
    'diysiin8': {
      'es':
          'El Laboratorio Esencia Dental (AJ Dental Design) es un laboratorio dental especializado en crear prótesis dentales fijas de alta estética natural que se adaptan a las necesidades de cada paciente; ubicado en Heredia, Costa Rica, trabaja en estrecha colaboración con dentistas, ortodoncistas estéticos y prostodoncistas para ofrecer soluciones protésicas avanzadas. \n\nFue fundado el 17 de octubre del 2018, ha brindado 7 años de servicio en el área de la salud dental, catalogado como uno de los mejores laboratorios dentales y destacado por su compromiso como empresa con la excelencia y la atención al detalle en cada etapa del proceso.',
      'en':
          'Esencia Dental Laboratory (AJ Dental Design) is a dental laboratory specialized in creating highly aesthetic fixed dental prostheses that adapt to the needs of each patient; located in Heredia, Costa Rica, it works closely with dentists, aesthetic orthodontists and prosthodontists to offer advanced prosthetic solutions. \n\nIt was founded on October 17, 2018, and has provided 7 years of service in the area of dental health, listed as one of the best dental laboratories and noted for its commitment as a company to excellence and attention to detail at every stage of the process.',
    },
    'h9melw03': {
      'es': 'Ver local asociado',
      'en': 'See associated premises',
    },
    '4ug0jyih': {
      'es': 'Laboratorio Principal',
      'en': 'Main Laboratory',
    },
    'y6fca95k': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Contactenos
  {
    'p94tc1lp': {
      'es': 'TD. Javier Rojas Castaño \n Director',
      'en': 'TD. Javier Rojas Castaño \nDirector',
    },
    '3yk7zb72': {
      'es':
          'Comunicador Social - Periodista egresado de la Universidad de la Sabana, con 12 años de experiencia como ceramista dental de alta estética. Propietario de Esencia Dental en Costa Rica, especializado en prótesis fijas. Líder en Viax Dental Lab, experto en planeación de sonrisas y restauraciones cerámicas mínimamente invasivas, miembro de Ivoclar Vivadent en el uso de Zirconio Nexxzr+. Capacitado por destacados técnicos como Nondas Vlachopoulos y August Bruguera, y con participación en seminarios de Pascal Magne y Sidney Kina.',
      'en':
          'Social Communicator - Journalist graduated from the Universidad de la Sabana, with 12 years of experience as a highly aesthetic dental ceramist. Owner of Esencia Dental in Costa Rica, specialized in fixed prosthetics. Leader at Viax Dental Lab, expert in smile planning and minimally invasive ceramic restorations, member of Ivoclar Vivadent in the use of Zirconium Nexxzr+. Trained by leading technicians such as Nondas Vlachopoulos and August Bruguera, and with participation in seminars by Pascal Magne and Sidney Kina.',
    },
    'gft3qctx': {
      'es': 'Detalles de contacto',
      'en': 'Contact details',
    },
    'urqnmtnt': {
      'es': '+506 8727 - 1239',
      'en': '+506 8727 - 1239',
    },
    'gtk7xkez': {
      'es': 'Visítanos en Esencia Dental Costa Rica',
      'en': 'Visit us at Esencia Dental Costa Rica',
    },
    'tttnru7u': {
      'es': 'Síguenos en Instagram - Esencia Dental',
      'en': 'Follow us on Instagram - Dental Essence',
    },
    'ehg9x5s8': {
      'es': '¡Contáctenos!',
      'en': '',
    },
    'ogbshy1o': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // GuardarProductosLista
  {
    '2de19b8k': {
      'es': '¡En Esencia Dental, te ayudamos \na que vuelvas a sonreír! ',
      'en': '',
    },
    '91d6dpqw': {
      'es': 'Agregar',
      'en': '',
    },
    'of6dta64': {
      'es': 'Eliminar',
      'en': '',
    },
    'ztqvskpj': {
      'es': 'Lista de Deseos',
      'en': '',
    },
    'g5efq2fr': {
      'es': 'Home',
      'en': '',
    },
  },
  // HistorialPedidosFALTABOTONPDF
  {
    '5kbm5ihe': {
      'es': '',
      'en': 'NumPedido',
    },
    'ifyuo4cn': {
      'es': 'Generar',
      'en': '',
    },
    'aukp8zhb': {
      'es': 'Consultar',
      'en': '',
    },
    '79cepg43': {
      'es': 'Prueba',
      'en': '',
    },
    'tc7f0pk5': {
      'es': 'Historial de pedidos',
      'en': '',
    },
    'nz4zsi0c': {
      'es': 'Home',
      'en': '',
    },
  },
  // InfoLab2
  {
    '0fxrc1t6': {
      'es': 'Horario:\n',
      'en': '',
    },
    'qb35yxqu': {
      'es': 'De Lunes a Viernes\n',
      'en': '',
    },
    'p1jbevir': {
      'es': 'de 7am - 5pm',
      'en': '',
    },
    'cu2cn03o': {
      'es': 'Para más \ninformación:\n',
      'en': '',
    },
    'kh3qmut8': {
      'es': 'Visite nuestras\nredes sociales.',
      'en': '',
    },
    '38lfftop': {
      'es': 'Sobre el laboratorio:\n',
      'en': '',
    },
    '77ygfipw': {
      'es':
          'El Laboratorio Esencial Aligners es uno de nuestros socios, nuestra empresa hermana con la cual diseñamos alineadores dentales de altísima calidad. ',
      'en': '',
    },
    'ew5gdyo5': {
      'es': 'Laboratorio Asociado',
      'en': '',
    },
    'l2cyawv6': {
      'es': 'Home',
      'en': '',
    },
  },
  // Conozcanos
  {
    'lwitu7il': {
      'es':
          'En Esencia Dental nos caracterizamos por ser más que un equipo de profesionales comprometidos y especializados en técnica dental, somos una familia que busca devolver la sonrisa a sus pacientes.',
      'en': '',
    },
    '5to7d89q': {
      'es':
          '\"Manos expertas y el mejor equipo humano y tecnológico nos permite asegurarles la mejor calidad y los mejores tiempos de entrega. Hoy estamos desarrollando el tercer año desde que empezamos con dicho proceso y en la actualidad contamos con 14 empleados y un laboratorio completo con la capacidad de abarcar desde el punto inicial del proceso, que se llama “el modelo” e implica la impresión que se le toma al paciente. En nuestro negocio somos capaces de desarrollar todas las técnicas.\"',
      'en': '',
    },
    '4u4wg6d2': {
      'es': 'Equipo Humano en Esencia Dental\n',
      'en': '',
    },
    'gwsabrpp': {
      'es': '#SomosUnEquipo ',
      'en': '',
    },
    'bmrutvp9': {
      'es': '¡Conózcanos!',
      'en': '',
    },
    'pv4b85fj': {
      'es': 'Home',
      'en': '',
    },
  },
  // AccesibilidadEIdioma
  {
    'oe9di57t': {
      'es': 'Tamaño de texto',
      'en': '',
    },
    'sxaym312': {
      'es': 'Modo Claro / Oscuro',
      'en': '',
    },
    've5gd7d4': {
      'es': 'Elige tu idioma',
      'en': '',
    },
    'c2svg7c1': {
      'es': 'Cancelar',
      'en': '',
    },
    'f01gbn7c': {
      'es': 'Guardar',
      'en': '',
    },
    'f5cnme44': {
      'es': 'Accesibilidad e Idioma',
      'en': '',
    },
    't7ckvhdm': {
      'es': 'Home',
      'en': '',
    },
  },
  // PedidosRecientes
  {
    'zhdi935y': {
      'es': 'Recientes',
      'en': '',
    },
    '88q6ts4x': {
      'es': 'Número',
      'en': '',
    },
    'eb5znb43': {
      'es': 'Cliente',
      'en': '',
    },
    'jlyi2sbo': {
      'es': 'Fecha',
      'en': '',
    },
    'shhto855': {
      'es': 'Estado',
      'en': '',
    },
    'ech9ovxp': {
      'es': 'Actions',
      'en': '',
    },
    'b9xigbbe': {
      'es': 'Active',
      'en': '',
    },
    '7ses1vnp': {
      'es': 'Pedidos',
      'en': '',
    },
    't2gvr1ou': {
      'es': 'Home',
      'en': '',
    },
  },
  // MenuAdministrador
  {
    'craret79': {
      'es': 'Resumen de Pedidos',
      'en': '',
    },
    'dsikdemd': {
      'es': '12',
      'en': '',
    },
    'dracdyiu': {
      'es': 'Pedidos Activos',
      'en': '',
    },
    '7p0rf5nf': {
      'es': '8',
      'en': '',
    },
    'a9pq7wdh': {
      'es': 'En Proceso',
      'en': '',
    },
    'nt9wbt0h': {
      'es': '4',
      'en': '',
    },
    '0onryhrl': {
      'es': 'Completados',
      'en': '',
    },
    'buukx6g2': {
      'es': 'Pedidos del Mes',
      'en': '',
    },
    'py18nru5': {
      'es': 'Gestión de Pedidos',
      'en': '',
    },
    'dzmba3kz': {
      'es': 'Gestión de Productos',
      'en': '',
    },
    'ogkzr7oh': {
      'es': 'Reportes',
      'en': '',
    },
    'nae33p8b': {
      'es': 'Cerrar Sesión',
      'en': '',
    },
    '3wnrn19r': {
      'es': 'Administrador',
      'en': '',
    },
  },
  // IndexProducto
  {
    'c790vstk': {
      'es': 'AGREGAR',
      'en': '',
    },
    'rr5wyjkj': {
      'es': 'Editar',
      'en': '',
    },
    'vm2hm5a2': {
      'es': 'Eliminar',
      'en': '',
    },
    '9cf3qptz': {
      'es': 'Gestion de Productos',
      'en': '',
    },
    '25whn5s9': {
      'es': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'asutwzzz': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'oe7cf99x': {
      'es': 'Ingresa los siguientes datos.',
      'en': '',
    },
    'cf7l9skg': {
      'es': 'Correo electrónico ',
      'en': '',
    },
    'oer6598o': {
      'es': 'Contraseña',
      'en': '',
    },
    'mxbl3zc2': {
      'es': 'Confirmación de contraseña',
      'en': '',
    },
    'r99603ni': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'vw0farqr': {
      'es': 'o crea la cuenta con',
      'en': '',
    },
    'oes1qf72': {
      'es': 'Continua con google',
      'en': '',
    },
    '6hqp99bw': {
      'es': 'Continua con apple',
      'en': '',
    },
    '1ddmng1v': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    'xux8cifc': {
      'es': 'Bienvenido',
      'en': '',
    },
    'pqb495sf': {
      'es': 'Ingrese los siguientes datos',
      'en': '',
    },
    'ghcjay5s': {
      'es': 'Email',
      'en': '',
    },
    'xfwkf143': {
      'es': 'Password',
      'en': '',
    },
    'lhxfyxud': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    'qm6yfpt5': {
      'es': 'Or sign in with',
      'en': '',
    },
    'w1q93owp': {
      'es': 'Continua con Google',
      'en': '',
    },
    'hmraj5tb': {
      'es': 'Continua con apple',
      'en': '',
    },
    '7mzl8npv': {
      'es': 'Forgot Password?',
      'en': '',
    },
    'h5y6xaci': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarProducto
  {
    '3pkisd33': {
      'es': 'Cargar',
      'en': '',
    },
    'rqrmxkew': {
      'es': 'Nombre del producto',
      'en': '',
    },
    'tgjmz7ae': {
      'es': 'Descripcion',
      'en': '',
    },
    'cz2060vp': {
      'es': 'Departamento',
      'en': '',
    },
    '1t5cbmaq': {
      'es': 'Tecnico',
      'en': '',
    },
    'uzvbrofj': {
      'es': 'Categoria',
      'en': '',
    },
    'fir9v5v1': {
      'es': 'Cancelar',
      'en': '',
    },
    '6ewiylw8': {
      'es': 'Agregar',
      'en': '',
    },
    'hseykpb0': {
      'es': 'Gestion de Productos',
      'en': '',
    },
    '2018f8tq': {
      'es': 'Home',
      'en': '',
    },
  },
  // PasswordOlvidado
  {
    'njflrfgf': {
      'es': 'Back',
      'en': '',
    },
    'h35sncml': {
      'es': 'Olvidaste la contraseña',
      'en': '',
    },
    'vz2qurcn': {
      'es': 'Siempre mantén tu cuenta segura y no olvides actualizarla.',
      'en': '',
    },
    'l1io98rq': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado a su cuenta a continuación.  ',
      'en': '',
    },
    '1qohuj5l': {
      'es': 'Su dirección de correo electrónico...',
      'en': '',
    },
    '7lxncwqx': {
      'es': 'Ingrese su correo electrónico ',
      'en': '',
    },
    'xnqwrvww': {
      'es': 'Eviar enlance ',
      'en': '',
    },
    'smg4rdq4': {
      'es': 'Home',
      'en': '',
    },
  },
  // Perfil
  {
    'b5rjwg5y': {
      'es': 'Editar cuenta',
      'en': '',
    },
    'yl305dol': {
      'es': 'Accesibilidad',
      'en': '',
    },
    'miuzdowq': {
      'es': 'Notificaciones',
      'en': '',
    },
    'a3xpsv90': {
      'es': 'Lenguaje',
      'en': '',
    },
    'c43np712': {
      'es': 'Cerrar sesión',
      'en': '',
    },
    '2mz78m8v': {
      'es': 'Eliminar cuenta',
      'en': '',
    },
  },
  // ConfiguracionCuenta
  {
    'o0krnwyp': {
      'es': 'Configuración de cuenta',
      'en': '',
    },
    'u055erjx': {
      'es': 'Nombre',
      'en': '',
    },
    'it3c0yjz': {
      'es': 'TextField',
      'en': '',
    },
    'iatoo8v4': {
      'es': 'Edad',
      'en': '',
    },
    'iaj30ie5': {
      'es': 'TextField',
      'en': '',
    },
    'am29ttka': {
      'es': 'Dirrección',
      'en': '',
    },
    'giaxbqsa': {
      'es': 'TextField',
      'en': '',
    },
    'yzguaehi': {
      'es': 'Teléfono',
      'en': '',
    },
    'o1c8qk4j': {
      'es': 'TextField',
      'en': '',
    },
    '87d3z7rc': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'ol3emgjz': {
      'es': 'TextField',
      'en': '',
    },
    'chp0080i': {
      'es': 'Femenino',
      'en': '',
    },
    'kvew7m24': {
      'es': 'Masculino',
      'en': '',
    },
    'idkzd3pl': {
      'es': 'Actualizar',
      'en': '',
    },
    'rraf1i8d': {
      'es': 'Mi Cuenta',
      'en': '',
    },
  },
  // editarProducto
  {
    'tkjymx2l': {
      'es': 'Nombre del producto',
      'en': '',
    },
    'yl4ka7w4': {
      'es': 'Descripcion',
      'en': '',
    },
    '4p128i2b': {
      'es': 'Departamento',
      'en': '',
    },
    '4j13gluz': {
      'es': 'Tecnico',
      'en': '',
    },
    'xf52zwxx': {
      'es': 'Categoria',
      'en': '',
    },
    'efdp40yt': {
      'es': 'Cancelar',
      'en': '',
    },
    'gmcig2f1': {
      'es': 'Actualizar',
      'en': '',
    },
    'gr043whn': {
      'es': 'Gestion de Productos',
      'en': '',
    },
    'f1tkhdcu': {
      'es': 'Home',
      'en': '',
    },
  },
  // indexEmpleados
  {
    'iv5ygj30': {
      'es': 'AGREGAR',
      'en': '',
    },
    'aldqorvp': {
      'es': 'Editar',
      'en': '',
    },
    'qd968mjz': {
      'es': 'Eliminar',
      'en': '',
    },
    'hg3vcouh': {
      'es': 'Gestion de Empleados',
      'en': '',
    },
    'f1e2snq5': {
      'es': 'Home',
      'en': '',
    },
  },
  // detallesEmpleado
  {
    '5bmt3f5x': {
      'es': 'TextField',
      'en': '',
    },
    'q6rnnt0p': {
      'es': 'TextField',
      'en': '',
    },
    'sdcafxkz': {
      'es': 'TextField',
      'en': '',
    },
    'm8w560qh': {
      'es': 'TextField',
      'en': '',
    },
    '7bflktpz': {
      'es': 'TextField',
      'en': '',
    },
    'qkn93dr4': {
      'es': 'TextField',
      'en': '',
    },
    'mvyvyvam': {
      'es': 'Gestion de Empleados',
      'en': '',
    },
    '2mrlgf3o': {
      'es': 'Home',
      'en': '',
    },
  },
  // indexServicio
  {
    'pknmo7pc': {
      'es': 'AGREGAR',
      'en': '',
    },
    'c3l0r780': {
      'es': 'Editar',
      'en': '',
    },
    'rcstd724': {
      'es': 'Eliminar',
      'en': '',
    },
    'd3rs9u7p': {
      'es': 'Gestion de Servicios',
      'en': '',
    },
    'ceurpgo6': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarServicios
  {
    'aefeefhq': {
      'es': 'Nombre del servicio',
      'en': '',
    },
    'tuq7kp7b': {
      'es': 'Descripcion',
      'en': '',
    },
    'ry5fmrnm': {
      'es': 'Precio',
      'en': '',
    },
    'x389uit8': {
      'es': 'Empleado',
      'en': '',
    },
    'e5qt4f29': {
      'es': 'Cancelar',
      'en': '',
    },
    'y1t18ffa': {
      'es': 'Agregar',
      'en': '',
    },
    'wed6e2sn': {
      'es': 'Gestion de Productos',
      'en': '',
    },
    'xc9knmhm': {
      'es': 'Home',
      'en': '',
    },
  },
  // editarServicio
  {
    '7opge6uy': {
      'es': 'Nombre del servicio',
      'en': '',
    },
    'hldjlpbh': {
      'es': 'Descripcion',
      'en': '',
    },
    '61h7mdzm': {
      'es': 'Precio',
      'en': '',
    },
    'z593rl94': {
      'es': 'Estado',
      'en': '',
    },
    'o5kt3jm8': {
      'es': 'Cancelar',
      'en': '',
    },
    'c66171sh': {
      'es': 'Actualizar',
      'en': '',
    },
    '875e40dx': {
      'es': 'Gestion de Servicios',
      'en': '',
    },
    '5ejx2ate': {
      'es': 'Home',
      'en': '',
    },
  },
  // Home
  {
    'kysbfh16': {
      'es': '¡Bienvenidx a la app!',
      'en': 'Welcome to the app!',
    },
    'ev1w618o': {
      'es': 'Menú',
      'en': 'Menu',
    },
    'uu4112kc': {
      'es': 'Productos y Servicios',
      'en': 'Products and Services',
    },
    'm1vfrtfc': {
      'es': 'Historial de pedidos',
      'en': 'Order History',
    },
    '71z8y084': {
      'es': 'Sobre el Laboratorio ED',
      'en': 'About ED Laboratory',
    },
    '63hkglem': {
      'es': 'Configuración de la cuenta',
      'en': 'Account Settings',
    },
    '0yf107ll': {
      'es': 'Lista de deseos',
      'en': 'Wishlist',
    },
    'wq4s0yp0': {
      'es': 'Contáctenos',
      'en': 'Contact us',
    },
    'tjfbgr01': {
      'es': 'Realizar Pedido',
      'en': 'Place Order',
    },
    '62lfjfb6': {
      'es': 'Menú  Administrador',
      'en': 'Place Order',
    },
    '4s5xgmxz': {
      'es': 'Cerrar Sesión',
      'en': 'Close Session',
    },
    'hmbufnz5': {
      'es': 'Eliminar Cuenta',
      'en': 'Delete Account',
    },
  },
  // ChaBot
  {
    'xvjtcjyo': {
      'es': 'ChatBot',
      'en': 'ChatBot',
    },
    'knhn7xdb': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editarEmpleado
  {
    'aicmdm3n': {
      'es': 'TextField',
      'en': '',
    },
    'e62b5ca7': {
      'es': 'TextField',
      'en': '',
    },
    'ghsjyjw0': {
      'es': 'TextField',
      'en': '',
    },
    'coluhmyu': {
      'es': 'TextField',
      'en': '',
    },
    'iovhfo2t': {
      'es': 'TextField',
      'en': '',
    },
    'gy1070n5': {
      'es': 'FECHA DE CONTRATACIÓN:',
      'en': '',
    },
    '5deafnss': {
      'es': 'Cancelar',
      'en': '',
    },
    'ajx0bwod': {
      'es': 'Actualizar',
      'en': '',
    },
    'qkvhf8lc': {
      'es': 'Gestion de Empleados',
      'en': '',
    },
    'e37r9jco': {
      'es': 'Home',
      'en': '',
    },
  },
  // Recordatorios
  {
    'tge26s5n': {
      'es': '¿Desea modificar un rocordatorio existente?',
      'en': 'Do you want to modify an existing reminder?',
    },
    'fbzs6vj1': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'm1obdrcz': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    '7jkqptd7': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'b548t45n': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'g8pkxpw1': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'wmbndr7r': {
      'es': 'Configurar un nuevo recordatorio',
      'en': 'Set a new reminder',
    },
    'sg36wgll': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'tktigcj3': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'mfbnp8z2': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'vf9h5gqp': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '4us9epcw': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '5hpxf0fk': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'qs1xih45': {
      'es': 'Guardar',
      'en': 'Keep',
    },
    'aj9w21ig': {
      'es': 'Recordatorio',
      'en': 'Reminder',
    },
    '75rxv9f7': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Notificaciones
  {
    'i11gdgbn': {
      'es': 'Desactivar todas las notificaciones',
      'en': 'Disable all notifications',
    },
    '98x0zgwc': {
      'es': 'Activar notificaciones críticas',
      'en': 'Enable critical notifications',
    },
    'bh4et3j6': {
      'es': 'Configurar un nuevo recordatorio',
      'en': 'Set a new reminder',
    },
    'oq7rl0k9': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'gwszih58': {
      'es': 'Guardar',
      'en': 'Keep',
    },
    'z9aowxjh': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    '1u859o1e': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // VerCatalogoOLD
  {
    'lanqvcgb': {
      'es': 'Blanqueamiento',
      'en': '',
    },
    'k3clch6m': {
      'es': 'Coronas',
      'en': '',
    },
    'y5c70d15': {
      'es': 'Carillas',
      'en': '',
    },
    'hqfgsfaf': {
      'es': 'Solo modelos de resina',
      'en': '',
    },
    'gbgd6e0n': {
      'es': 'Incrustacion',
      'en': '',
    },
    '2n5p8uf2': {
      'es': 'Puentes',
      'en': '',
    },
    'k1qffbtq': {
      'es': 'Otros',
      'en': '',
    },
    'n7sy6b0z': {
      'es': 'Select...',
      'en': '',
    },
    'a3jewg0o': {
      'es': 'Search...',
      'en': '',
    },
    'j0ztcb6r': {
      'es': 'Agregar',
      'en': '',
    },
    '28xjl57h': {
      'es': 'Catalogo de Productos',
      'en': '',
    },
    '43ek9c10': {
      'es': 'Home',
      'en': '',
    },
  },
  // VerCatalogo
  {
    '4ri87aj0': {
      'es': 'Catálogo de Productos',
      'en': '',
    },
    'i71hyqcu': {
      'es': 'Home',
      'en': '',
    },
  },
  // VerCatalogoPorCategoria
  {
    '8z3v4kuz': {
      'es': 'Blanqueamiento',
      'en': '',
    },
    'o7dgge10': {
      'es': 'Coronas',
      'en': '',
    },
    'ulxsp3ab': {
      'es': 'Carillas',
      'en': '',
    },
    '1fgkb2l2': {
      'es': 'Solo modelos de resina',
      'en': '',
    },
    '6qwb64fv': {
      'es': 'Incrustacion',
      'en': '',
    },
    '54kf6w0z': {
      'es': 'Puentes',
      'en': '',
    },
    'd80h426l': {
      'es': 'Otros',
      'en': '',
    },
    'idd4vmph': {
      'es': 'Filtrar por categoría...',
      'en': '',
    },
    'dnm9b533': {
      'es': 'Search...',
      'en': '',
    },
    'pbz5fqby': {
      'es': '¡En Esencia Dental, te ayudaremos\na que vuelvas a sonreír!',
      'en': '',
    },
    'tswratf5': {
      'es': 'Atrás',
      'en': '',
    },
    'svqa74bh': {
      'es': 'Catálogo de Productos',
      'en': '',
    },
    'igy1qxlm': {
      'es': 'Home',
      'en': '',
    },
  },
  // Promociones
  {
    'mf6pkmmy': {
      'es': 'Aplicar',
      'en': '',
    },
    's1dyllf5': {
      'es': 'Promociones',
      'en': '',
    },
    'i88qlbah': {
      'es': 'Home',
      'en': '',
    },
  },
  // ReportePedidosAdmin
  {
    '1av6m3gq': {
      'es': 'Pedidos',
      'en': '',
    },
    'h98myreq': {
      'es': 'Reportes',
      'en': '',
    },
    '90x5volh': {
      'es': 'Calendario de Pedidos',
      'en': '',
    },
    'x472t4ad': {
      'es': 'Enero',
      'en': '',
    },
    'sh5ldrrf': {
      'es': 'Febrero',
      'en': '',
    },
    'ddg9mxpq': {
      'es': 'Marzo',
      'en': '',
    },
    'j2hhjct0': {
      'es': 'Abril',
      'en': '',
    },
    'svb8gemn': {
      'es': 'Mayo',
      'en': '',
    },
    'xd5sr8y3': {
      'es': 'Junio',
      'en': '',
    },
    'xzv2u8ak': {
      'es': 'Julio',
      'en': '',
    },
    'xt4hwfha': {
      'es': 'Agosto',
      'en': '',
    },
    'kuylxsfc': {
      'es': 'Septiembre',
      'en': '',
    },
    'xhe1fku8': {
      'es': 'Octubre',
      'en': '',
    },
    'kkbo9xa1': {
      'es': 'Noviembre',
      'en': '',
    },
    'y6d16crb': {
      'es': 'Diciembre',
      'en': '',
    },
    'ah9d884r': {
      'es': 'Generar PDF',
      'en': '',
    },
    '0t6ho9pl': {
      'es': 'Consultar',
      'en': '',
    },
  },
  // ReportePedidosUsuario
  {
    'wtjwa8my': {
      'es': 'Pedidos',
      'en': '',
    },
    'xan4da87': {
      'es': 'Reportes',
      'en': '',
    },
    'cq10z57e': {
      'es': 'Calendario de Pedidos',
      'en': '',
    },
    'vcwl9vut': {
      'es': 'Enero',
      'en': '',
    },
    'ip25j9pg': {
      'es': 'Febrero',
      'en': '',
    },
    '0ehe8l60': {
      'es': 'Marzo',
      'en': '',
    },
    'ohc0vg7n': {
      'es': 'Abril',
      'en': '',
    },
    'nv43sq6g': {
      'es': 'Mayo',
      'en': '',
    },
    '5fjlddjb': {
      'es': 'Junio',
      'en': '',
    },
    '3x7m5s1h': {
      'es': 'Julio',
      'en': '',
    },
    'ff44cwte': {
      'es': 'Agosto',
      'en': '',
    },
    'va23mr97': {
      'es': 'Septiembre',
      'en': '',
    },
    'epu1h63a': {
      'es': 'Octubre',
      'en': '',
    },
    'bxpihw52': {
      'es': 'Noviembre',
      'en': '',
    },
    'f9ldbjgp': {
      'es': 'Diciembre',
      'en': '',
    },
    'xmq8u9k6': {
      'es': 'Generar PDF',
      'en': '',
    },
    'oz0tj9xg': {
      'es': 'Consultar',
      'en': '',
    },
  },
  // Formulario
  {
    '8m0wqcbr': {
      'es': 'Esencia Dental',
      'en': 'Dental Essence',
    },
    'q30uoq6u': {
      'es': 'Tel: +506 2222-3333',
      'en': 'Tel: +506 2222-3333',
    },
    'ph1ntrnm': {
      'es': 'info@esenciadental.com',
      'en': 'info@esenciadental.com',
    },
    'o5z9b2vr': {
      'es': 'Información del Paciente',
      'en': 'Patient Information',
    },
    'hvky9jy3': {
      'es': 'Nombre del Doctor',
      'en': 'Doctor\'s Name',
    },
    'mfxtkzn0': {
      'es': 'Paciente',
      'en': 'Patient',
    },
    'lzvlx2z8': {
      'es': 'Edad',
      'en': 'Age',
    },
    'oh3hwlpi': {
      'es': 'Masculino',
      'en': 'Male',
    },
    'hwzgcec1': {
      'es': 'Femenino',
      'en': 'Female',
    },
    'v2tpggij': {
      'es': 'Recursos',
      'en': 'Resources',
    },
    'wuru418b': {
      'es': 'Impresión superior',
      'en': 'Top print',
    },
    'tudpiur0': {
      'es': 'Impresión inferior',
      'en': 'Bottom print',
    },
    '3amplunc': {
      'es': 'Antagonista',
      'en': 'Antagonist',
    },
    'zthm14e8': {
      'es': 'Arco facial',
      'en': 'Facebow',
    },
    'bo2plh30': {
      'es': 'Pilares',
      'en': 'Pillars',
    },
    'ftyfy2ja': {
      'es': 'Fotos',
      'en': 'Photos',
    },
    '4akyi49b': {
      'es': 'Otros recursos',
      'en': 'Other resources',
    },
    '46tq3s3g': {
      'es': 'Tipo de Trabajo',
      'en': 'Type of Work',
    },
    'x2lecbiw': {
      'es': 'Coronas',
      'en': 'Crowns',
    },
    'tarllnh9': {
      'es': 'Incrutación',
      'en': 'Embedding',
    },
    '2xqoi400': {
      'es': 'Carillas',
      'en': 'Veneers',
    },
    '0ccuwgp3': {
      'es': 'Puentes',
      'en': 'Bridges',
    },
    'f4byjzvp': {
      'es': 'Otros trabajos',
      'en': 'Other works',
    },
    'mg2osepe': {
      'es': 'Material y Línea',
      'en': 'Material and Line',
    },
    'duyb9kn9': {
      'es': 'Premium',
      'en': 'Premium',
    },
    '33v4exl4': {
      'es': 'Estándar',
      'en': 'Standard',
    },
    '6jcnld9a': {
      'es': 'Clasic',
      'en': 'Classic',
    },
    '0dfrke26': {
      'es': 'Zr',
      'en': 'Zr',
    },
    '1koc6jio': {
      'es': 'Metal Porcelana',
      'en': 'Metal Porcelain',
    },
    '143lgrzg': {
      'es': 'Emax',
      'en': 'Emax',
    },
    '497wqjr7': {
      'es': 'Información de Implantes',
      'en': 'Implant Information',
    },
    'xvrtooxp': {
      'es': 'Marca',
      'en': 'Brand',
    },
    'c4g0su99': {
      'es': 'Número de plataforma',
      'en': 'Platform number',
    },
    'xobti20r': {
      'es': 'Color y Acabado',
      'en': 'Color and Finish',
    },
    'k741ld1x': {
      'es': 'Color del muñón',
      'en': 'Stump color',
    },
    '517bcdwx': {
      'es': 'Color final',
      'en': 'Final color',
    },
    'kbj27q8z': {
      'es': 'Alta',
      'en': 'High',
    },
    'va6ckhyt': {
      'es': 'Media',
      'en': 'Average',
    },
    '7x63q2lf': {
      'es': 'Baja',
      'en': 'Low',
    },
    '1dfvn0tk': {
      'es': 'Observaciones',
      'en': 'Observations',
    },
    'ciu64o05': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'ty0gzmg4': {
      'es': 'Enviar Solicitud',
      'en': 'Send Request',
    },
    'p6or509x': {
      'es': 'Ingres su nombre ',
      'en': '',
    },
    'brbhdb5a': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3xq6ydwz': {
      'es': 'Por favor ingrese e nombre del paciente',
      'en': '',
    },
    '0ta7z86h': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ukyk3wov': {
      'es': 'Ingrese la edad ',
      'en': '',
    },
    't4lrd6f9': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vudv8899': {
      'es': 'Field is required',
      'en': '',
    },
    'wyh6ngkl': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'skg6n834': {
      'es': 'Field is required',
      'en': '',
    },
    'anjsplv4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '39mfg4a5': {
      'es': 'In  la  marca ',
      'en': '',
    },
    'i9fcu6h9': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'crwzc61o': {
      'es': 'Ingrese el numero de plataforma ',
      'en': '',
    },
    '3psqc737': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yv7cj1zb': {
      'es': 'Ingrese el color del Muñon',
      'en': '',
    },
    'xzlt3u4g': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'mirywcic': {
      'es': 'Ingrese el color final',
      'en': '',
    },
    'm7ds6kus': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fc5tah2x': {
      'es': 'Field is required',
      'en': '',
    },
    'p5ybi0gq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ratptpzq': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // agregarEmpleado
  {
    'i0fpv439': {
      'es': 'Cargar',
      'en': '',
    },
    'ayyep71y': {
      'es': 'Nombre ',
      'en': '',
    },
    'spca03ia': {
      'es': 'Email',
      'en': '',
    },
    'zqh81mpw': {
      'es': 'Telefono',
      'en': '',
    },
    'sm67bomj': {
      'es': 'Departamento',
      'en': '',
    },
    'hxxz8hkh': {
      'es': 'Estado',
      'en': '',
    },
    '8hv59a31': {
      'es': 'FECHA DE CONTRATACIÓN:',
      'en': '',
    },
    'wluhrhor': {
      'es': 'Cancelar',
      'en': '',
    },
    'ue4v7sbh': {
      'es': 'Agregar',
      'en': '',
    },
    'cq6jouvp': {
      'es': 'Gestion de Empleados',
      'en': '',
    },
    'uswtuqg0': {
      'es': 'Home',
      'en': '',
    },
  },
  // indexPedidos
  {
    'ax02bkyu': {
      'es': 'AGREGAR',
      'en': '',
    },
    '4gj0y9zw': {
      'es': 'Editar',
      'en': '',
    },
    'hg2724ap': {
      'es': 'Eliminar',
      'en': '',
    },
    'ih7f86dm': {
      'es': 'Detalles',
      'en': '',
    },
    '7v306w4j': {
      'es': 'Gestion de Pedidos',
      'en': '',
    },
    'bnlslorb': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editarPedido
  {
    'fkikivgd': {
      'es': 'Nombre del pedido',
      'en': '',
    },
    'ybm8hzka': {
      'es': 'FECHA DE SOLICITUD DEL PEDIDO:',
      'en': '',
    },
    'vec3f34l': {
      'es': 'Tecnico',
      'en': '',
    },
    'qlhtq2kl': {
      'es': 'Estado',
      'en': '',
    },
    '9e5bskmh': {
      'es': 'Cancelar',
      'en': '',
    },
    '44an8ap1': {
      'es': 'Actualizar',
      'en': '',
    },
    'lbz64o52': {
      'es': 'Gestion de Pedidos',
      'en': '',
    },
    'goli5z89': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarPedido
  {
    '1ez1nrua': {
      'es': 'Nombre del pedido',
      'en': '',
    },
    '5enl868h': {
      'es': 'FECHA DE SOLICITUD DEL PEDIDO:',
      'en': '',
    },
    'e1y33jo5': {
      'es': 'Tecnico',
      'en': '',
    },
    'yban2dl4': {
      'es': 'Estado',
      'en': '',
    },
    'tzjpzav3': {
      'es': 'Cancelar',
      'en': '',
    },
    '1iuhewgf': {
      'es': 'Agregar',
      'en': '',
    },
    '7ohah207': {
      'es': 'Gestion de Pedidos',
      'en': '',
    },
    '18iurgng': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // detallesPedido
  {
    'caemf3ym': {
      'es': 'Nombre del pedido',
      'en': '',
    },
    'b1osyd8h': {
      'es': 'Nombre del pedido',
      'en': '',
    },
    'ht4dg9wz': {
      'es': 'Tecnico',
      'en': '',
    },
    'r6pl1qrd': {
      'es': 'Estado',
      'en': '',
    },
    'y9dmxhtk': {
      'es': 'Gestion de Pedidos',
      'en': '',
    },
    'c4vue3so': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'pvbpctp9': {
      'es': '',
      'en': '',
    },
    '5k09qpyc': {
      'es': '',
      'en': '',
    },
    'mc7n40e9': {
      'es': '',
      'en': '',
    },
    'xv0dxec4': {
      'es': '',
      'en': '',
    },
    'iv3frsi9': {
      'es': '',
      'en': '',
    },
    'r3qzh0wr': {
      'es': '',
      'en': '',
    },
    'vw2ochhw': {
      'es': '',
      'en': '',
    },
    'gu0vf0rm': {
      'es': '',
      'en': '',
    },
    '7y7080ef': {
      'es': '',
      'en': '',
    },
    's950ol6t': {
      'es': '',
      'en': '',
    },
    'oozrpaqf': {
      'es': '',
      'en': '',
    },
    '0dv4ru9p': {
      'es': '',
      'en': '',
    },
    'y3yxzshf': {
      'es': '',
      'en': '',
    },
    'i3jyeohw': {
      'es': '',
      'en': '',
    },
    '3cth0vmb': {
      'es': '',
      'en': '',
    },
    '5v26i8qg': {
      'es': '',
      'en': '',
    },
    '5rvng5ga': {
      'es': '',
      'en': '',
    },
    '7q2fjh4r': {
      'es': '',
      'en': '',
    },
    '88tlcphp': {
      'es': '',
      'en': '',
    },
    '0gp0ko7g': {
      'es': '',
      'en': '',
    },
    '99cdjiet': {
      'es': '',
      'en': '',
    },
    'b34k15mu': {
      'es': '',
      'en': '',
    },
    'ssocc3y8': {
      'es': '',
      'en': '',
    },
    '7poy96qm': {
      'es': '',
      'en': '',
    },
    'ktrhj18f': {
      'es': '',
      'en': '',
    },
    'r5xpxiiy': {
      'es': '',
      'en': '',
    },
    'fxn2ehtu': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
