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
      'en': 'At Esencia Dental, we help you\nsmile again!',
    },
    '91d6dpqw': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'of6dta64': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'ztqvskpj': {
      'es': 'Lista de Deseos',
      'en': 'Wish List',
    },
    'g5efq2fr': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // HistorialPedidosFALTABOTONPDF
  {
    'ifyuo4cn': {
      'es': 'Generar',
      'en': 'Trigger',
    },
    'aukp8zhb': {
      'es': 'Consultar',
      'en': 'Consult',
    },
    '79cepg43': {
      'es': 'Prueba',
      'en': 'Proof',
    },
    'dtpbklik': {
      'es': 'Back',
      'en': '',
    },
    'iwahlqj4': {
      'es': 'Historial de pedidos',
      'en': '',
    },
    'nz4zsi0c': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // InfoLab2
  {
    '0fxrc1t6': {
      'es': 'Horario:\n',
      'en': 'Schedule:',
    },
    'qb35yxqu': {
      'es': 'De Lunes a Viernes\n',
      'en': 'Monday to Friday',
    },
    'p1jbevir': {
      'es': 'de 7am - 5pm',
      'en': 'from 7am - 5pm',
    },
    'cu2cn03o': {
      'es': 'Para más \ninformación:\n',
      'en': 'For more \ninformation:',
    },
    'kh3qmut8': {
      'es': 'Visite nuestras\nredes sociales.',
      'en': 'Visit our\nsocial networks.',
    },
    '38lfftop': {
      'es': 'Sobre el laboratorio:\n',
      'en': 'About the laboratory:',
    },
    '77ygfipw': {
      'es':
          'El Laboratorio Esencial Aligners es uno de nuestros socios, nuestra empresa hermana con la cual diseñamos alineadores dentales de altísima calidad. ',
      'en':
          'The Essential Aligners Laboratory is one of our partners, our sister company with which we design high-quality dental aligners.',
    },
    'ew5gdyo5': {
      'es': 'Laboratorio Asociado',
      'en': 'Associated Laboratory',
    },
    'l2cyawv6': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Conozcanos
  {
    'lwitu7il': {
      'es':
          'En Esencia Dental nos caracterizamos por ser más que un equipo de profesionales comprometidos y especializados en técnica dental, somos una familia que busca devolver la sonrisa a sus pacientes.',
      'en':
          'At Esencia Dental we are characterized by being more than a team of committed professionals specialized in dental techniques, we are a family that seeks to give our patients back their smiles.',
    },
    '5to7d89q': {
      'es':
          '\"Manos expertas y el mejor equipo humano y tecnológico nos permite asegurarles la mejor calidad y los mejores tiempos de entrega. Hoy estamos desarrollando el tercer año desde que empezamos con dicho proceso y en la actualidad contamos con 14 empleados y un laboratorio completo con la capacidad de abarcar desde el punto inicial del proceso, que se llama “el modelo” e implica la impresión que se le toma al paciente. En nuestro negocio somos capaces de desarrollar todas las técnicas.\"',
      'en':
          '\"Expert hands and the best human and technological team allow us to ensure the best quality and the best delivery times. Today we are developing the third year since we started with this process and we currently have 14 employees and a complete laboratory with the capacity to cover from the initial point of the process, which is called \"the model\" and involves the impression that is taken from the patient. In our business we are capable of developing all the techniques.\"',
    },
    '4u4wg6d2': {
      'es': 'Equipo Humano en Esencia Dental\n',
      'en': 'Human Team at Esencia Dental',
    },
    'gwsabrpp': {
      'es': '#SomosUnEquipo ',
      'en': '#WeAreATeam',
    },
    'bmrutvp9': {
      'es': '¡Conózcanos!',
      'en': 'Get to know us!',
    },
    'pv4b85fj': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // AccesibilidadEIdioma
  {
    'oe9di57t': {
      'es': 'Tamaño de texto',
      'en': 'Text size',
    },
    'sxaym312': {
      'es': 'Modo Claro / Oscuro',
      'en': 'Light/Dark Mode',
    },
    've5gd7d4': {
      'es': 'Elige tu idioma',
      'en': 'Choose your language',
    },
    'c2svg7c1': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'f01gbn7c': {
      'es': 'Guardar',
      'en': 'Keep',
    },
    'f5cnme44': {
      'es': 'Accesibilidad e Idioma',
      'en': 'Accessibility and Language',
    },
    't7ckvhdm': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // PedidosRecientes
  {
    'zhdi935y': {
      'es': 'Recientes',
      'en': 'Recent',
    },
    '88q6ts4x': {
      'es': 'Número',
      'en': 'Number',
    },
    'eb5znb43': {
      'es': 'Cliente',
      'en': 'Customer',
    },
    'jlyi2sbo': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'shhto855': {
      'es': 'Estado',
      'en': 'State',
    },
    'ech9ovxp': {
      'es': 'Actions',
      'en': 'Actions',
    },
    '7ses1vnp': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    't2gvr1ou': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // MenuAdministrador
  {
    'buukx6g2': {
      'es': 'Menú administrador',
      'en': 'Orders of the Month',
    },
    'dzmba3kz': {
      'es': 'Gestión de Productos',
      'en': 'Product Management',
    },
    'py18nru5': {
      'es': 'Gestión de Pedidos',
      'en': 'Order Management',
    },
    'ogkzr7oh': {
      'es': 'Empleados',
      'en': 'Reports',
    },
    '263vtvce': {
      'es': 'Reportes',
      'en': 'Reports',
    },
    'vkna2ake': {
      'es': 'Servicios',
      'en': 'Reports',
    },
    'nae33p8b': {
      'es': 'Cerrar Sesión',
      'en': 'Close Session',
    },
  },
  // IndexProducto
  {
    'c790vstk': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'rr5wyjkj': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'vm2hm5a2': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    '9cf3qptz': {
      'es': 'Gestion de Productos',
      'en': 'Product Management',
    },
    '25whn5s9': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Login
  {
    'asutwzzz': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'oe7cf99x': {
      'es': 'Ingresa los siguientes datos.',
      'en': 'Enter the following data.',
    },
    'cf7l9skg': {
      'es': 'Correo electrónico ',
      'en': 'Email',
    },
    'oer6598o': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'mxbl3zc2': {
      'es': 'Confirmación de contraseña',
      'en': 'Password confirmation',
    },
    'r99603ni': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'vw0farqr': {
      'es': 'o crea la cuenta con',
      'en': 'or create the account with',
    },
    'oes1qf72': {
      'es': 'Continua con google',
      'en': 'Continue with google',
    },
    '6hqp99bw': {
      'es': 'Continua con apple',
      'en': 'Continue with apple',
    },
    '1ddmng1v': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    'xux8cifc': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    'pqb495sf': {
      'es': 'Ingrese los siguientes datos',
      'en': 'Enter the following data',
    },
    'ghcjay5s': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'xfwkf143': {
      'es': 'Password',
      'en': 'Password',
    },
    'lhxfyxud': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    'qm6yfpt5': {
      'es': 'o inicia sesión con',
      'en': 'or log in with',
    },
    'w1q93owp': {
      'es': 'Continua con Google',
      'en': 'Continue with Google',
    },
    'hmraj5tb': {
      'es': 'Continua con apple',
      'en': 'Continue with apple',
    },
    '7mzl8npv': {
      'es': 'Olvidaste tu contraseña?',
      'en': 'Forgot your password?',
    },
    'h5y6xaci': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // agregarProducto
  {
    '3pkisd33': {
      'es': 'Cargar',
      'en': 'Carry',
    },
    'rqrmxkew': {
      'es': 'Nombre del producto',
      'en': 'Product name',
    },
    'tgjmz7ae': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    'cz2060vp': {
      'es': 'Departamento',
      'en': 'Department',
    },
    '1t5cbmaq': {
      'es': 'Tecnico',
      'en': 'Technical',
    },
    'uzvbrofj': {
      'es': 'Categoria',
      'en': 'Category',
    },
    'fir9v5v1': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    '6ewiylw8': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'hseykpb0': {
      'es': 'Gestion de Productos',
      'en': 'Product Management',
    },
    '2018f8tq': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // PasswordOlvidado
  {
    'njflrfgf': {
      'es': 'Volver',
      'en': 'Back',
    },
    'h35sncml': {
      'es': 'Olvidaste la contraseña',
      'en': 'Forgot password?',
    },
    'vz2qurcn': {
      'es': 'Siempre mantén tu cuenta segura y no olvides actualizarla.',
      'en': 'Always keep your account secure and don\'t forget to update it.',
    },
    'l1io98rq': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado a su cuenta a continuación.  ',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
    },
    '1qohuj5l': {
      'es': 'Su dirección de correo electrónico...',
      'en': 'Your email address...',
    },
    '7lxncwqx': {
      'es': 'Ingrese su correo electrónico ',
      'en': 'Enter your email',
    },
    'xnqwrvww': {
      'es': 'Eviar enlance ',
      'en': 'Skip link',
    },
    'smg4rdq4': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Perfil
  {
    'b5rjwg5y': {
      'es': 'Editar cuenta',
      'en': 'Edit account',
    },
    'yl305dol': {
      'es': 'Accesibilidad',
      'en': 'Accessibility',
    },
    'miuzdowq': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    'a3xpsv90': {
      'es': 'Lenguaje',
      'en': 'Language',
    },
    'c43np712': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    '2mz78m8v': {
      'es': 'Eliminar cuenta',
      'en': 'Delete account',
    },
  },
  // ConfiguracionCuenta
  {
    'o0krnwyp': {
      'es': 'Configuración de cuenta',
      'en': 'Account Settings',
    },
    'u055erjx': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'it3c0yjz': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'iatoo8v4': {
      'es': 'Edad',
      'en': 'Age',
    },
    'iaj30ie5': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'am29ttka': {
      'es': 'Dirrección',
      'en': 'Address',
    },
    'giaxbqsa': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'yzguaehi': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    'o1c8qk4j': {
      'es': 'TextField',
      'en': 'TextField',
    },
    '87d3z7rc': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'ol3emgjz': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'chp0080i': {
      'es': 'Femenino',
      'en': 'Female',
    },
    'kvew7m24': {
      'es': 'Masculino',
      'en': 'Male',
    },
    'idkzd3pl': {
      'es': 'Actualizar',
      'en': 'Update',
    },
    'rraf1i8d': {
      'es': 'Mi Cuenta',
      'en': 'My Account',
    },
  },
  // editarProducto
  {
    'tkjymx2l': {
      'es': 'Nombre del producto',
      'en': 'Product name',
    },
    'yl4ka7w4': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    '4p128i2b': {
      'es': 'Departamento',
      'en': 'Department',
    },
    '4j13gluz': {
      'es': 'Tecnico',
      'en': 'Technical',
    },
    'xf52zwxx': {
      'es': 'Categoria',
      'en': 'Category',
    },
    'efdp40yt': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'gmcig2f1': {
      'es': 'Actualizar',
      'en': 'Update',
    },
    'gr043whn': {
      'es': 'Gestion de Productos',
      'en': 'Product Management',
    },
    'f1tkhdcu': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // indexEmpleados
  {
    'iv5ygj30': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'aldqorvp': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'qd968mjz': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'hg3vcouh': {
      'es': 'Gestion de Empleados',
      'en': 'Employee Management',
    },
    'f1e2snq5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // detallesEmpleado
  {
    '5bmt3f5x': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'q6rnnt0p': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'sdcafxkz': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'm8w560qh': {
      'es': 'TextField',
      'en': 'TextField',
    },
    '7bflktpz': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'qkn93dr4': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'mvyvyvam': {
      'es': 'Gestion de Empleados',
      'en': 'Employee Management',
    },
    '2mrlgf3o': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // indexServicio
  {
    'pknmo7pc': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'c3l0r780': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'rcstd724': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'd3rs9u7p': {
      'es': 'Gestion de Servicios',
      'en': 'Service Management',
    },
    'ceurpgo6': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // agregarServicios
  {
    'aefeefhq': {
      'es': 'Nombre del servicio',
      'en': 'Name of the service',
    },
    'tuq7kp7b': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    'ry5fmrnm': {
      'es': 'Precio',
      'en': 'Price',
    },
    'x389uit8': {
      'es': 'Empleado',
      'en': 'Employee',
    },
    'e5qt4f29': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'y1t18ffa': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'wed6e2sn': {
      'es': 'Gestion de Productos',
      'en': 'Product Management',
    },
    'xc9knmhm': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editarServicio
  {
    '7opge6uy': {
      'es': 'Nombre del servicio',
      'en': 'Name of the service',
    },
    'hldjlpbh': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    '61h7mdzm': {
      'es': 'Precio',
      'en': 'Price',
    },
    'z593rl94': {
      'es': 'Estado',
      'en': 'State',
    },
    'o5kt3jm8': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'c66171sh': {
      'es': 'Actualizar',
      'en': 'Update',
    },
    '875e40dx': {
      'es': 'Gestion de Servicios',
      'en': 'Service Management',
    },
    '5ejx2ate': {
      'es': 'Home',
      'en': 'Home',
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
      'en': 'TextField',
    },
    'e62b5ca7': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'ghsjyjw0': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'coluhmyu': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'iovhfo2t': {
      'es': 'TextField',
      'en': 'TextField',
    },
    'gy1070n5': {
      'es': 'Fecha de contratación',
      'en': 'Hiring date',
    },
    '5deafnss': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'ajx0bwod': {
      'es': 'Actualizar',
      'en': 'Update',
    },
    'qkvhf8lc': {
      'es': 'Gestion de Empleados',
      'en': 'Employee Management',
    },
    'e37r9jco': {
      'es': 'Home',
      'en': 'Home',
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
      'en': 'Whitening',
    },
    'k3clch6m': {
      'es': 'Coronas',
      'en': 'Crowns',
    },
    'y5c70d15': {
      'es': 'Carillas',
      'en': 'Veneers',
    },
    'hqfgsfaf': {
      'es': 'Solo modelos de resina',
      'en': 'Resin models only',
    },
    'gbgd6e0n': {
      'es': 'Incrustacion',
      'en': 'Incrustation',
    },
    '2n5p8uf2': {
      'es': 'Puentes',
      'en': 'Bridges',
    },
    'k1qffbtq': {
      'es': 'Otros',
      'en': 'Others',
    },
    'n7sy6b0z': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'a3jewg0o': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'j0ztcb6r': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '28xjl57h': {
      'es': 'Catalogo de Productos',
      'en': 'Product Catalog',
    },
    '43ek9c10': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // VerCatalogo
  {
    '4ri87aj0': {
      'es': 'Catálogo de Productos',
      'en': 'Product Catalog',
    },
    'i71hyqcu': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // VerCatalogoPorCategoria
  {
    '8z3v4kuz': {
      'es': 'Blanqueamiento',
      'en': 'Whitening',
    },
    'o7dgge10': {
      'es': 'Coronas',
      'en': 'Crowns',
    },
    'ulxsp3ab': {
      'es': 'Carillas',
      'en': 'Veneers',
    },
    '1fgkb2l2': {
      'es': 'Solo modelos de resina',
      'en': 'Resin models only',
    },
    '6qwb64fv': {
      'es': 'Incrustacion',
      'en': 'Incrustation',
    },
    '54kf6w0z': {
      'es': 'Puentes',
      'en': 'Bridges',
    },
    'd80h426l': {
      'es': 'Otros',
      'en': 'Others',
    },
    'idd4vmph': {
      'es': 'Filtrar por categoría...',
      'en': 'Filter by category...',
    },
    'dnm9b533': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'pbz5fqby': {
      'es': '¡En Esencia Dental, te ayudaremos\na que vuelvas a sonreír!',
      'en': 'At Esencia Dental, we will help you\nsmile again!',
    },
    'tswratf5': {
      'es': 'Atrás',
      'en': 'Back',
    },
    'itwlg9hk': {
      'es': 'Catálogo de Productos',
      'en': '',
    },
    'igy1qxlm': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Promociones
  {
    'mf6pkmmy': {
      'es': 'Aplicar',
      'en': 'Apply',
    },
    's1dyllf5': {
      'es': 'Promociones',
      'en': 'Promotions',
    },
    'i88qlbah': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ReportePedidosUsuario
  {
    'wtjwa8my': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    'xan4da87': {
      'es': 'Reportes',
      'en': 'Reports',
    },
    'cq10z57e': {
      'es': 'Calendario de Pedidos',
      'en': 'Order Calendar',
    },
    'vcwl9vut': {
      'es': 'Enero',
      'en': 'January',
    },
    'ip25j9pg': {
      'es': 'Febrero',
      'en': 'February',
    },
    '0ehe8l60': {
      'es': 'Marzo',
      'en': 'March',
    },
    'ohc0vg7n': {
      'es': 'Abril',
      'en': 'April',
    },
    'nv43sq6g': {
      'es': 'Mayo',
      'en': 'May',
    },
    '5fjlddjb': {
      'es': 'Junio',
      'en': 'June',
    },
    '3x7m5s1h': {
      'es': 'Julio',
      'en': 'July',
    },
    'ff44cwte': {
      'es': 'Agosto',
      'en': 'August',
    },
    'va23mr97': {
      'es': 'Septiembre',
      'en': 'September',
    },
    'epu1h63a': {
      'es': 'Octubre',
      'en': 'October',
    },
    'bxpihw52': {
      'es': 'Noviembre',
      'en': 'November',
    },
    'f9ldbjgp': {
      'es': 'Diciembre',
      'en': 'December',
    },
    'xmq8u9k6': {
      'es': 'Generar PDF',
      'en': 'Generate PDF',
    },
    'oz0tj9xg': {
      'es': 'Consultar',
      'en': 'Consult',
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
    'zx9aflrl': {
      'es': 'TextField',
      'en': 'TextField',
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
      'en': 'Enter your name',
    },
    'brbhdb5a': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3xq6ydwz': {
      'es': 'Por favor ingrese e nombre del paciente',
      'en': 'Please enter the patient\'s name',
    },
    '0ta7z86h': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ukyk3wov': {
      'es': 'Ingrese la edad ',
      'en': 'Enter age',
    },
    't4lrd6f9': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'vudv8899': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'wyh6ngkl': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'skg6n834': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'anjsplv4': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '39mfg4a5': {
      'es': 'In  la  marca ',
      'en': 'On the brand',
    },
    'i9fcu6h9': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'crwzc61o': {
      'es': 'Ingrese el numero de plataforma ',
      'en': 'Enter the platform number',
    },
    '3psqc737': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yv7cj1zb': {
      'es': 'Ingrese el color del Muñon',
      'en': 'Enter the color of the Stump',
    },
    'xzlt3u4g': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'mirywcic': {
      'es': 'Ingrese el color final',
      'en': 'Enter the final color',
    },
    'm7ds6kus': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fc5tah2x': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'p5ybi0gq': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
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
      'en': 'Carry',
    },
    'ayyep71y': {
      'es': 'Nombre ',
      'en': 'Name',
    },
    'spca03ia': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'zqh81mpw': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    'sm67bomj': {
      'es': 'Departamento',
      'en': 'Department',
    },
    'hxxz8hkh': {
      'es': 'Estado',
      'en': 'State',
    },
    '8hv59a31': {
      'es': 'FECHA DE CONTRATACIÓN:',
      'en': 'DATE OF HIRING:',
    },
    'wluhrhor': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'ue4v7sbh': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'cq6jouvp': {
      'es': 'Gestion de Empleados',
      'en': 'Employee Management',
    },
    'uswtuqg0': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // indexPedidos
  {
    'ax02bkyu': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '4gj0y9zw': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'hg2724ap': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'ih7f86dm': {
      'es': 'Detalles',
      'en': 'Details',
    },
    '7v306w4j': {
      'es': 'Gestion de Pedidos',
      'en': 'Order Management',
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
      'en': 'Home',
    },
  },
  // agregarPedido
  {
    '1ez1nrua': {
      'es': 'Nombre del pedido',
      'en': 'Order name',
    },
    '5enl868h': {
      'es': 'Fecha de solicitud:',
      'en': 'Application date:',
    },
    'e1y33jo5': {
      'es': 'Tecnico',
      'en': 'Technical',
    },
    'yban2dl4': {
      'es': 'Estado',
      'en': 'State',
    },
    'tzjpzav3': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    '1iuhewgf': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '7ohah207': {
      'es': 'Gestion de Pedidos',
      'en': 'Order Management',
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
      'en': 'Order name',
    },
    'b1osyd8h': {
      'es': 'Nombre del pedido',
      'en': 'Order name',
    },
    'ht4dg9wz': {
      'es': 'Tecnico',
      'en': 'Technical',
    },
    'r6pl1qrd': {
      'es': 'Estado',
      'en': 'State',
    },
    'y9dmxhtk': {
      'es': 'Gestion de Pedidos',
      'en': 'Order Management',
    },
    'c4vue3so': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ReportePedidosAdmin
  {
    '6x0i6vym': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    '7q9hbnf9': {
      'es': 'Reportes',
      'en': 'Reports',
    },
    'xaidz1sd': {
      'es': 'Calendario de Pedidos',
      'en': 'Order Calendar',
    },
    'okptb8fq': {
      'es': 'Enero',
      'en': 'January',
    },
    'vlm2vo1j': {
      'es': 'Febrero',
      'en': 'February',
    },
    'ccyo0k9p': {
      'es': 'Marzo',
      'en': 'March',
    },
    'nbodue2s': {
      'es': 'Abril',
      'en': 'April',
    },
    'v4y0k2zc': {
      'es': 'Mayo',
      'en': 'May',
    },
    '28z39386': {
      'es': 'Junio',
      'en': 'June',
    },
    'q8q7v52w': {
      'es': 'Julio',
      'en': 'July',
    },
    'n7zc3z6e': {
      'es': 'Agosto',
      'en': 'August',
    },
    'mnhst42b': {
      'es': 'Septiembre',
      'en': 'September',
    },
    'sccq3b5x': {
      'es': 'Octubre',
      'en': 'October',
    },
    'lj6y1thr': {
      'es': 'Noviembre',
      'en': 'November',
    },
    'y5bdca39': {
      'es': 'Diciembre',
      'en': 'December',
    },
    '8yqxfou3': {
      'es': 'Generar PDF',
      'en': 'Generate PDF',
    },
    '2qr791dw': {
      'es': 'Consultar',
      'en': 'Consult',
    },
  },
  // Miscellaneous
  {
    'pvbpctp9': {
      'es':
          'Para poder tomar fotos o videos, esta app requiere permisos para acceder a la camara',
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
    },
    '5k09qpyc': {
      'es':
          'Para poder subir archivos, esta app requiere permisos para acceder a la galería',
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
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
