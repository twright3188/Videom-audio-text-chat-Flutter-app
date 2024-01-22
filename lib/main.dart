import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:crepe/home.dart';

bool isDarkMode = false;
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // --- (1)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, // Color for Android
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  //가로 모드 허용하지 않음.
  SystemChrome.setPreferredOrientations(// --- (3)
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp())); // --- (4)
  ;
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'crepe';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: _title,
        // home: Home(),
        home: Scaffold(
          body: SafeArea(
            top: false,
            bottom: false,
            child: Home(),
          ),
        ));
  }
}
