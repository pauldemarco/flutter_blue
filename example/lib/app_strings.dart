import 'dart:async';

import 'package:flutter_blue_example/i18n/app_messages_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

// Information about how this file relates to i18n/stock_messages_all.dart and how the i18n files
// were generated can be found in i18n/regenerate.md.

class AppStrings {
  AppStrings(Locale locale) : _localeName = locale.toString();

  final String _localeName;

  static Future<AppStrings> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then((Null _) {
      return new AppStrings(locale);
    });
  }

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  String title() => Intl.message(
    'Stocks',
    name: 'title',
    desc: 'Title for the Stocks application',
    locale: _localeName,
  );

  String devices() => Intl.message(
    'Devices',
    name: 'devices',
    desc: 'Title for the Devices application',
    locale: _localeName,
  );

  String scanner() => Intl.message(
    'SCANNER',
    name: 'scanner',
    desc: 'Label for the Scanner tab',
    locale: _localeName,
  );

  String bonded() => Intl.message(
    'BONDED',
    name: 'bonded',
    desc: 'Label for the Bonded tab',
    locale: _localeName,
  );
}
