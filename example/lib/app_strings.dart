import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

// Wrappers for strings that are shown in the UI.  The strings can be
// translated for different locales using the Dart intl package.
//
// Locale-specific values for the strings live in the i18n/*.arb files.
//
// To generate the app_messages_*.dart files from the ARB files, run:
//   flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/i18n --generated-file-prefix=app_ --no-use-deferred-loading lib/*.dart lib/i18n/*.arb

class AppStrings extends LocaleQueryData {
  static AppStrings of(BuildContext context) {
    return LocaleQuery.of(context);
  }

  static final AppStrings instance = new AppStrings();

  String title() => Intl.message(
    'Stocks',
    name: 'title',
    desc: 'Title for the Stocks application'
  );

  String market() => Intl.message(
    'MARKET',
    name: 'market',
    desc: 'Label for the Market tab'
  );

  String portfolio() => Intl.message(
    'PORTFOLIO',
    name: 'portfolio',
    desc: 'Label for the Portfolio tab'
  );
}
