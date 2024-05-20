import 'package:flutter/cupertino.dart';
import '../core/utils/preference.dart';

//pachi lib ma new file ma jaine l10n name ni file banavani ani ander intl_en.arb name ni file banavni.

// pachi pubspec.yaml ma aa karvi etlr generated valu folder bani jay aotomatic.

// generate: true
// flutter_intl:
//   enabled: true

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    // Use the set syntax to assign the value
    // get locale
    preferences.locale;
    notifyListeners();
  }
}
