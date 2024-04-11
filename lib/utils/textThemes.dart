import 'package:flutter/material.dart';
import 'package:assignment/utils/mycolors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextThemes {
  static TextStyle textHeading = GoogleFonts.cabin(
    fontSize: 35,
    color: MyColors.textColors,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyTextStyle = TextStyle(
      fontSize: 20, color: Colors.teal[800], fontStyle: FontStyle.italic);

  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: const Color(0xB5262F23),
  );
}
