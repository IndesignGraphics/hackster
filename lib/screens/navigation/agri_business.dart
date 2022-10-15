import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgriBusiness extends StatelessWidget {
  const AgriBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.agriBusiness ??'AgriBusiness'),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)?.agriBusiness ??'AgriBusiness'),
      ),
    );
  }
}
