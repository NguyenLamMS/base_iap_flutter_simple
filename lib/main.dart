import 'package:base_iap_flutter/src/modules/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/config/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: PrimaryFont.fontFamily,
              bodyColor: kTextColor,
              displayColor: kTextColor,
            ),
        fontFamily: PrimaryFont.fontFamily,
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: PrimaryFont.regular(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
