import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Catbreeds'**
  String get appName;

  /// No description provided for @appNotImage.
  ///
  /// In en, this message translates to:
  /// **'Sin Imagen'**
  String get appNotImage;

  /// No description provided for @appNotResult.
  ///
  /// In en, this message translates to:
  /// **'Sin Resultados'**
  String get appNotResult;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Buscar...'**
  String get searchLabel;

  /// No description provided for @cardLabelLink.
  ///
  /// In en, this message translates to:
  /// **'Más...'**
  String get cardLabelLink;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Años'**
  String get years;

  /// No description provided for @cardLabelIntelligence.
  ///
  /// In en, this message translates to:
  /// **'Inteligencia: '**
  String get cardLabelIntelligence;

  /// No description provided for @catListPageErrorLoadDataLabel.
  ///
  /// In en, this message translates to:
  /// **'Error al cargar los gatos: '**
  String get catListPageErrorLoadDataLabel;

  /// No description provided for @catDetailPageLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Descripción: '**
  String get catDetailPageLabelDescription;

  /// No description provided for @catDetailPageLabelCountry.
  ///
  /// In en, this message translates to:
  /// **'Nombre del pais: '**
  String get catDetailPageLabelCountry;

  /// No description provided for @catDetailPageLabelIntelligence.
  ///
  /// In en, this message translates to:
  /// **'Inteligencia: '**
  String get catDetailPageLabelIntelligence;

  /// No description provided for @catDetailPageLabelAdaptability.
  ///
  /// In en, this message translates to:
  /// **'Adaptabilidad: '**
  String get catDetailPageLabelAdaptability;

  /// No description provided for @catDetailPageLabelLifeSpan.
  ///
  /// In en, this message translates to:
  /// **'Tiempo de vida: '**
  String get catDetailPageLabelLifeSpan;

  /// No description provided for @catDetailPageLabelBreed.
  ///
  /// In en, this message translates to:
  /// **'Raza: '**
  String get catDetailPageLabelBreed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
