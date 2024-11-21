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
      'en': '',
    },
    'ju8lu7dx': {
      'es': 'De Lunes a Viernes\n',
      'en': '',
    },
    '4omp2u46': {
      'es': 'de 7am - 5pm',
      'en': '',
    },
    'r6qrh6x4': {
      'es': 'Dirección:\n',
      'en': '',
    },
    'yers8ym0': {
      'es':
          'Del Ice 50m N\nEdificio El Roble \nsegundo piso \nHeredia, 40101, \nCosta Rica.',
      'en': '',
    },
    'bj3a1vvo': {
      'es': 'Sobre el laboratorio:\n',
      'en': '',
    },
    'diysiin8': {
      'es':
          'El Laboratorio Esencia Dental (AJ Dental Design) es un laboratorio dental especializado en crear prótesis dentales fijas de alta estética natural que se adaptan a las necesidades de cada paciente; ubicado en Heredia, Costa Rica, trabaja en estrecha colaboración con dentistas, ortodoncistas estéticos y prostodoncistas para ofrecer soluciones protésicas avanzadas. \n\nFue fundado el 17 de octubre del 2018, ha brindado 7 años de servicio en el área de la salud dental, catalogado como uno de los mejores laboratorios dentales y destacado por su compromiso como empresa con la excelencia y la atención al detalle en cada etapa del proceso.',
      'en': '',
    },
    'h9melw03': {
      'es': 'Ver local asociado',
      'en': '',
    },
    '4ug0jyih': {
      'es': 'Laboratorio Principal',
      'en': '',
    },
    'y6fca95k': {
      'es': 'Home',
      'en': '',
    },
  },
  // VerCatalogo
  {
    'a0twvkp7': {
      'es': 'Catálogo de productos',
      'en': '',
    },
    't21jktug': {
      'es': 'Option 1',
      'en': '',
    },
    'gz5oqr31': {
      'es': 'Option 2',
      'en': '',
    },
    'nssqltnn': {
      'es': 'Option 3',
      'en': '',
    },
    '0ton6wry': {
      'es': 'Filtrar por categoría',
      'en': '',
    },
    '849i73cd': {
      'es': 'Search...',
      'en': '',
    },
    'w1fof9wr': {
      'es': 'Blanqueamiento dental',
      'en': '',
    },
    '6y9gbat5': {
      'es': '¡En Esencia Dental, te ayudamos\n a que vuelvas a sonreír!\"',
      'en': '',
    },
    'nqus51t3': {
      'es': 'Eliminar',
      'en': '',
    },
    'i88qlbah': {
      'es': 'Home',
      'en': '',
    },
  },
  // Contactenos
  {
    'p94tc1lp': {
      'es': 'TD. Javier Rojas Castaño \n Director',
      'en': '',
    },
    '3yk7zb72': {
      'es':
          'Comunicador Social - Periodista egresado de la Universidad de la Sabana, con 12 años de experiencia como ceramista dental de alta estética. Propietario de Esencia Dental en Costa Rica, especializado en prótesis fijas. Líder en Viax Dental Lab, experto en planeación de sonrisas y restauraciones cerámicas mínimamente invasivas, miembro de Ivoclar Vivadent en el uso de Zirconio Nexxzr+. Capacitado por destacados técnicos como Nondas Vlachopoulos y August Bruguera, y con participación en seminarios de Pascal Magne y Sidney Kina.',
      'en': '',
    },
    'gft3qctx': {
      'es': 'Detalles de contacto',
      'en': '',
    },
    'urqnmtnt': {
      'es': '+506 8727 - 1239',
      'en': '',
    },
    'gtk7xkez': {
      'es': 'Visítanos en Esencia Dental Costa Rica',
      'en': '',
    },
    'tttnru7u': {
      'es': 'Síguenos en Instagram - Esencia Dental',
      'en': '',
    },
    't3kjcbcc': {
      'es': '¡Contáctenos!',
      'en': '',
    },
    'ogbshy1o': {
      'es': 'Home',
      'en': '',
    },
  },
  // GuardarProductosLista
  {
    'oldd4cuv': {
      'es': 'Coronas y Carillas EMAX',
      'en': '',
    },
    'nzutsiw4': {
      'es': 'Corona Provisional en PMMA',
      'en': '',
    },
    'vfqlhig9': {
      'es': 'Blanqueamiento dental',
      'en': '',
    },
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
  // ReportePedidos
  {
    'qtn88dqo': {
      'es': 'Juan Pablo Pérez Arroyo',
      'en': '',
    },
    '5qs46woe': {
      'es': 'Reporte pedidos',
      'en': '',
    },
    'fdqvxsga': {
      'es': 'Enero',
      'en': '',
    },
    '0j1xf420': {
      'es': 'Febrero',
      'en': '',
    },
    'gtfv6lc5': {
      'es': 'Marzo',
      'en': '',
    },
    '9qtbp4fx': {
      'es': 'Abril',
      'en': '',
    },
    '0eg8ssup': {
      'es': 'Mayo',
      'en': '',
    },
    'kk1ze7gc': {
      'es': 'Junio',
      'en': '',
    },
    '9escjjfb': {
      'es': 'Julio',
      'en': '',
    },
    'mnxsbtd1': {
      'es': 'Agosto',
      'en': '',
    },
    '80eynrm9': {
      'es': 'Setiembre',
      'en': '',
    },
    '9xnfw57x': {
      'es': 'Octubre',
      'en': '',
    },
    'p495u0bn': {
      'es': 'Noviembre',
      'en': '',
    },
    'sv0muj9i': {
      'es': 'Diciembre',
      'en': '',
    },
    'e9jlje35': {
      'es': 'Generar',
      'en': '',
    },
    'gecw9dqc': {
      'es': 'Consultar',
      'en': '',
    },
    'mxtrn29m': {
      'es': 'Home',
      'en': '',
    },
  },
  // HistorialPedidos
  {
    'wzhfe1rl': {
      'es': '001',
      'en': '',
    },
    'mzz935p4': {
      'es': '16/10/2023',
      'en': '',
    },
    'y5c70d15': {
      'es': 'Carillas',
      'en': '',
    },
    '3gpwqtph': {
      'es': '2',
      'en': '',
    },
    'is6rwjpk': {
      'es': 'XXX',
      'en': '',
    },
    'yajyvg1e': {
      'es': '002',
      'en': '',
    },
    '6j17w0l5': {
      'es': '16/10/2023',
      'en': '',
    },
    'a825eb87': {
      'es': 'Puentes',
      'en': '',
    },
    'wm29r6hv': {
      'es': '2',
      'en': '',
    },
    '7hrw099i': {
      'es': 'XXX',
      'en': '',
    },
    '2vm7ci6i': {
      'es': '003',
      'en': '',
    },
    'a7a9g2qd': {
      'es': '16/10/2023',
      'en': '',
    },
    'ukckqnb4': {
      'es': 'Puentes',
      'en': '',
    },
    'ap69r5ht': {
      'es': '2',
      'en': '',
    },
    'lhzlpvry': {
      'es': 'XXX',
      'en': '',
    },
    'lp2g81bp': {
      'es': '004',
      'en': '',
    },
    'w0jzalho': {
      'es': '16/10/2023',
      'en': '',
    },
    'jrabw2cy': {
      'es': 'Carillas',
      'en': '',
    },
    'alovaxrn': {
      'es': '2',
      'en': '',
    },
    'sz2czpit': {
      'es': 'XXX',
      'en': '',
    },
    'j2xrhu4k': {
      'es': '005',
      'en': '',
    },
    'yz0m6nc8': {
      'es': '16/10/2023',
      'en': '',
    },
    '3j0g6b14': {
      'es': 'Coronas',
      'en': '',
    },
    'gef88dd3': {
      'es': '2',
      'en': '',
    },
    '41h9g5kv': {
      'es': 'XXX',
      'en': '',
    },
    'ifyuo4cn': {
      'es': 'Generar',
      'en': '',
    },
    'aukp8zhb': {
      'es': 'Consultar',
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
    '5vlv2ng0': {
      'es': 'Jan. 20th, 2023',
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
  // IniciSesion
  {
    '6zk2njyh': {
      'es': 'Logo',
      'en': '',
    },
    'vm23sd0p': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'po4h99jr': {
      'es': 'Crea una cuenta',
      'en': '',
    },
    '6c1zhbw1': {
      'es': 'Llene el siguiente formulario',
      'en': '',
    },
    '32sj7xtk': {
      'es': 'Correo Electronico',
      'en': '',
    },
    'yi6vnxyn': {
      'es': 'Contraseña',
      'en': '',
    },
    '1w73fsvt': {
      'es': 'Ingresa de nuevo tu contraseña',
      'en': '',
    },
    '3bru038f': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'ly04tf82': {
      'es': 'O registrate aqui',
      'en': '',
    },
    '2a8kwlbh': {
      'es': 'Continue with Google',
      'en': '',
    },
    'khjmok9s': {
      'es': 'Continue with Apple',
      'en': '',
    },
    'x1y5oybw': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    'g6bcnc6b': {
      'es': 'Ingrese los siguientes datos',
      'en': '',
    },
    '5rfmz6fy': {
      'es': 'Correo Electronico',
      'en': '',
    },
    '6vl8uh2v': {
      'es': 'Contraseña',
      'en': '',
    },
    '32hxiqat': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    'x5ib51re': {
      'es': 'o inicia sesión con',
      'en': '',
    },
    'gbtb9tob': {
      'es': 'Continua con Google',
      'en': '',
    },
    'zcoxcidi': {
      'es': 'Continua con Apple',
      'en': '',
    },
    'smkj0hii': {
      'es': '¿Has olvidado tu contraseña?',
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
      'es': 'Has olvidado tu contraseña',
      'en': '',
    },
    'vz2qurcn': {
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
    '8yxc40c1': {
      'es': 'Atras',
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
    '802exsif': {
      'es': 'Privacidad',
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
    '5lfkr2pw': {
      'es': 'Page Title',
      'en': '',
    },
    'ceurpgo6': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarServicios
  {
    '5vs8ai6f': {
      'es': 'Page Title',
      'en': '',
    },
    'xc9knmhm': {
      'es': 'Home',
      'en': '',
    },
  },
  // editarServicio
  {
    '9u1vy0ic': {
      'es': 'Page Title',
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
      'en': '',
    },
    'ev1w618o': {
      'es': 'Menú de productos/servicios',
      'en': '',
    },
    'uu4112kc': {
      'es': 'Productos y Servicios',
      'en': '',
    },
    'm1vfrtfc': {
      'es': 'Historial de pedidos',
      'en': '',
    },
    '71z8y084': {
      'es': 'Sobre el Laboratorio ED',
      'en': '',
    },
    '63hkglem': {
      'es': 'Configuración de la cuenta',
      'en': '',
    },
    '0yf107ll': {
      'es': 'Lista de deseos',
      'en': '',
    },
    'wq4s0yp0': {
      'es': 'Contáctenos',
      'en': '',
    },
    'tjfbgr01': {
      'es': 'Realizar Pedido',
      'en': '',
    },
    '4s5xgmxz': {
      'es': 'Cerrar Sesión',
      'en': '',
    },
    'hmbufnz5': {
      'es': 'Eliminar Cuenta',
      'en': '',
    },
    'pjx461ar': {
      'es': 'Page Title',
      'en': '',
    },
  },
  // ChaBot
  {
    'xvjtcjyo': {
      'es': 'ChatBot',
      'en': '',
    },
    'knhn7xdb': {
      'es': 'Home',
      'en': '',
    },
  },
  // IconoChatBot
  {
    'g4ty03jz': {
      'es': 'Page Title',
      'en': '',
    },
    'afsgyqvq': {
      'es': 'Home',
      'en': '',
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
    'cpiqrci4': {
      'es': 'TextField',
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
      'en': '',
    },
    'fbzs6vj1': {
      'es': 'Option 1',
      'en': '',
    },
    'm1obdrcz': {
      'es': 'Option 2',
      'en': '',
    },
    '7jkqptd7': {
      'es': 'Option 3',
      'en': '',
    },
    'b548t45n': {
      'es': 'Select...',
      'en': '',
    },
    'g8pkxpw1': {
      'es': 'Search...',
      'en': '',
    },
    'wmbndr7r': {
      'es': 'Configurar un nuevo recordatorio',
      'en': '',
    },
    'sg36wgll': {
      'es': 'Option 1',
      'en': '',
    },
    'tktigcj3': {
      'es': 'Option 2',
      'en': '',
    },
    'mfbnp8z2': {
      'es': 'Option 3',
      'en': '',
    },
    'vf9h5gqp': {
      'es': 'Select...',
      'en': '',
    },
    '4us9epcw': {
      'es': 'Search...',
      'en': '',
    },
    '5hpxf0fk': {
      'es': 'Cancelar',
      'en': '',
    },
    'qs1xih45': {
      'es': 'Guardar',
      'en': '',
    },
    'aj9w21ig': {
      'es': 'Notificaciones',
      'en': '',
    },
    '75rxv9f7': {
      'es': 'Home',
      'en': '',
    },
  },
  // Notificaciones
  {
    'i11gdgbn': {
      'es': 'Desactivar todas las notificaciones',
      'en': '',
    },
    '98x0zgwc': {
      'es': 'Activar notificaciones críticas',
      'en': '',
    },
    'bh4et3j6': {
      'es': 'Configurar un nuevo recordatorio',
      'en': '',
    },
    'oq7rl0k9': {
      'es': 'Cancelar',
      'en': '',
    },
    'gwszih58': {
      'es': 'Guardar',
      'en': '',
    },
    'z9aowxjh': {
      'es': 'Notificaciones',
      'en': '',
    },
    '1u859o1e': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarEmpleado
  {
    'rl79otd9': {
      'es': 'Gestion de Empleados',
      'en': '',
    },
    'bnlslorb': {
      'es': 'Home',
      'en': '',
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
