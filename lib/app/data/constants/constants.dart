import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  // static const String baseUrl = 'https://testing.peg.ly/api/store/v1/';
  static const String baseUrl = 'https://peg-app.com/api/store/v1/';

  static const Color primary = Color(0xFF1857CD);
  static const Color secondary = Color.fromARGB(255, 0, 0, 0);
  static const Color pending = Color(0xFFFFB36B);
  static const Color success = Color(0xFF0FE052);
  static const Color cancel = Color(0xFFEB5757);
  static const Color black2 = Color(0xFF1D1D1D);
  static const Color black3 = Color(0xFF282828);
  static const Color grey1 = Color(0xFF333333);
  static const Color grey2 = Color(0xFF4F4F4F);
  static const Color grey3 = Color(0xFF828282);
  static const Color grey4 = Color(0xFFBDBDBD);
  static const Color grey5 = Color(0xFFEDEEF0);
}

Future<void> launch(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
