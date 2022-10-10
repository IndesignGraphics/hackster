import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackster/screens/log_in.dart';
import 'package:hackster/screens/main_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLogin = false;

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      _isLogin = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int tintValue(int value, double factor) =>
        max(0, min((value + ((255 - value) * factor)).round(), 255));

    Color tintColor(Color color, double factor) => Color.fromRGBO(
          tintValue(color.red, factor),
          tintValue(color.green, factor),
          tintValue(color.blue, factor),
          1,
        );

    int shadeValue(int value, double factor) =>
        max(0, min(value - (value * factor).round(), 255));

    Color shadeColor(Color color, double factor) => Color.fromRGBO(
        shadeValue(color.red, factor),
        shadeValue(color.green, factor),
        shadeValue(color.blue, factor),
        1);
    MaterialColor generateMaterialColor(Color color) {
      return MaterialColor(color.value, {
        50: tintColor(color, 0.9),
        100: tintColor(color, 0.8),
        200: tintColor(color, 0.6),
        300: tintColor(color, 0.4),
        400: tintColor(color, 0.2),
        500: color,
        600: shadeColor(color, 0.1),
        700: shadeColor(color, 0.2),
        800: shadeColor(color, 0.3),
        900: shadeColor(color, 0.4),
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackster',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          const Color.fromRGBO(38, 52, 48, 1),
        ),
      ).copyWith(selectedRowColor: const Color.fromRGBO(56, 42, 48, 1)),
      home: _isLogin ? const MainScreen() : const LogIn(),
    );
  }
}
