import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Views/splashscreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  final MaterialColor _colorswatch = const MaterialColor(
    0xff155245, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xF4155245), //10%
      100: Color(0xDB155245), //20%
      200: Color(0xC7155245), //30%
      300: Color(0xB7155245), //40%
      400: Color(0x9F155245), //50%
      500: Color(0x67155245), //60%
      600: Color(0x4F155245), //70%
      700: Color(0x2E155245), //80%
      800: Color(0x18155245), //90%
      900: Color(0x00155245), //100%
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _colorswatch,
      ),
      home: const splashscreen(),
    );
  }
}
