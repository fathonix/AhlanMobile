import 'package:ahlan_mobile/constants.dart';
import 'package:ahlan_mobile/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Ahlan Mobile',
      theme: ThemeData.from(colorScheme: Constants.colorScheme).copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: Constants.headingFontFamily,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
