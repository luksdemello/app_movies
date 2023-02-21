import 'package:flutter/material.dart';

class AppMoviesUiConfig {
  AppMoviesUiConfig._();

  static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Metropolis',
      );
}
