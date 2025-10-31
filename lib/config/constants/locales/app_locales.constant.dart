import 'package:flutter/material.dart';

import '../gen/locale_keys.g.dart';

class AppLocales {
  static const en = Locale('en', 'GB');
  static const ne = Locale('ne', 'NP');
  static const es = Locale('es', 'ES');

  static List<String> appLocalesNames = [
    LocaleKeys.languages_english,
    LocaleKeys.languages_nepali,
    LocaleKeys.languages_spanish,
  ];

  static List<Locale> appLocales = [en, ne, es];
}
