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

  static List<String> languages() => ['en', 'es', 'fr', 'ar'];

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
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, esText, frText, arText][languageIndex] ?? '';

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
  // LoginMethod
  {
    'dax3spz0': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xbyffu85': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'd7eycoi4': {
      'en': 'Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'cfoz26i7': {
      'en': 'Create your account',
      'ar': 'إنشاء حسابك',
      'es': 'Crea tu cuenta',
      'fr': 'Créez votre compte',
    },
    'idja2o5g': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'njwssn10': {
      'en': 'Sign in with Social Media',
      'ar': 'تسجيل الدخول باستخدام وسائل التواصل الاجتماعي',
      'es': 'Iniciar sesión con redes sociales',
      'fr': 'Connectez-vous avec les réseaux sociaux',
    },
    '2qplfirq': {
      'en': 'or',
      'ar': 'أو',
      'es': 'o',
      'fr': 'ou',
    },
    '0un71lic': {
      'en': 'Already have an account',
      'ar': 'لديك حساب بالفعل',
      'es': 'Ya tengo una cuenta',
      'fr': 'Vous avez déjà un compte',
    },
    'qyap8667': {
      'en':
          'By proceeding you also agree to the terms of Service and Privacy Policy',
      'ar': 'من خلال المتابعة فإنك توافق أيضًا على شروط الخدمة وسياسة الخصوصية',
      'es':
          'Al continuar, también acepta los términos del servicio y la política de privacidad.',
      'fr':
          'En poursuivant, vous acceptez également les conditions d\'utilisation et la politique de confidentialité.',
    },
    '0p340i2n': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '62hrp1hy': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'kdtcvgyb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ir172gn6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'tdtto5un': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OnBoarding
  {
    'abla8204': {
      'en': 'Welcome to Salik!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3tja30tz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Login
  {
    'vpd2uinh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'cf6o6r5k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'sapcnpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'qhxn38kh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1d0ycpt5': {
      'en': 'Forgot the password?',
      'ar': 'نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
    },
    'g6hj7z55': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '7v52ifuz': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    'n7lnwkyz': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tqecekpx': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'm5qo8hnd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'g14z6myj': {
      'en':
          'By logging in you also agree to the Terms of Service and Privacy Policy',
      'ar': 'بتسجيل الدخول فإنك توافق أيضًا على شروط الخدمة وسياسة الخصوصية',
      'es':
          'Al iniciar sesión, también acepta los Términos de servicio y la Política de privacidad.',
      'fr':
          'En vous connectant, vous acceptez également les conditions d\'utilisation et la politique de confidentialité',
    },
    'ze3m37np': {
      'en': '\nLogin',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'qadxm7si': {
      'en': 'Welcome Back!',
      'ar': 'مرحبًا بعودتك!',
      'es': '¡Bienvenido de nuevo!',
      'fr': 'Content de te revoir!',
    },
    '6yc5mpgk': {
      'en': 'back',
      'ar': 'خلف',
      'es': 'atrás',
      'fr': 'dos',
    },
    'gr093e0d': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ForgotPass
  {
    '8xwi23a0': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
    },
    'ax3mwrz0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '0lpnh5xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    '0qht8p3m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8nrbmp0g': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    't0m2iwju': {
      'en': 'Back',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    '42pnql6x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SpecialOffers
  {
    'x73uvtvc': {
      'en': 'Students Discount 50%',
      'ar': 'خصم للطلاب 50%',
      'es': 'Descuento para estudiantes 50%',
      'fr': 'Rabais étudiants 50%',
    },
    '351h33s5': {
      'en': 'Elderly Discount 50%',
      'ar': 'خصم لكبار السن 50%',
      'es': 'Descuento para personas mayores 50%',
      'fr': 'Rabais pour les personnes âgées de 50 %',
    },
    'uf65fjyh': {
      'en': 'Disabled Discount 50%',
      'ar': 'خصم 50% للمعاقين',
      'es': 'Descuento para discapacitados 50%',
      'fr': 'Réduction pour personnes handicapées de 50 %',
    },
    'wbr5li05': {
      'en': 'Cancer Warriors Discount 50%',
      'ar': 'خصم 50% لمحاربي السرطان',
      'es': 'Descuento del 50% para guerreros contra el cáncer',
      'fr': 'Cancer Warriors - Rabais de 50 %',
    },
    'ei6ih26f': {
      'en': 'Special Offers',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'drtfgb0f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MetroStations
  {
    '7vjhfh9c': {
      'en': 'choose your  Station',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '929q1onz': {
      'en': 'Olaya Station',
      'ar': 'محطة العليا',
      'es': 'Estación de Olaya',
      'fr': 'Gare d\'Olaya',
    },
    'sdijbv0s': {
      'en': 'Transfer to Line 2',
      'ar': 'نقل إلى الخط 2',
      'es': 'Transferencia a la línea 2',
      'fr': 'Transfert vers la ligne 2',
    },
    '3n8wwlpg': {
      'en': 'King Abdullah Financial District',
      'ar': 'مركز الملك عبدالله المالي',
      'es': 'Distrito financiero del rey Abdullah',
      'fr': 'Quartier financier du roi Abdallah',
    },
    'a5ggc6ib': {
      'en': 'Business District',
      'ar': 'منطقة الأعمال',
      'es': 'Distrito comercial',
      'fr': 'Quartier des affaires',
    },
    '3ot0c0wu': {
      'en': 'Western Station',
      'ar': 'المحطة الغربية',
      'es': 'Estación del Oeste',
      'fr': 'Gare de l\'Ouest',
    },
    '9iearzgu': {
      'en': 'Transfer to Line 3',
      'ar': 'نقل إلى الخط 3',
      'es': 'Transferencia a la línea 3',
      'fr': 'Transfert vers la ligne 3',
    },
    'dye5a1ot': {
      'en': 'Al-Malaz',
      'ar': 'الملز',
      'es': 'Al-Malaz',
      'fr': 'Al-Malaz',
    },
    't2j5kjr6': {
      'en': 'Residential Area',
      'ar': 'منطقة سكنية',
      'es': 'Barrio residencial',
      'fr': 'Quartier résidentiel',
    },
    'bdhdsksd': {
      'en': 'back',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zcp7cypr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PaymentMethods
  {
    'zyjt25b5': {
      'en': 'Pleas choose payment method',
      'ar': 'الرجاء اختيار طريقة الدفع',
      'es': 'Por favor elija el método de pago',
      'fr': 'Veuillez choisir le mode de paiement',
    },
    'oa13kkrs': {
      'en': 'Apple Pay',
      'ar': 'آبل باي',
      'es': 'Pago de Apple',
      'fr': 'Apple Pay',
    },
    'lxb5fnja': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
      'es': 'Tarjeta de crédito',
      'fr': 'Carte de crédit',
    },
    '3iemoafb': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'Modes de paiement',
    },
    'fcu8uthh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    'ekmdo5ts': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'es': 'Cambiar idioma',
      'fr': 'Changer la langue',
    },
    'w6whsede': {
      'en': 'back',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'c49dobms': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpCenter
  {
    'nt9ezckm': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
    },
    'pvuurlly': {
      'en': 'What are the ticket fares for the Riyadh Metro?',
      'ar': 'ما هي أسعار تذاكر مترو الرياض؟',
      'es': '¿Cuáles son las tarifas de los billetes del metro de Riad?',
      'fr': 'Quels sont les tarifs des billets pour le métro de Riyad ?',
    },
    'qfe4p0hq': {
      'en': 'See details',
      'ar': 'شاهد التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'hi8h9zv6': {
      'en':
          'The Riyadh Metro offers different options depending on the passenger’s route requirements. In the introductory phase, fares for regular cabins will be:\n\n2-hour pass for SAR 4\n\n3-day pass for SAR 20\n\n7-day pass for SAR 40\n\n30-day pass for SAR 140 World',
      'ar':
          'يقدم مترو الرياض خيارات مختلفة حسب متطلبات الراكب في المسار. في المرحلة التمهيدية، ستكون أسعار المقصورات العادية:\n\nتذكرة لمدة ساعتين مقابل 4 ريالات سعودية\n\nتذكرة لمدة 3 أيام مقابل 20 ريالاً سعوديًا\n\nتذكرة لمدة 7 أيام مقابل 40 ريالاً سعوديًا\n\nتذكرة لمدة 30 يومًا مقابل 140 ريالًا سعوديًا',
      'es':
          'El metro de Riad ofrece distintas opciones en función de los requisitos de ruta del pasajero. En la fase de introducción, las tarifas para las cabinas regulares serán:\n\nPase de 2 horas por 4 SAR\n\nPase de 3 días por 20 SAR\n\nPase de 7 días por 40 SAR\n\nPase de 30 días por 140 SAR',
      'fr':
          'Le métro de Riyad propose différentes options en fonction des besoins des passagers en matière d\'itinéraire. Dans la phase de lancement, les tarifs des cabines régulières seront les suivants :\n\nPass 2 heures pour 4 SAR\n\nPass 3 jours pour 20 SAR\n\nPass 7 jours pour 40 SAR\n\nPass 30 jours pour 140 SAR',
    },
    'mu8r8e43': {
      'en': 'Do children need a ticket?',
      'ar': 'هل يحتاج الأطفال إلى تذكرة؟',
      'es': '¿Los niños necesitan una entrada?',
      'fr': 'Les enfants ont-ils besoin d’un billet ?',
    },
    'jefwosow': {
      'en': 'See details',
      'ar': 'شاهد التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '1aibumi4': {
      'en':
          'Children below the age of six can ride the metro for free, but they must be accompanied by an adult',
      'ar':
          'يمكن للأطفال دون سن السادسة ركوب المترو مجانًا، ولكن يجب أن يكونوا برفقة شخص بالغ',
      'es':
          'Los niños menores de seis años pueden viajar en el metro gratis, pero deben estar acompañados por un adulto.',
      'fr':
          'Les enfants de moins de six ans peuvent voyager gratuitement dans le métro, mais ils doivent être accompagnés d\'un adulte.',
    },
    '6783jb7t': {
      'en': 'Where can I buy my ticket?',
      'ar': 'أين يمكنني شراء تذكرتي؟',
      'es': '¿Donde puedo comprar mi entrada?',
      'fr': 'Où puis-je acheter mon billet ?',
    },
    'xfdaxcq4': {
      'en': 'See details',
      'ar': 'شاهد التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '5wtulib1': {
      'en':
          'There are several ways to purchase a ticket: From any ticket office at all metro stations Through the darb app Using a contactless bank card, Apple Pay, or Mada Pay to check in and out at the metro gates',
      'ar':
          'هناك عدة طرق لشراء التذكرة: من أي مكتب تذاكر في جميع محطات المترو من خلال تطبيق درب باستخدام بطاقة بنكية بدون تلامس أو Apple Pay أو Mada Pay لتسجيل الدخول والخروج عند بوابات المترو',
      'es':
          'Hay varias formas de comprar un billete: Desde cualquier taquilla de todas las estaciones de metro A través de la aplicación darb Utilizando una tarjeta bancaria sin contacto, Apple Pay o Mada Pay para registrarse en las puertas del metro',
      'fr':
          'Il existe plusieurs façons d\'acheter un billet : Depuis n\'importe quel guichet de toutes les stations de métro Via l\'application darb En utilisant une carte bancaire sans contact, Apple Pay ou Mada Pay pour l\'enregistrement et le retrait aux portes du métro',
    },
    'ydthq3sf': {
      'en': 'How can I pay for my ticket on the Salek app?',
      'ar': 'كيف يمكنني دفع ثمن تذكرتي على تطبيق Salek؟',
      'es': '¿Cómo puedo pagar mi boleto en la aplicación de Salek?',
      'fr': 'Comment puis-je payer mon billet sur l\'application Salek ?',
    },
    'wxwq2ol6': {
      'en': 'See details',
      'ar': 'شاهد التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    '1eh1rkzn': {
      'en':
          'You can pay using any of the following methods: Apple Pay (iOS) Credit/debit card (Mada, Visa, Mastercard)',
      'ar':
          'يمكنك الدفع باستخدام أي من الطرق التالية: Apple Pay (iOS) بطاقة الائتمان/الخصم (Mada، Visa، Mastercard)',
      'es':
          'Puede pagar utilizando cualquiera de los siguientes métodos: Apple Pay (iOS) Tarjeta de crédito/débito (Mada, Visa, Mastercard)',
      'fr':
          'Vous pouvez payer en utilisant l\'une des méthodes suivantes : Apple Pay (iOS) Carte de crédit/débit (Mada, Visa, Mastercard)',
    },
    'smwebmhh': {
      'en': 'Can cash be used at the TVM to buy tickets?',
      'ar': 'هل يمكن استخدام النقود في TVM لشراء التذاكر؟',
      'es':
          '¿Se puede utilizar dinero en efectivo para comprar entradas en el TVM?',
      'fr':
          'Peut-on utiliser de l\'argent liquide au TVM pour acheter des billets ?',
    },
    'wr9flpxj': {
      'en': 'See details',
      'ar': 'شاهد التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
    },
    'dj8sdaku': {
      'en':
          'Yes, banknotes (cash) can be used to buy tickets at Ticket Vending Machines (TVMs). Please note that coins are not accepted.',
      'ar':
          'نعم، يمكن استخدام الأوراق النقدية لشراء التذاكر من خلال ماكينات بيع التذاكر. يرجى ملاحظة أن العملات المعدنية غير مقبولة.',
      'es':
          'Sí, se pueden utilizar billetes (efectivo) para comprar billetes en las máquinas expendedoras de billetes. Tenga en cuenta que no se aceptan monedas.',
      'fr':
          'Oui, les billets de banque (espèces) peuvent être utilisés pour acheter des billets aux distributeurs automatiques de billets (TAB). Veuillez noter que les pièces de monnaie ne sont pas acceptées.',
    },
    'ya4djg78': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'hcgfytcg': {
      'en': 'demo@email.com',
      'ar': 'العرض التوضيحي@البريد الإلكتروني.com',
      'es': 'demo@email.com',
      'fr': 'demo@email.com',
    },
    'a5tld2lw': {
      'en':
          'The Riyadh Metro offers different options depending on the passenger’s route requirements. In the introductory phase, fares for regular cabins will be:\n\n2-hour pass for SAR 4\n\n3-day pass for SAR 20\n\n7-day pass for SAR 40\n\n30-day pass for SAR 140',
      'ar':
          'يقدم مترو الرياض خيارات مختلفة حسب متطلبات الراكب في المسار. في المرحلة التمهيدية، ستكون أسعار الكبائن العادية:\n\nتذكرة لمدة ساعتين مقابل 4 ريالات سعودية\n\nتذكرة لمدة 3 أيام مقابل 20 ريالاً سعوديًا\n\nتذكرة لمدة 7 أيام مقابل 40 ريالاً سعوديًا\n\nتذكرة لمدة 30 يومًا مقابل 140 ريالًا سعوديًا',
      'es':
          'El metro de Riad ofrece distintas opciones en función de las necesidades de los pasajeros. En la fase de introducción, las tarifas para las cabinas regulares serán:\n\nAbono de 2 horas por 4 SAR\n\nAbono de 3 días por 20 SAR\n\nAbono de 7 días por 40 SAR\n\nAbono de 30 días por 140 SAR',
      'fr':
          'Le métro de Riyad propose différentes options en fonction des besoins des passagers en matière d\'itinéraire. Dans la phase de lancement, les tarifs des cabines régulières seront les suivants :\n\nPass 2 heures pour 4 SAR\n\nPass 3 jours pour 20 SAR\n\nPass 7 jours pour 40 SAR\n\nPass 30 jours pour 140 SAR',
    },
    'p4i85uig': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    '5l5shah5': {
      'en': 'Phone Number',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'uu1467qg': {
      'en': 'Dial 19933',
      'ar': 'اتصل بالرقم 19933',
      'es': 'Marque 19933',
      'fr': 'Composez le 19933',
    },
    'tqhl059h': {
      'en': 'Email us',
      'ar': 'راسلنا عبر البريد الإلكتروني',
      'es': 'Envíenos un correo electrónico',
      'fr': 'Envoyez-nous un e-mail',
    },
    'xzvfpx18': {
      'en': 'customercare@riyadhbus.sa',
      'ar': 'خدمة العملاء@riyadhbus.sa',
      'es': 'atención al cliente@riyadhbus.sa',
      'fr': 'customercare@riyadhbus.sa',
    },
    '3r368foz': {
      'en': 'Feedback',
      'ar': 'تعليق',
      'es': 'Comentario',
      'fr': 'Retour',
    },
    '53pgw937': {
      'en': 'Type your message here',
      'ar': 'اكتب رسالتك هنا',
      'es': 'Escribe tu mensaje aquí',
      'fr': 'Tapez votre message ici',
    },
    'd8auhasc': {
      'en': 'submit',
      'ar': 'يُقدِّم',
      'es': 'entregar',
      'fr': 'soumettre',
    },
    'n5d3cyb1': {
      'en': 'back',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dryehphj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Signup
  {
    'mz8abh0p': {
      'en': 'Sign up with Twitter',
      'ar': 'سجل باستخدام تويتر',
      'es': 'Regístrate con Twitter',
      'fr': 'Inscrivez-vous avec Twitter',
    },
    '96858cxs': {
      'en': 'Sign up with Facebook',
      'ar': 'سجل باستخدام الفيسبوك',
      'es': 'Regístrate con Facebook',
      'fr': 'Inscrivez-vous avec Facebook',
    },
    'vhkd6gei': {
      'en': 'Sign up with instagram',
      'ar': 'سجل باستخدام الانستجرام',
      'es': 'Regístrate con Instagram',
      'fr': 'Inscrivez-vous avec Instagram',
    },
    'wlduic05': {
      'en':
          'By Signing in with Social Media you also agree to the Terms of Service and Privacy Policy',
      'ar':
          'من خلال تسجيل الدخول باستخدام وسائل التواصل الاجتماعي فإنك توافق أيضًا على شروط الخدمة وسياسة الخصوصية',
      'es':
          'Al iniciar sesión con las redes sociales, también acepta los Términos de servicio y la Política de privacidad.',
      'fr':
          'En vous connectant avec les réseaux sociaux, vous acceptez également les conditions d\'utilisation et la politique de confidentialité.',
    },
    '47xz05hf': {
      'en': 'Sign up with Social Media',
      'ar': 'التسجيل باستخدام وسائل التواصل الاجتماعي',
      'es': 'Regístrate con las redes sociales',
      'fr': 'Inscrivez-vous avec les réseaux sociaux',
    },
    '5vjbd6pc': {
      'en': 'back',
      'ar': 'خلف',
      'es': 'atrás',
      'fr': 'dos',
    },
    '4kthvvdn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // metro
  {
    '0abr1l5s': {
      'en': 'stations',
      'ar': 'محطات',
      'es': 'estaciones',
      'fr': 'stations',
    },
    '05x2ti7r': {
      'en': 'Blue Route ',
      'ar': 'الطريق الأزرق',
      'es': 'Ruta Azul',
      'fr': 'Route Bleue',
    },
    '4p5grqgn': {
      'en': 'البنك الاول - الدار البيضاء',
      'ar': 'البنك الاول - الدار البيضاء',
      'es': 'البنك الاول - الدار البيضاء',
      'fr': 'البنك الاول - الدار البيضاء',
    },
    '28644fij': {
      'en': 'Red Route ',
      'ar': 'الطريق الأحمر',
      'es': 'Ruta roja',
      'fr': 'Route Rouge',
    },
    '37lj2mzd': {
      'en': 'جامعه الملك سعود- مدينه الملك فهد الرياضيه',
      'ar': 'جامعه الملك سعود- مدينه الملك فهد الرياضيه',
      'es': 'جامعه الملك سعود- مدينه الملك فهد الرياضيه',
      'fr': 'جامعه الملك سعود- مدينه الملك فهد الرياضيه',
    },
    'xzjb4unv': {
      'en': 'Green Route ',
      'ar': 'الطريق الأخضر',
      'es': 'Ruta verde',
      'fr': 'La Route Verte',
    },
    '35a9vc31': {
      'en': 'وزاره التعليم - المتحف الوطني',
      'ar': 'وزاره التعليم - المتحف الوطني',
      'es': 'وزاره التعليم - المتحف الوطني',
      'fr': 'وزاره التعليم - المتحف الوطني',
    },
    'p4vmznnz': {
      'en': 'Orange Route ',
      'ar': 'الطريق البرتقالي',
      'es': 'Ruta Naranja',
      'fr': 'Route Orange',
    },
    'y6qxpi9o': {
      'en': 'طريق جده - خشم العان',
      'ar': 'طريق جده - خشم العان',
      'es': 'طريق جده - خشم العان',
      'fr': 'طريق جده - خشم العان',
    },
    '5uqxlubu': {
      'en': 'Purple Route ',
      'ar': 'الطريق الأرجواني',
      'es': 'Ruta Púrpura',
      'fr': 'Route violette',
    },
    '9d3y1dur': {
      'en': 'المركز المالي - النسيم',
      'ar': 'المركز المالي - النسيم',
      'es': 'المركز المالي - النسيم',
      'fr': 'المركز المالي - النسيم',
    },
    'zwgrbcbq': {
      'en': 'Yellow Route ',
      'ar': 'الطريق الأصفر',
      'es': 'Ruta amarilla',
      'fr': 'Itinéraire Jaune',
    },
    'jokgzxrb': {
      'en': 'الصالة 1-2 - المركز المالي',
      'ar': '1-2 - المركز المالي',
      'es': 'الصالة 1-2 - المركز المالي',
      'fr': 'الصالة 1-2 - المركز المالي',
    },
    'uw2igivv': {
      'en': 'Metro Routes',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    'fzzstjre': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Blueroute
  {
    '3cj7ajsm': {
      'en': 'البنك الاول',
      'ar': 'البنك الاول',
      'es': 'El amor es mío',
      'fr': 'البنك الاول',
    },
    'bln3mncz': {
      'en': 'د.سليمان الحبيب',
      'ar': 'د.سليمان الحبيب',
      'es': 'د.سليمان الحبيب',
      'fr': 'د.سليمان الحبيب',
    },
    'jran4l8s': {
      'en': ' المركز المالي',
      'ar': 'المركز المالي',
      'es': 'El hombre más rico',
      'fr': 'المركز المالي',
    },
    '3xi4rnkk': {
      'en': ' المروج',
      'ar': 'المروج',
      'es': 'المروج',
      'fr': 'المروج',
    },
    'uwlo6igr': {
      'en': 'حي الملك فهد',
      'ar': 'حي الملك فهد',
      'es': 'Hay un problema',
      'fr': 'حي الملك فهد',
    },
    'jg7pbt1z': {
      'en': 'حي الملك فهد 2',
      'ar': 'حي الملك فهد 2',
      'es': 'Hay 2',
      'fr': 'Je suis à 2',
    },
    '2ct5279p': {
      'en': 'stc',
      'ar': 'إس تي سي',
      'es': 'C.T.C.',
      'fr': 'STC',
    },
    'vehjr6hl': {
      'en': 'الورود 2',
      'ar': 'الورود 2',
      'es': 'Página 2',
      'fr': 'الورود 2',
    },
    'zpugtlmz': {
      'en': 'العروبة',
      'ar': 'العروبة',
      'es': 'العروبة',
      'fr': 'العروبة',
    },
    'peve8eqv': {
      'en': 'مصرف الانماء',
      'ar': 'مصرف الانماء',
      'es': 'مصرف الانماء',
      'fr': 'مصرف الانماء',
    },
    'uy2pm8qv': {
      'en': 'بنك البلاد',
      'ar': 'بنك البلاد',
      'es': 'Por favor, avísame',
      'fr': 'Merci pour votre compréhension.',
    },
    'yi0xmezm': {
      'en': 'مكتبة الملك فهد',
      'ar': 'مكتبة الملك فهد',
      'es': 'El dinero está en juego',
      'fr': 'مكتبة الملك فهد',
    },
    'fsno36gc': {
      'en': 'وزارة الداخلية',
      'ar': 'وزارة الداخلية',
      'es': 'الداخلية الداخلية',
      'fr': 'et الداخلية',
    },
    'n4fst2p6': {
      'en': 'المربع',
      'ar': 'المربع',
      'es': 'المربع',
      'fr': 'المربع',
    },
    'bf0hm89w': {
      'en': ' الجوازات',
      'ar': 'الجوازات',
      'es': 'الجوازات',
      'fr': 'الجوازات',
    },
    'tu2giuuj': {
      'en': 'المتحف الوطني',
      'ar': 'المتحف الوطني',
      'es': 'El secreto está en ti',
      'fr': 'المتحف الوطني',
    },
    'lwrn2b34': {
      'en': 'البطحاء',
      'ar': 'البطحاء',
      'es': 'البطحاء',
      'fr': 'البطحاء',
    },
    '03v8wxg0': {
      'en': 'العود',
      'ar': 'العود',
      'es': 'claro',
      'fr': 'العود',
    },
    't11svah9': {
      'en': 'سكيرينة',
      'ar': 'سكيرينة',
      'es': 'سكيرينة',
      'fr': 'سكيرينة',
    },
    '5grrsrzl': {
      'en': 'منفوحة',
      'ar': 'منفوحة',
      'es': 'منفوحة',
      'fr': 'منفوحة',
    },
    '7jhzrr4k': {
      'en': 'مستشفى الايمان',
      'ar': 'مستشفى الايمان',
      'es': 'مستشفى الايمان',
      'fr': 'مستشفى الايمان',
    },
    '27289lqw': {
      'en': 'مركز النقل العام',
      'ar': 'مركز النقل العام',
      'es': 'مركز النقل العام',
      'fr': 'مركز النقل العام',
    },
    'pdzcer5r': {
      'en': 'العزيزية',
      'ar': 'عزيزة',
      'es': 'العزيزية',
      'fr': 'العزيزية',
    },
    'bbyrqh32': {
      'en': 'الدار البيضاء',
      'ar': 'الدار البيضاء',
      'es': 'El amor es grande',
      'fr': 'الدار البيضاء',
    },
    '4uw4077a': {
      'en': 'Blue Route',
      'ar': 'الطريق الأزرق',
      'es': 'Ruta Azul',
      'fr': 'Route Bleue',
    },
    'c0i0b1d0': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // RedRoute
  {
    'hi4kvaox': {
      'en': 'جامعة الملك سعود',
      'ar': 'جامعة الملك سعود',
      'es': 'جامعة الملك سعود',
      'fr': 'جامعة الملك سعود',
    },
    'dtjd0fp2': {
      'en': ' واحة الملك سلمان',
      'ar': 'واحة الملك سلمان',
      'es': 'واحة الملك سلمان',
      'fr': 'واحة الملك سلمان',
    },
    '3rdsuoov': {
      'en': 'المدينة التقنية ',
      'ar': 'المدينة التقنية',
      'es': 'El secreto está en ti',
      'fr': 'المدينة التقنية',
    },
    'q47zdxug': {
      'en': 'التخصصي',
      'ar': 'تخصصي',
      'es': 'التخصصي',
      'fr': 'التخصصي',
    },
    'jgintmez': {
      'en': 'stc',
      'ar': 'إس تي سي',
      'es': 'C.T.C.',
      'fr': 'STC',
    },
    '9utpgvc2': {
      'en': 'الورود',
      'ar': 'الورود',
      'es': 'الورود',
      'fr': 'الورود',
    },
    'h1y5wq22': {
      'en': 'طريق الملك عبدالعزيز',
      'ar': 'طريق الملك عبدالعزيز',
      'es': 'طريق الملك عبدالعزيز',
      'fr': 'طريق الملك عبدالعزيز',
    },
    '3pxw4hve': {
      'en': 'وزارة التعليم',
      'ar': 'وزارة التعليم',
      'es': 'التعليم التعليم التعليم',
      'fr': 'et la vérité',
    },
    'r0ksrn34': {
      'en': 'النزهة',
      'ar': 'النزهة',
      'es': 'النزهة',
      'fr': 'النزهة',
    },
    '2d96u685': {
      'en': 'مركز الرياض للمعارض',
      'ar': 'مركز الرياض للمعارض',
      'es': 'مركز الرياض للمعارض',
      'fr': 'مركز الرياض للمعارض',
    },
    'f4q9p0om': {
      'en': 'طريق خالد بن الوليد',
      'ar': 'طريق خالد بن الوليد',
      'es': 'طريق خالد بن الوليد',
      'fr': 'طريق خالد بن الوليد',
    },
    'a8web16y': {
      'en': 'الحمراء',
      'ar': 'احمر',
      'es': 'الحمراء',
      'fr': 'الحمراء',
    },
    'uc3yr8ot': {
      'en': 'الخليج',
      'ar': 'الخليج',
      'es': 'الخليج',
      'fr': 'الخليج',
    },
    'exz1f527': {
      'en': 'اشبيليا',
      'ar': 'اشبيليا',
      'es': 'اشبيليا',
      'fr': 'اشبيليا',
    },
    '5d800mao': {
      'en': 'مدينة الملك فهد الرياضية',
      'ar': 'مدينة الملك فهد الرياضية',
      'es': 'مدينة الملك فهد الرياضية',
      'fr': 'مدينة الملك فهد الرياضية',
    },
    'b375aaum': {
      'en': 'Red Route',
      'ar': 'الطريق الأحمر',
      'es': 'Ruta roja',
      'fr': 'Route Rouge',
    },
    '659jv1zd': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // GreenRoute
  {
    'qbfodkut': {
      'en': 'وزارة التعليم',
      'ar': 'وزارة التعليم',
      'es': 'التعليم التعليم التعليم',
      'fr': 'et la vérité',
    },
    'tqhqjl0g': {
      'en': ' حديقة الملك سلمان',
      'ar': 'حديقة الملك سلمان',
      'es': 'حديقة الملك سلمان',
      'fr': 'حديقة الملك سلمان',
    },
    '9ymipuyv': {
      'en': 'السليمانية',
      'ar': 'السليمانية',
      'es': 'السليمانية',
      'fr': 'السليمانية',
    },
    'rxd7h6k2': {
      'en': 'الضباب',
      'ar': 'الضباب',
      'es': 'الضباب',
      'fr': 'الضباب',
    },
    'xtdzy1rb': {
      'en': 'ميدان أبو ظبي',
      'ar': 'ميدان ابو ظبي',
      'es': 'El dinero está perdido',
      'fr': 'ميدان أبو ظبي',
    },
    '0dpw5bml': {
      'en': 'نادي الضباط',
      'ar': 'نادي الضباط',
      'es': 'نادي الضباط',
      'fr': 'Je suis désolé',
    },
    '0gkbta26': {
      'en': 'التأمينات الاجتماعية',
      'ar': 'التأمينات الاجتماعية',
      'es': 'التأمينات الاجتماعية',
      'fr': 'التأمينات الاجتماعية',
    },
    'tkxjd4th': {
      'en': 'الوزارات',
      'ar': 'الوزارات',
      'es': 'الوزارات',
      'fr': 'الوزارات',
    },
    'mjswtjpe': {
      'en': 'وزارة الدفاع',
      'ar': 'وزارة الدفاع',
      'es': 'الدفاع الدفاع',
      'fr': 'et la vérité',
    },
    'bjaaj009': {
      'en': 'مستشفى الملك عبد العزيز',
      'ar': 'مستشفى الملك عبد العزيز',
      'es': 'مستشفى الملك عبد العزيز',
      'fr': 'مستشفى الملك عبد العزيز',
    },
    'n57ua3z8': {
      'en': 'وزارة المالية',
      'ar': 'وزارة المالية',
      'es': 'المالية المالية',
      'fr': 'et المالية',
    },
    'dox5rs0k': {
      'en': 'المتحف الوطني',
      'ar': 'المتحف الوطني',
      'es': 'El secreto está en ti',
      'fr': 'المتحف الوطني',
    },
    'hhglzdur': {
      'en': 'Green Route',
      'ar': 'الطريق الأخضر',
      'es': 'Ruta verde',
      'fr': 'La Route Verte',
    },
    'qb8ee4n9': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OrangeRoute
  {
    '72efss31': {
      'en': 'طريق جده',
      'ar': 'طريق جده',
      'es': 'طريق جده',
      'fr': 'طريق جده',
    },
    '4t5uwebx': {
      'en': 'طويق',
      'ar': 'طويق',
      'es': 'طويق',
      'fr': 'طويق',
    },
    'rw8hgkhp': {
      'en': 'الدوح',
      'ar': 'الدوح',
      'es': 'الدوح',
      'fr': 'الدوح',
    },
    'jaaokycr': {
      'en': 'ظهره البديعة',
      'ar': 'ظهر البديعة',
      'es': 'ظهره البديعة',
      'fr': 'ظهره البديعة',
    },
    'bllfw544': {
      'en': 'الجرادية',
      'ar': 'الجرادية',
      'es': 'الجرادية',
      'fr': 'الجرادية',
    },
    '61dtwifn': {
      'en': 'الحلة',
      'ar': 'الحلة',
      'es': 'الحلة',
      'fr': 'الحلة',
    },
    '2nqrxgn2': {
      'en': 'المدينة الصناعية الأولى',
      'ar': 'المدينة الصناعية الأولى',
      'es': 'المدينة الصناعية الأولى',
      'fr': 'المدينة الصناعية الأولى',
    },
    '3lgl5tan': {
      'en': 'طريق هارون الرشيد',
      'ar': 'طريق هارون الرشيد',
      'es': 'طريق هارون الرشيد',
      'fr': 'طريق هارون الرشيد',
    },
    '7jom3y65': {
      'en': 'النسيم',
      'ar': 'النسيم',
      'es': 'النسيم',
      'fr': 'النسيم',
    },
    '4atmob58': {
      'en': 'Orange Route',
      'ar': 'الطريق البرتقالي',
      'es': 'Ruta Naranja',
      'fr': 'Route Orange',
    },
    '2tvz91rz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // payment
  {
    '6w121v1s': {
      'en': 'Payment Confirmed!',
      'ar': 'تم تأكيد الدفع!',
      'es': '¡Pago confirmado!',
      'fr': 'Paiement confirmé !',
    },
    'zx1dmkkw': {
      'en': '4 SAR',
      'ar': '4 ريال سعودي',
      'es': '4 SAR',
      'fr': '4 SAR',
    },
    '0fjmyd3w': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'ar':
          'لقد تم تأكيد الدفع الخاص بك، قد يستغرق الأمر من ساعة إلى ساعتين حتى تتم عملية الدفع الخاصة بك وتظهر في قائمة التحويلات الخاصة بك.',
      'es':
          'Su pago ha sido confirmado. Puede tomar entre 1 y 2 horas para que se procese y aparezca en su lista de transacciones.',
      'fr':
          'Votre paiement a été confirmé, cela peut prendre 1 à 2 heures pour que votre paiement soit effectué et apparaisse dans votre liste de transactions.',
    },
    'yj5hu9r3': {
      'en': 'Mastercard Ending in 4021',
      'ar': 'بطاقة ماستركارد تنتهي بالرقم 4021',
      'es': 'Mastercard que termina en 4021',
      'fr': 'Mastercard se terminant par 4021',
    },
    'xmaym1mf': {
      'en': '4 SAR',
      'ar': '4 ريال سعودي',
      'es': '4 SAR',
      'fr': '4 SAR',
    },
    'w97525q6': {
      'en': 'Go Home',
      'ar': 'العودة إلى المنزل',
      'es': 'Ir a casa',
      'fr': 'Rentrer à la maison',
    },
    '3yphe5ud': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // YellowRoute
  {
    'w7vjq2j9': {
      'en': 'الصالة 1-2',
      'ar': 'الحلقة 1-2',
      'es': 'Número 1-2',
      'fr': 'Notes 1-2',
    },
    '7i39dxp4': {
      'en': 'الصالة 3-4',
      'ar': 'الحلقة 3-4',
      'es': 'Fechas 3-4',
      'fr': 'Niveau 3-4',
    },
    'vnrc08k9': {
      'en': 'الصالة 5',
      'ar': 'الحلقة 5',
      'es': 'Número 5',
      'fr': 'الصالة 5',
    },
    'fhg1cilw': {
      'en': 'جامعة الأميرة نورة 2',
      'ar': 'جامعة الأميرة نورة 2',
      'es': 'جامعة الأميرة نورة 2',
      'fr': 'جامعة الأميرة نورة 2',
    },
    '7zwxtsfi': {
      'en': 'جامعة الأميرة نورة 1',
      'ar': 'جامعة الأميرة نورة 1',
      'es': 'جامعة الأميرة نورة 1',
      'fr': 'جامعة الأميرة نورة 1',
    },
    'tyq655pq': {
      'en': 'سابك',
      'ar': 'سابك',
      'es': 'سابك',
      'fr': 'سابك',
    },
    '3nqmag2a': {
      'en': 'طريق عثمان بن عفان',
      'ar': 'طريق عثمان بن عفان',
      'es': 'طريق عثمان بن عفان',
      'fr': 'طريق عثمان بن عفان',
    },
    'dawrp920': {
      'en': 'الربيع',
      'ar': 'الربيع',
      'es': 'árabe',
      'fr': 'الربيع',
    },
    'katpljz2': {
      'en': 'المركز المالي',
      'ar': 'المركز المالي',
      'es': 'El hombre más rico',
      'fr': 'المركز المالي',
    },
    'r9mob4b4': {
      'en': 'Yellow Route',
      'ar': 'الطريق الأصفر',
      'es': 'Ruta amarilla',
      'fr': 'Itinéraire Jaune',
    },
    '415zwyle': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PurpleRoute
  {
    'u90nfcta': {
      'en': 'المركز المالي',
      'ar': 'المركز المالي',
      'es': 'El hombre más rico del mundo',
      'fr': 'المركز المالي',
    },
    'y9qpl5mj': {
      'en': 'الربيع',
      'ar': 'الربيع',
      'es': 'árabe',
      'fr': 'الربيع',
    },
    'xovoum4p': {
      'en': 'طريق عثمان بن عفان',
      'ar': 'طريق عثمان بن عفان',
      'es': 'طريق عثمان بن عفان',
      'fr': 'طريق عثمان بن عفان',
    },
    'z29mn0s6': {
      'en': 'سابك',
      'ar': 'سابك',
      'es': 'سابك',
      'fr': 'سابك',
    },
    'kdeudxbs': {
      'en': 'غرناطية',
      'ar': 'غرناطية',
      'es': 'غرناطية',
      'fr': 'غرناطية',
    },
    'o0xbv4uy': {
      'en': 'اليرموك',
      'ar': 'اليرموك',
      'es': 'اليرموك',
      'fr': 'اليرموك',
    },
    'vv3065bh': {
      'en': 'الحمراء',
      'ar': 'احمر',
      'es': 'الحمراء',
      'fr': 'الحمراء',
    },
    's4sznu7m': {
      'en': 'الأندلس',
      'ar': 'الأندلس',
      'es': 'الأندلس',
      'fr': 'الأندلس',
    },
    '3pacdwt0': {
      'en': 'طريق خريص',
      'ar': 'طريق خريص',
      'es': 'El amor es grande',
      'fr': 'طريق خريص',
    },
    '8g2prndu': {
      'en': 'السلام',
      'ar': 'السلام',
      'es': 'السلام',
      'fr': 'السلام',
    },
    'ss2vc03f': {
      'en': 'النسيم',
      'ar': 'النسيم',
      'es': 'النسيم',
      'fr': 'النسيم',
    },
    '2uf7z696': {
      'en': 'Purple Route',
      'ar': 'الطريق الأرجواني',
      'es': 'Ruta Púrpura',
      'fr': 'Route violette',
    },
    '561sj2hk': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // pay
  {
    'x8sbnyd5': {
      'en': 'Payment Failed',
      'ar': 'فشل الدفع',
      'es': 'Pago fallido',
      'fr': 'Paiement échoué',
    },
    'a2c6006l': {
      'en': 'You need to fill in the card details ,Pleas try again \n',
      'ar': 'لقد تم إلغاء الدفع الخاص بك، يرجى المحاولة مرة أخرى!',
      'es': 'Su pago ha sido cancelado, ¡inténtelo nuevamente por favor!',
      'fr':
          'Votre paiement a été annulé, veuillez réessayer s\'il vous plaît !',
    },
    'k4sp2n24': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HomePage
  {
    'xsz9vlet': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
      'es': 'Página de inicio',
      'fr': 'Page d\'accueil',
    },
    'qr4ne9r4': {
      'en':
          'أهلًا وسهلًا في سالك! رحلتك تبدأ بخطوة، احجز تذكرتك الآن واستمتع بالطريق الأسهل\nWelcome to Salik! Your journey starts with a step ,book your ticket now and enjoy the easiest way to travel!',
      'ar':
          'أهلًا وسهلًا في سالك! بدأت تبدأ، احجز تذكرتك الآن لتحديد الطريق\nمرحبا بكم في سالك! رحلتك تبدأ بخطوة، احجز تذكرتك الآن واستمتع بأسهل طريقة للسفر!',
      'es':
          'أهلًا وسهلًا في سالك! رحلتك تبدأ بخطوة، احجز تذكرتك الآن واستمتع بالطريق الأسهل\n¡Bienvenidos a Salik! Tu viaje comienza con un paso, ¡reserva tu billete ahora y disfruta de la forma más fácil de viajar!',
      'fr':
          'أهلًا وسهلًا في سالك! رحلتك تبدأ بخطوة، احجز تذكرتك الآن واستمتع بالطريق الأسهل\nBienvenue à Salik ! Votre voyage commence par une étape, réservez votre billet maintenant et profitez de la façon la plus simple de voyager !',
    },
    'rwd0ex92': {
      'en': 'Language',
      'ar': 'حجز التذاكر',
      'es': 'Reserva de entradas',
      'fr': 'Réservation de billets',
    },
    'd1stptb2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1tp65h2r': {
      'en': 'Special Offers!',
      'ar': 'عروض خاصة!',
      'es': '¡Ofertas especiales!',
      'fr': 'Offres spéciales!',
    },
    '7jndm26o': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4n0hlsn6': {
      'en': 'Choose What You Want to See:',
      'ar': 'اختر ما تريد رؤيته:',
      'es': 'Elige lo que quieres ver:',
      'fr': 'Choisissez ce que vous voulez voir :',
    },
    'rx1bhmsa': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    'e9yo5y0i': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'snjmoxrq': {
      'en': 'Ticket Booking',
      'ar': 'حجز التذاكر',
      'es': 'Reserva de entradas',
      'fr': 'Réservation de billets',
    },
    'ys26kc2a': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6oz4lvkk': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // cartpage
  {
    'm01h4fud': {
      'en': 'Ticket',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    '50g0a3wv': {
      'en': '2-Hours Ticket\n\n4 SAR',
      'ar': 'تذكرة لمدة ساعتين\n\n4 ريال سعودي',
      'es': 'Billete de 2 horas\n\n4 SAR',
      'fr': 'Billet de 2 heures\n\n4 SAR',
    },
    '92xht82z': {
      'en': '3-Day Ticket\n\n20 SAR',
      'ar': 'تذكرة لمدة 3 أيام\n\n20 ريال سعودي',
      'es': 'Billete de 3 días\n\n20 SAR',
      'fr': 'Billet 3 jours\n\n20 SAR',
    },
    'o3hwpiy4': {
      'en': '7-Day Ticket\n\n40 SAR',
      'ar': 'تذكرة لمدة 7 أيام\n\n40 ريال سعودي',
      'es': 'Billete de 7 días\n\n40 SAR',
      'fr': 'Billet de 7 jours\n\n40 SAR',
    },
    'zatrze03': {
      'en': 'Click here for special tickets!',
      'ar': 'انقر هنا للحصول على التذاكر الخاصة!',
      'es': '¡Haga clic aquí para obtener entradas especiales!',
      'fr': 'Cliquez ici pour des billets spéciaux !',
    },
    '4x0nz2y9': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'ykr0n0r5': {
      'en': '30-Day Ticket\n\n140 SAR',
      'ar': 'تذكرة لمدة 30 يومًا\n\n140 ريال سعودي',
      'es': 'Billete de 30 días\n\n140 SAR',
      'fr': 'Billet de 30 jours\n\n140 SAR',
    },
    'no9q2tmp': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TicketOffers
  {
    'st3xi0hq': {
      'en': 'Ticket Offers',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    'j6ig63wv': {
      'en': 'Students ticket\n2 SAR',
      'ar': '',
      'es': '',
      'fr': '',
    },
    't92dmb2d': {
      'en': 'Elderly ticket\n2 SAR',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'gm23p8mz': {
      'en': 'Disabled ticket\n2 SAR',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0w9b8mq0': {
      'en': 'Cancer Warriors\n ticket\n2 SAR',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'gs2of2uf': {
      'en': 'Checkout',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'c843o7v8': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // applepay
  {
    'b04bvfvh': {
      'en': 'back',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    'thoa0prq': {
      'en':
          ' \"Apple Pay is currently unavailable, but we are working on adding it soon to enhance your experience. Thank you for your patience!\"\n\n\n\n\n\n\n',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dl61w2sm': {
      'en': 'Pleas try another Payment Method',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '68gl2l2u': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // pay2
  {
    '31umaavu': {
      'en': 'Card Information',
      'ar': 'تذكرة',
      'es': 'Boleto',
      'fr': 'Billet',
    },
    '43219fcx': {
      'en': 'confirm payment',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'foir5d34': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Header
  {
    'ejr5ymnl': {
      'en': 'Back',
      'ar': 'خلف',
      'es': 'Atrás',
      'fr': 'Dos',
    },
  },
  // onBoardComplete_modal
  {
    'prn4cih5': {
      'en': 'Congratulations!',
      'ar': 'مبروك!',
      'es': '¡Felicidades!',
      'fr': 'Félicitations!',
    },
    '7y5lbqhc': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. سيتم إعادة توجيهك إلى الصفحة الرئيسية في غضون ثوانٍ قليلة.',
      'es':
          'Su cuenta está lista para usar. Será redirigido a la página de inicio en unos segundos.',
      'fr':
          'Votre compte est prêt à être utilisé. Vous serez redirigé vers la page d\'accueil dans quelques secondes.',
    },
  },
  // HeaderProfile
  {
    'kpcuyrzl': {
      'en': 'Good Morning 👋',
      'ar': 'صباح الخير 👋',
      'es': 'Buenos días 👋',
      'fr': 'Bonjour 👋',
    },
    'xeo7oa3y': {
      'en': 'Andrew Ainsley',
      'ar': 'أندرو أينسلي',
      'es': 'Andrés Ainsley',
      'fr': 'Andrew Ainsley',
    },
  },
  // ProductItem
  {
    'fquf478k': {
      'en': ' sold',
      'ar': 'مُباع',
      'es': 'vendido',
      'fr': 'vendu',
    },
  },
  // SpecialOffersItem
  {
    'r2kf44eg': {
      'en': ' %',
      'ar': '%',
      'es': '%',
      'fr': '%',
    },
  },
  // SortAndFilterModal37
  {
    't4fcdpd6': {
      'en': 'Sort & Filter',
      'ar': 'فرز وتصفية',
      'es': 'Ordenar y filtrar',
      'fr': 'Trier et filtrer',
    },
    'svtegslf': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'uhjy6l7k': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'xmy7kwv8': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'ul0qwfmp': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Gama de precios',
      'fr': 'Gamme de prix',
    },
    '3dznnynk': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'ox1xjq86': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'bycm9h11': {
      'en': 'Sort By',
      'ar': 'فرز حسب',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'pdnb4849': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    'e7l9xvaw': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Lo más reciente',
      'fr': 'Le plus récent',
    },
    '8hnkgb4f': {
      'en': 'Rating',
      'ar': 'تصنيف',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    'rohyjnig': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'cq6n9owh': {
      'en': '5',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    '08bjsrur': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    '528bcv9p': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
    },
  },
  // Review
  {
    'ivxsdktc': {
      'en': '4.4',
      'ar': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
  },
  // productInCard
  {
    'jjfgh6ew': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'al5ea7s5': {
      'en': 'Size  = ',
      'ar': 'الحجم =',
      'es': 'Tamaño =',
      'fr': 'Taille =',
    },
  },
  // RemoveFromCardConfirm
  {
    'pq99mh1o': {
      'en': 'Remove Product?',
      'ar': 'إزالة المنتج؟',
      'es': '¿Quitar producto?',
      'fr': 'Supprimer le produit ?',
    },
    'dhnacgix': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'es0xob3g': {
      'en': 'Yes, Remove',
      'ar': 'نعم، قم بإزالة',
      'es': 'Sí, eliminar',
      'fr': 'Oui, supprimer',
    },
  },
  // OrderItem
  {
    'k5z1lp7b': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
  },
  // ShippingItemRadioBTn
  {
    'zcgwtxr3': {
      'en': 'Blue Route',
      'ar': 'الطريق الأزرق',
      'es': 'Ruta Azul',
      'fr': 'Route Bleue',
    },
    'cdiayd09': {
      'en': 'الدار البيضاء-البنك الاول',
      'ar': 'الدار البيضاء-البنك الاول',
      'es': 'الدار البيضاء-البنك الاول',
      'fr': 'الدار البيضاء-البنك الاول',
    },
  },
  // AddPromoItem
  {
    'm6adkvge': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
    },
  },
  // CheckOutSuccessfulModal65
  {
    'huy1t7vw': {
      'en': 'Order Successful!',
      'ar': 'تم الطلب بنجاح!',
      'es': '¡Pedido realizado con éxito!',
      'fr': 'Commande réussie !',
    },
    'onl8csfz': {
      'en': 'You have successfully made order',
      'ar': 'لقد قمت بإجراء الطلب بنجاح',
      'es': 'Has realizado el pedido con éxito',
      'fr': 'Vous avez passé commande avec succès',
    },
    '5nsud8h1': {
      'en': 'View Order',
      'ar': 'عرض الطلب',
      'es': 'Ver pedido',
      'fr': 'Voir la commande',
    },
    '6pgr229g': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
  },
  // OrderOngoingItem
  {
    '5irw8aul': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'hb6m693k': {
      'en': '\$ ',
      'ar': 'دولار',
      'es': '\$',
      'fr': '\$',
    },
    '4tzvev7a': {
      'en': 'Leave Review',
      'ar': 'اترك مراجعة',
      'es': 'Dejar reseña',
      'fr': 'Laisser un avis',
    },
  },
  // OrderTrackItem
  {
    'wd9vey3j': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'shy2a38b': {
      'en': '\$ ',
      'ar': 'دولار',
      'es': '\$',
      'fr': '\$',
    },
  },
  // ReviewGive
  {
    'b167nkp3': {
      'en': 'Leave a Review',
      'ar': 'اترك تعليقا',
      'es': 'Deja una reseña',
      'fr': 'Laisser un avis',
    },
    'p4v8fyel': {
      'en': 'Please give your rating & also your review...',
      'ar': 'يرجى إعطاء تقييمك ومراجعتك أيضًا ...',
      'es': 'Por favor, danos tu calificación y también tu reseña...',
      'fr': 'S\'il vous plaît donnez votre note et aussi votre avis...',
    },
    'j2v4qpw3': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'أرسل نصًا مثل: منتج جيد جدًا والتسليم سريع!',
      'es': 'Texto similar a: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte Smoe comme : Très bon produit et livraison rapide !',
    },
    'pmb9suod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
    },
    'zjspktyl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'oe33acjy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zs6j4hc7': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
  },
  // TopUpSuccessfulModal75
  {
    '4szqetn3': {
      'en': 'Top Up Successful!',
      'ar': 'تمت عملية التعبئة بنجاح!',
      'es': '¡Recarga realizada con éxito!',
      'fr': 'Recharge réussie !',
    },
    'ewdqtrqz': {
      'en': 'You have successfully top up\ne-wallet for \$500',
      'ar': 'لقد قمت بنجاح بشحن محفظتك الإلكترونية بمبلغ 500 دولار',
      'es': 'Has recargado con éxito\nun monedero electrónico por \$500',
      'fr':
          'Vous avez réussi à recharger votre portefeuille électronique\npour 500 \$',
    },
    'en793tfo': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
    'u3wurren': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // E-ReceiptItem
  {
    'cf6c881o': {
      'en': 'Color',
      'ar': 'لون',
      'es': 'Color',
      'fr': 'Couleur',
    },
    'ln03i5vy': {
      'en': 'Qty = ',
      'ar': 'الكمية =',
      'es': 'Cantidad =',
      'fr': 'Qté =',
    },
    'pudj1h2p': {
      'en': 'Size = ',
      'ar': 'الحجم =',
      'es': 'Tamaño =',
      'fr': 'Taille =',
    },
  },
  // InviteItem
  {
    'sp71eqpn': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'egrx7d3t': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
  },
  // LogoutConfirm_Modal
  {
    'a68c7jwy': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
    },
    '50ivrv6h': {
      'en': 'Are you sure you want to log out?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'es': '¿Estás seguro que deseas cerrar la sesión?',
      'fr': 'Etes-vous sûr de vouloir vous déconnecter ?',
    },
    'p0z4sjdl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'a6j51z22': {
      'en': 'Yes, Logout',
      'ar': 'نعم، تسجيل الخروج',
      'es': 'Sí, cerrar sesión',
      'fr': 'Oui, déconnectez-vous',
    },
  },
  // InfoConfirm_Modal
  {
    '82i39xhd': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'x4zkf56d': {
      'en': 'Ok, I Undrestand!',
      'ar': 'حسنا، فهمت!',
      'es': 'Ok, ¡lo entiendo!',
      'fr': 'Ok, je comprends !',
    },
  },
  // MoneyCard
  {
    'gvgaw7l9': {
      'en': '**** **** **** ****',
      'ar': '**** **** **** ****',
      'es': '**** **** **** ****',
      'fr': '**** **** **** ****',
    },
  },
  // AddressAdd
  {
    'bxpbj9fp': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
    },
    'eb9q3bg6': {
      'en': 'Address Name',
      'ar': 'العنوان الاسم',
      'es': 'Dirección Nombre',
      'fr': 'Adresse Nom',
    },
    'frnvw3qd': {
      'en': 'Address name',
      'ar': 'اسم العنوان',
      'es': 'Nombre de la dirección',
      'fr': 'Nom de l\'adresse',
    },
    'ndpl9q5e': {
      'en': 'Address Details',
      'ar': 'تفاصيل العنوان',
      'es': 'Detalles de la dirección',
      'fr': 'Détails de l\'adresse',
    },
    'qb3e65w0': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
      'es': 'Seleccione Ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '2xpzfut9': {
      'en': 'Make this as the default address',
      'ar': 'اجعل هذا هو العنوان الافتراضي',
      'es': 'Establezca esta como la dirección predeterminada',
      'fr': 'Définir ceci comme adresse par défaut',
    },
    '5d9gdpwi': {
      'en': 'Add',
      'ar': 'يضيف',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
  },
  // PromoAdd
  {
    'vzaa7mk1': {
      'en': 'Select your promo',
      'ar': 'حدد العرض الترويجي الخاص بك',
      'es': 'Selecciona tu promoción',
      'fr': 'Sélectionnez votre promo',
    },
  },
  // paymentDetails
  {
    'ipuft43c': {
      'en': 'Checkout',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ix5c3jwe': {
      'en': 'Fill in the information below to place your order.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1usij4g3': {
      'en': 'Price Breakdown',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'k8xv33ca': {
      'en': 'Base Price',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ciks0idi': {
      'en': '\$156.00',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xkzkd14u': {
      'en': 'Taxes',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'phrlzjtu': {
      'en': '\$24.20',
      'ar': '',
      'es': '',
      'fr': '',
    },
    's5413ku4': {
      'en': 'Cleaning Fee',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'abjncmd5': {
      'en': '\$40.00',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'b8zqp5eh': {
      'en': 'Total',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xz4sur7e': {
      'en': '\$230.20',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'c1092v8d': {
      'en': 'Pay w/ Credit Card',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0o6r6mmn': {
      'en': 'Or use an option below',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'n9xs8azj': {
      'en': 'Apple Pay',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'x2pgcgon': {
      'en': 'Pay w/Paypal',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '3xcyhsnv': {
      'en': 'Next',
      'ar': 'التالي',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'wdaunoqs': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '2dwdc8yl': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '9cp9tnq9': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'r0k6dvu6': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '3ndtzya4': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    'swm6319t': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'gpzu150f': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'ip2a2o8v': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    '95svkunb': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'p3v8uoen': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    '1iw4e130': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Lo más reciente',
      'fr': 'Le plus récent',
    },
    'dk7ex8cx': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    'a5iqoo0f': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'أرسل نصًا مثل: منتج جيد جدًا والتسليم سريع!',
      'es': 'Texto similar a: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte Smoe comme : Très bon produit et livraison rapide !',
    },
    'lkrp1j91': {
      'en': '\$10',
      'ar': '10 دولار',
      'es': '\$10',
      'fr': '10 \$',
    },
    '6mrgpbz0': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
    'kvc2fy4j': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'zwg93n13': {
      'en': '2899 Summer Drive Taylor, PC 48180',
      'ar': '2899 Summer Drive Taylor, PC 48180',
      'es': '2899 Summer Drive Taylor, PC 48180',
      'fr': '2899 Summer Drive Taylor, PC 48180',
    },
    'b3knti0s': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'xvif1n69': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    '251gk4uv': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    'rh97ml0k': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    'rtt0s3ia': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'v3sxop9c': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'f4f5yys3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'qx03qhyp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yern1xc3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qpnabqqh': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'p22sdi5k': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wae4qhvi': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zjkwl8p2': {
      'en': 'This app requires contacts access to function properly.',
      'ar': 'يتطلب هذا التطبيق الوصول إلى جهات الاتصال ليعمل بشكل صحيح.',
      'es':
          'Esta aplicación requiere acceso a los contactos para funcionar correctamente.',
      'fr':
          'Cette application nécessite un accès aux contacts pour fonctionner correctement.',
    },
    'd87k0ap6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5uwt6n9y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l46gqdxp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hxhmmu6e': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ag0mlb7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fcu9zsgb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mi1gwhj1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vhpv466y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0tfvavw5': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'enrgbt0v': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tsig702z': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mqo0fjf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pbruw4is': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2ds938sx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'f8wsmlub': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aa27z1n2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rz28dduj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cq43nzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bpv17yg3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xw4eb2cb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'h9ohlmo6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'expiyj8r': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mbakdgif': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3ystj7r4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y65cdfga': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
