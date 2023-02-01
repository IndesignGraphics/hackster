import 'package:flutter/material.dart';

// import 'package:hackster/provider/locale_provider.dart';
import 'package:hackster/screens/log_in.dart';

// import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  var locale = const Locale('gu');
                  Get.updateLocale(locale);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: Container(
                  height: 75,
                  width: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: const Text(
                    'ગુજરાતી',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  var locale = const Locale('en');
                  Get.updateLocale(locale);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: Container(
                  height: 75,
                  width: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: const Text(
                    'English',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
