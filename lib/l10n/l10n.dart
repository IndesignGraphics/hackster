import 'dart:ui';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('gu'),
  ];

  String getFlag(String code) {
    switch (code) {
      case 'en':
        return 'Eng';
      case 'gu':
        return 'ગુજ';
      default:
        return 'ગુજ';
    }
  }
}
