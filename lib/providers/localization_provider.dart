import 'dart:convert' show jsonDecode;
import 'package:changer_color/app.dart';
import 'package:changer_color/models/localization.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  static const localeEng = Locale('en');

  final _localizations = <Locale, Localization>{};

  Map<Locale, Localization> get localizations => _localizations;

  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  Localization get currentLocalization => _localizations[_currentLocale]!;

  Future<void> init() async {
    await Future.wait([
      _loadLocalizationFile(localeEng, 'assets/l10n/eng.json'),
    ]);
    _currentLocale = localeEng;
    notifyListeners();
  }

  Future<void> _loadLocalizationFile(Locale locale, String filePath) async {
    final String data =
        await DefaultAssetBundle.of(App.globalContext).loadString(filePath);
    _localizations[locale] = Localization.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }
}
