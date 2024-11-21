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

  static List<String> languages() => ['en', 'es'];

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
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

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
      'en': 'Horario:\n',
      'es': '',
    },
    'ju8lu7dx': {
      'en': 'De Lunes a Viernes\n',
      'es': '',
    },
    '4omp2u46': {
      'en': 'de 7am - 5pm',
      'es': '',
    },
    'r6qrh6x4': {
      'en': 'Dirección:\n',
      'es': '',
    },
    'yers8ym0': {
      'en':
          'Del Ice 50m N\nEdificio El Roble \nsegundo piso \nHeredia, 40101, \nCosta Rica.',
      'es': '',
    },
    'bj3a1vvo': {
      'en': 'Sobre el laboratorio:\n',
      'es': '',
    },
    'diysiin8': {
      'en':
          'El Laboratorio Esencia Dental (AJ Dental Design) es un laboratorio dental especializado en crear prótesis dentales fijas de alta estética natural que se adaptan a las necesidades de cada paciente; ubicado en Heredia, Costa Rica, trabaja en estrecha colaboración con dentistas, ortodoncistas estéticos y prostodoncistas para ofrecer soluciones protésicas avanzadas. \n\nFue fundado el 17 de octubre del 2018, ha brindado 7 años de servicio en el área de la salud dental, catalogado como uno de los mejores laboratorios dentales y destacado por su compromiso como empresa con la excelencia y la atención al detalle en cada etapa del proceso.',
      'es': '',
    },
    'h9melw03': {
      'en': 'Ver local asociado',
      'es': '',
    },
    '4ug0jyih': {
      'en': 'Laboratorio Principal',
      'es': '',
    },
    'y6fca95k': {
      'en': 'Home',
      'es': '',
    },
  },
  // VerCatalogo
  {
    'a0twvkp7': {
      'en': 'Catálogo de productos',
      'es': '',
    },
    't21jktug': {
      'en': 'Option 1',
      'es': '',
    },
    'gz5oqr31': {
      'en': 'Option 2',
      'es': '',
    },
    'nssqltnn': {
      'en': 'Option 3',
      'es': '',
    },
    '0ton6wry': {
      'en': 'Filtrar por categoría',
      'es': '',
    },
    '849i73cd': {
      'en': 'Search...',
      'es': '',
    },
    'w1fof9wr': {
      'en': 'Blanqueamiento dental',
      'es': '',
    },
    '6y9gbat5': {
      'en': '¡En Esencia Dental, te ayudamos\n a que vuelvas a sonreír!\"',
      'es': '',
    },
    'nqus51t3': {
      'en': 'Eliminar',
      'es': '',
    },
    'i88qlbah': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Contactenos
  {
    'p94tc1lp': {
      'en': 'TD. Javier Rojas Castaño \n Director',
      'es': '',
    },
    '3yk7zb72': {
      'en':
          'Comunicador Social - Periodista egresado de la Universidad de la Sabana, con 12 años de experiencia como ceramista dental de alta estética. Propietario de Esencia Dental en Costa Rica, especializado en prótesis fijas. Líder en Viax Dental Lab, experto en planeación de sonrisas y restauraciones cerámicas mínimamente invasivas, miembro de Ivoclar Vivadent en el uso de Zirconio Nexxzr+. Capacitado por destacados técnicos como Nondas Vlachopoulos y August Bruguera, y con participación en seminarios de Pascal Magne y Sidney Kina.',
      'es': '',
    },
    'gft3qctx': {
      'en': 'Detalles de contacto',
      'es': '',
    },
    'urqnmtnt': {
      'en': '+506 8727 - 1239',
      'es': '',
    },
    'gtk7xkez': {
      'en': 'Visítanos en Esencia Dental Costa Rica',
      'es': '',
    },
    'tttnru7u': {
      'en': 'Síguenos en Instagram - Esencia Dental',
      'es': '',
    },
    't3kjcbcc': {
      'en': '¡Contáctenos!',
      'es': '',
    },
    'ogbshy1o': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // GuardarProductosLista
  {
    'oldd4cuv': {
      'en': 'Coronas y Carillas EMAX',
      'es': '',
    },
    'nzutsiw4': {
      'en': 'Corona Provisional en PMMA',
      'es': '',
    },
    'vfqlhig9': {
      'en': 'Blanqueamiento dental',
      'es': 'Blanqueamiento dental',
    },
    '2de19b8k': {
      'en': '¡En Esencia Dental, te ayudamos \na que vuelvas a sonreír! ',
      'es': '',
    },
    '91d6dpqw': {
      'en': 'Agregar',
      'es': '',
    },
    'of6dta64': {
      'en': 'Eliminar',
      'es': 'Eliminar',
    },
    'ztqvskpj': {
      'en': 'Lista de Deseos',
      'es': '',
    },
    'g5efq2fr': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // ReportePedidos
  {
    'qtn88dqo': {
      'en': 'Juan Pablo Pérez Arroyo',
      'es': '',
    },
    '5qs46woe': {
      'en': 'Reporte pedidos',
      'es': '',
    },
    'fdqvxsga': {
      'en': 'Enero',
      'es': '',
    },
    '0j1xf420': {
      'en': 'Febrero',
      'es': '',
    },
    'gtfv6lc5': {
      'en': 'Marzo',
      'es': '',
    },
    '9qtbp4fx': {
      'en': 'Abril',
      'es': '',
    },
    '0eg8ssup': {
      'en': 'Mayo',
      'es': '',
    },
    'kk1ze7gc': {
      'en': 'Junio',
      'es': '',
    },
    '9escjjfb': {
      'en': 'Julio',
      'es': '',
    },
    'mnxsbtd1': {
      'en': 'Agosto',
      'es': '',
    },
    '80eynrm9': {
      'en': 'Setiembre',
      'es': '',
    },
    '9xnfw57x': {
      'en': 'Octubre',
      'es': '',
    },
    'p495u0bn': {
      'en': 'Noviembre',
      'es': '',
    },
    'sv0muj9i': {
      'en': 'Diciembre',
      'es': '',
    },
    'e9jlje35': {
      'en': 'Generar',
      'es': '',
    },
    'gecw9dqc': {
      'en': 'Consultar',
      'es': '',
    },
    'mxtrn29m': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // HistorialPedidos
  {
    'wzhfe1rl': {
      'en': '001',
      'es': '',
    },
    'mzz935p4': {
      'en': '16/10/2023',
      'es': '',
    },
    'y5c70d15': {
      'en': 'Carillas',
      'es': '',
    },
    '3gpwqtph': {
      'en': '2',
      'es': '',
    },
    'is6rwjpk': {
      'en': 'XXX',
      'es': '',
    },
    'yajyvg1e': {
      'en': '002',
      'es': '',
    },
    '6j17w0l5': {
      'en': '16/10/2023',
      'es': '',
    },
    'a825eb87': {
      'en': 'Puentes',
      'es': '',
    },
    'wm29r6hv': {
      'en': '2',
      'es': '',
    },
    '7hrw099i': {
      'en': 'XXX',
      'es': '',
    },
    '2vm7ci6i': {
      'en': '003',
      'es': '',
    },
    'a7a9g2qd': {
      'en': '16/10/2023',
      'es': '',
    },
    'ukckqnb4': {
      'en': 'Puentes',
      'es': '',
    },
    'ap69r5ht': {
      'en': '2',
      'es': '',
    },
    'lhzlpvry': {
      'en': 'XXX',
      'es': '',
    },
    'lp2g81bp': {
      'en': '004',
      'es': '',
    },
    'w0jzalho': {
      'en': '16/10/2023',
      'es': '',
    },
    'jrabw2cy': {
      'en': 'Carillas',
      'es': '',
    },
    'alovaxrn': {
      'en': '2',
      'es': '',
    },
    'sz2czpit': {
      'en': 'XXX',
      'es': '',
    },
    'j2xrhu4k': {
      'en': '005',
      'es': '',
    },
    'yz0m6nc8': {
      'en': '16/10/2023',
      'es': '',
    },
    '3j0g6b14': {
      'en': 'Coronas',
      'es': '',
    },
    'gef88dd3': {
      'en': '2',
      'es': '',
    },
    '41h9g5kv': {
      'en': 'XXX',
      'es': '',
    },
    'ifyuo4cn': {
      'en': 'Generar',
      'es': 'Generar',
    },
    'aukp8zhb': {
      'en': 'Consultar',
      'es': 'Consultar',
    },
    'tc7f0pk5': {
      'en': 'Historial de pedidos',
      'es': '',
    },
    'nz4zsi0c': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // InfoLab2
  {
    '0fxrc1t6': {
      'en': 'Horario:\n',
      'es': 'Horario:\n',
    },
    'qb35yxqu': {
      'en': 'De Lunes a Viernes\n',
      'es': 'De Lunes a Viernes\n',
    },
    'p1jbevir': {
      'en': 'de 7am - 5pm',
      'es': 'de 7am - 5pm',
    },
    'cu2cn03o': {
      'en': 'Para más \ninformación:\n',
      'es': '',
    },
    'kh3qmut8': {
      'en': 'Visite nuestras\nredes sociales.',
      'es': '',
    },
    '38lfftop': {
      'en': 'Sobre el laboratorio:\n',
      'es': 'Sobre el laboratorio:\n',
    },
    '77ygfipw': {
      'en':
          'El Laboratorio Esencial Aligners es uno de nuestros socios, nuestra empresa hermana con la cual diseñamos alineadores dentales de altísima calidad. ',
      'es': '',
    },
    'ew5gdyo5': {
      'en': 'Laboratorio Asociado',
      'es': '',
    },
    'l2cyawv6': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Conozcanos
  {
    'lwitu7il': {
      'en':
          'En Esencia Dental nos caracterizamos por ser más que un equipo de profesionales comprometidos y especializados en técnica dental, somos una familia que busca devolver la sonrisa a sus pacientes.',
      'es': '',
    },
    '5to7d89q': {
      'en':
          '\"Manos expertas y el mejor equipo humano y tecnológico nos permite asegurarles la mejor calidad y los mejores tiempos de entrega. Hoy estamos desarrollando el tercer año desde que empezamos con dicho proceso y en la actualidad contamos con 14 empleados y un laboratorio completo con la capacidad de abarcar desde el punto inicial del proceso, que se llama “el modelo” e implica la impresión que se le toma al paciente. En nuestro negocio somos capaces de desarrollar todas las técnicas.\"',
      'es': '',
    },
    '4u4wg6d2': {
      'en': 'Equipo Humano en Esencia Dental\n',
      'es': '',
    },
    'gwsabrpp': {
      'en': '#SomosUnEquipo ',
      'es': '',
    },
    'bmrutvp9': {
      'en': '¡Conózcanos!',
      'es': '',
    },
    'pv4b85fj': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // AccesibilidadEIdioma
  {
    'x0rmhgsq': {
      'en': 'Tamaño de Letra',
      'es': '',
    },
    'sxaym312': {
      'en': 'Modo Claro / Oscuro',
      'es': '',
    },
    've5gd7d4': {
      'en': 'Elige tu idioma',
      'es': '',
    },
    'c2svg7c1': {
      'en': 'Cancelar',
      'es': '',
    },
    'f01gbn7c': {
      'en': 'Guardar',
      'es': '',
    },
    'f5cnme44': {
      'en': 'Accesibilidad e Idioma',
      'es': '',
    },
    't7ckvhdm': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // PedidosRecientes
  {
    'zhdi935y': {
      'en': 'Recientes',
      'es': '',
    },
    '88q6ts4x': {
      'en': 'Número',
      'es': '',
    },
    'eb5znb43': {
      'en': 'Cliente',
      'es': '',
    },
    'jlyi2sbo': {
      'en': 'Fecha',
      'es': '',
    },
    'shhto855': {
      'en': 'Estado',
      'es': '',
    },
    'ech9ovxp': {
      'en': 'Actions',
      'es': '',
    },
    '5vlv2ng0': {
      'en': 'Jan. 20th, 2023',
      'es': '',
    },
    'b9xigbbe': {
      'en': 'Active',
      'es': '',
    },
    '7ses1vnp': {
      'en': 'Pedidos',
      'es': '',
    },
    't2gvr1ou': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MenuAdministrador
  {
    'craret79': {
      'en': 'Resumen de Pedidos',
      'es': '',
    },
    'dsikdemd': {
      'en': '12',
      'es': '',
    },
    'dracdyiu': {
      'en': 'Pedidos Activos',
      'es': '',
    },
    '7p0rf5nf': {
      'en': '8',
      'es': '',
    },
    'a9pq7wdh': {
      'en': 'En Proceso',
      'es': '',
    },
    'nt9wbt0h': {
      'en': '4',
      'es': '',
    },
    '0onryhrl': {
      'en': 'Completados',
      'es': '',
    },
    'buukx6g2': {
      'en': 'Pedidos del Mes',
      'es': '',
    },
    'py18nru5': {
      'en': 'Gestión de Pedidos',
      'es': '',
    },
    'dzmba3kz': {
      'en': 'Gestión de Productos',
      'es': '',
    },
    'ogkzr7oh': {
      'en': 'Reportes',
      'es': '',
    },
    'nae33p8b': {
      'en': 'Cerrar Sesión',
      'es': '',
    },
    '3wnrn19r': {
      'en': 'Administrador',
      'es': '',
    },
  },
  // IndexProducto
  {
    'c790vstk': {
      'en': 'AGREGAR',
      'es': '',
    },
    'rr5wyjkj': {
      'en': 'Editar',
      'es': '',
    },
    'vm2hm5a2': {
      'en': 'Eliminar',
      'es': 'Eliminar',
    },
    '9cf3qptz': {
      'en': 'Gestion de Productos',
      'es': '',
    },
    '25whn5s9': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // IniciSesion
  {
    '6zk2njyh': {
      'en': 'Logo',
      'es': '',
    },
    'vm23sd0p': {
      'en': 'Crear Cuenta',
      'es': '',
    },
    'po4h99jr': {
      'en': 'Crea una cuenta',
      'es': '',
    },
    '6c1zhbw1': {
      'en': 'Llene el siguiente formulario',
      'es': '',
    },
    '32sj7xtk': {
      'en': 'Correo Electronico',
      'es': '',
    },
    'yi6vnxyn': {
      'en': 'Contraseña',
      'es': '',
    },
    '1w73fsvt': {
      'en': 'Ingresa de nuevo tu contraseña',
      'es': '',
    },
    '3bru038f': {
      'en': 'Crear Cuenta',
      'es': '',
    },
    'ly04tf82': {
      'en': 'O registrate aqui',
      'es': '',
    },
    '2a8kwlbh': {
      'en': 'Continue with Google',
      'es': '',
    },
    'khjmok9s': {
      'en': 'Continue with Apple',
      'es': '',
    },
    'x1y5oybw': {
      'en': 'Iniciar Sesión',
      'es': '',
    },
    'g6bcnc6b': {
      'en': 'Ingrese los siguientes datos',
      'es': '',
    },
    '5rfmz6fy': {
      'en': 'Correo Electronico',
      'es': '',
    },
    '6vl8uh2v': {
      'en': 'Contraseña',
      'es': '',
    },
    '32hxiqat': {
      'en': 'Iniciar Sesión',
      'es': '',
    },
    'x5ib51re': {
      'en': 'o inicia sesión con',
      'es': '',
    },
    'gbtb9tob': {
      'en': 'Continua con Google',
      'es': '',
    },
    'zcoxcidi': {
      'en': 'Continua con Apple',
      'es': '',
    },
    'smkj0hii': {
      'en': '¿Has olvidado tu contraseña?',
      'es': '',
    },
    'h5y6xaci': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // agregarProducto
  {
    '3pkisd33': {
      'en': 'Cargar',
      'es': '',
    },
    'rqrmxkew': {
      'en': 'Nombre del producto',
      'es': '',
    },
    'tgjmz7ae': {
      'en': 'Descripcion',
      'es': '',
    },
    'cz2060vp': {
      'en': 'Departamento',
      'es': '',
    },
    '1t5cbmaq': {
      'en': 'Tecnico',
      'es': '',
    },
    'uzvbrofj': {
      'en': 'Categoria',
      'es': '',
    },
    'fir9v5v1': {
      'en': 'Cancelar',
      'es': '',
    },
    '6ewiylw8': {
      'en': 'Agregar',
      'es': 'Agregar',
    },
    'hseykpb0': {
      'en': 'Gestion de Productos',
      'es': 'Gestion de Productos',
    },
    '2018f8tq': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // PasswordOlvidado
  {
    'njflrfgf': {
      'en': 'Back',
      'es': '',
    },
    'h35sncml': {
      'en': 'Has olvidado tu contraseña',
      'es': '',
    },
    'vz2qurcn': {
      'en':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado a su cuenta a continuación.  ',
      'es': '',
    },
    '1qohuj5l': {
      'en': 'Su dirección de correo electrónico...',
      'es': '',
    },
    '7lxncwqx': {
      'en': 'Ingrese su correo electrónico ',
      'es': '',
    },
    'xnqwrvww': {
      'en': 'Eviar enlance ',
      'es': '',
    },
    '8yxc40c1': {
      'en': 'Atras',
      'es': '',
    },
    'smg4rdq4': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Perfil
  {
    'b5rjwg5y': {
      'en': 'Editar cuenta',
      'es': '',
    },
    'yl305dol': {
      'en': 'Accesibilidad',
      'es': '',
    },
    'miuzdowq': {
      'en': 'Notificaciones',
      'es': '',
    },
    'a3xpsv90': {
      'en': 'Lenguaje',
      'es': '',
    },
    '802exsif': {
      'en': 'Privacidad',
      'es': '',
    },
    'c43np712': {
      'en': 'Cerrar sesión',
      'es': '',
    },
    '2mz78m8v': {
      'en': 'Eliminar cuenta',
      'es': '',
    },
  },
  // ConfiguracionCuenta
  {
    'o0krnwyp': {
      'en': 'Configuración de cuenta',
      'es': '',
    },
    'u055erjx': {
      'en': 'Nombre',
      'es': '',
    },
    'it3c0yjz': {
      'en': 'TextField',
      'es': '',
    },
    'iatoo8v4': {
      'en': 'Edad',
      'es': '',
    },
    'iaj30ie5': {
      'en': 'TextField',
      'es': '',
    },
    'am29ttka': {
      'en': 'Dirrección',
      'es': '',
    },
    'giaxbqsa': {
      'en': 'TextField',
      'es': '',
    },
    'yzguaehi': {
      'en': 'Teléfono',
      'es': '',
    },
    'o1c8qk4j': {
      'en': 'TextField',
      'es': '',
    },
    'chp0080i': {
      'en': 'Femenino',
      'es': '',
    },
    'kvew7m24': {
      'en': 'Masculino',
      'es': '',
    },
    'idkzd3pl': {
      'en': 'Actualizar',
      'es': '',
    },
    'rraf1i8d': {
      'en': 'Mi Cuenta',
      'es': '',
    },
  },
  // editarProducto
  {
    'tkjymx2l': {
      'en': 'Nombre del producto',
      'es': 'Nombre del producto',
    },
    'yl4ka7w4': {
      'en': 'Descripcion',
      'es': 'Descripcion',
    },
    '4p128i2b': {
      'en': 'Departamento',
      'es': 'Departamento',
    },
    '4j13gluz': {
      'en': 'Tecnico',
      'es': 'Tecnico',
    },
    'xf52zwxx': {
      'en': 'Categoria',
      'es': '',
    },
    'efdp40yt': {
      'en': 'Cancelar',
      'es': 'Cancelar',
    },
    'gmcig2f1': {
      'en': 'Actualizar',
      'es': 'Actualizar',
    },
    'gr043whn': {
      'en': 'Gestion de Productos',
      'es': 'Gestion de Productos',
    },
    'f1tkhdcu': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // indexEmpleados
  {
    'iv5ygj30': {
      'en': 'AGREGAR',
      'es': '',
    },
    'aldqorvp': {
      'en': 'Editar',
      'es': '',
    },
    'qd968mjz': {
      'en': 'Eliminar',
      'es': '',
    },
    'hg3vcouh': {
      'en': 'Gestion de Empleados',
      'es': '',
    },
    'f1e2snq5': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // agregarEmpleado
  {
    'ehg9x5s8': {
      'en': 'Page Title',
      'es': '',
    },
    'djrm18oh': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // detallesEmpleado
  {
    '5bmt3f5x': {
      'en': 'TextField',
      'es': '',
    },
    'q6rnnt0p': {
      'en': 'TextField',
      'es': '',
    },
    'sdcafxkz': {
      'en': 'TextField',
      'es': '',
    },
    'm8w560qh': {
      'en': 'TextField',
      'es': '',
    },
    '7bflktpz': {
      'en': 'TextField',
      'es': '',
    },
    'qkn93dr4': {
      'en': 'TextField',
      'es': '',
    },
    'mvyvyvam': {
      'en': 'Gestion de Empleados',
      'es': '',
    },
    '2mrlgf3o': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // indexServicio
  {
    '5lfkr2pw': {
      'en': 'Page Title',
      'es': 'Page Title',
    },
    'ceurpgo6': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // agregarServicios
  {
    '5vs8ai6f': {
      'en': 'Page Title',
      'es': 'Page Title',
    },
    'xc9knmhm': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // editarServicio
  {
    '9u1vy0ic': {
      'en': 'Page Title',
      'es': 'Page Title',
    },
    '5ejx2ate': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Home
  {
    'kysbfh16': {
      'en': '¡Bienvenidx a la app!',
      'es': '',
    },
    'ev1w618o': {
      'en': 'Menú de productos/servicios',
      'es': '',
    },
    'uu4112kc': {
      'en': 'Productos y Servicios',
      'es': '',
    },
    'm1vfrtfc': {
      'en': 'Historial de pedidos',
      'es': '',
    },
    '71z8y084': {
      'en': 'Sobre el Laboratorio ED',
      'es': '',
    },
    '63hkglem': {
      'en': 'Configuración de la cuenta',
      'es': '',
    },
    '0yf107ll': {
      'en': 'Lista de deseos',
      'es': '',
    },
    'wq4s0yp0': {
      'en': 'Contáctenos',
      'es': '',
    },
    'tjfbgr01': {
      'en': 'Realizar Pedido',
      'es': '',
    },
    '4s5xgmxz': {
      'en': 'Cerrar Sesión',
      'es': 'Cerrar Sesión',
    },
    'hmbufnz5': {
      'en': 'Eliminar Cuenta',
      'es': '',
    },
    'pjx461ar': {
      'en': 'Page Title',
      'es': '',
    },
  },
  // Notificaciones
  {
    '5772gpj1': {
      'en': 'Page Title',
      'es': 'Page Title',
    },
    'ihqtjn59': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // ChaBot
  {
    'xvjtcjyo': {
      'en': 'ChatBot',
      'es': '',
    },
    'knhn7xdb': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // IconoChatBot
  {
    'g4ty03jz': {
      'en': 'Page Title',
      'es': 'Page Title',
    },
    'afsgyqvq': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // editarEmpleado
  {
    'aicmdm3n': {
      'en': 'TextField',
      'es': '',
    },
    'e62b5ca7': {
      'en': 'TextField',
      'es': '',
    },
    'ghsjyjw0': {
      'en': 'TextField',
      'es': '',
    },
    'coluhmyu': {
      'en': 'TextField',
      'es': '',
    },
    'iovhfo2t': {
      'en': 'TextField',
      'es': '',
    },
    'cpiqrci4': {
      'en': 'TextField',
      'es': '',
    },
    '5deafnss': {
      'en': 'Cancelar',
      'es': '',
    },
    'ajx0bwod': {
      'en': 'Actualizar',
      'es': '',
    },
    'qkvhf8lc': {
      'en': 'Gestion de Empleados',
      'es': '',
    },
    'e37r9jco': {
      'en': 'Home',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'pvbpctp9': {
      'en': '',
      'es': '',
    },
    '5k09qpyc': {
      'en': '',
      'es': '',
    },
    'mc7n40e9': {
      'en': '',
      'es': '',
    },
    'xv0dxec4': {
      'en': '',
      'es': '',
    },
    'iv3frsi9': {
      'en': '',
      'es': '',
    },
    'r3qzh0wr': {
      'en': '',
      'es': '',
    },
    'vw2ochhw': {
      'en': '',
      'es': '',
    },
    'gu0vf0rm': {
      'en': '',
      'es': '',
    },
    '7y7080ef': {
      'en': '',
      'es': '',
    },
    's950ol6t': {
      'en': '',
      'es': '',
    },
    'oozrpaqf': {
      'en': '',
      'es': '',
    },
    '0dv4ru9p': {
      'en': '',
      'es': '',
    },
    'y3yxzshf': {
      'en': '',
      'es': '',
    },
    'i3jyeohw': {
      'en': '',
      'es': '',
    },
    '3cth0vmb': {
      'en': '',
      'es': '',
    },
    '5v26i8qg': {
      'en': '',
      'es': '',
    },
    '5rvng5ga': {
      'en': '',
      'es': '',
    },
    '7q2fjh4r': {
      'en': '',
      'es': '',
    },
    '88tlcphp': {
      'en': '',
      'es': '',
    },
    '0gp0ko7g': {
      'en': '',
      'es': '',
    },
    '99cdjiet': {
      'en': '',
      'es': '',
    },
    'b34k15mu': {
      'en': '',
      'es': '',
    },
    'ssocc3y8': {
      'en': '',
      'es': '',
    },
    '7poy96qm': {
      'en': '',
      'es': '',
    },
    'ktrhj18f': {
      'en': '',
      'es': '',
    },
    'r5xpxiiy': {
      'en': '',
      'es': '',
    },
    'fxn2ehtu': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
