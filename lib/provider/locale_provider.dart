import 'package:flutter/material.dart';
import 'package:hackster/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier{
  late Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider(){
    locale = const Locale('gu');
  }

  set locale(Locale? value) {
    if(!L10n.all.contains(value)) return;
    _locale = value;
    notifyListeners();
  }

  void clearLocale(){
    _locale = null;
    notifyListeners();
  }
}