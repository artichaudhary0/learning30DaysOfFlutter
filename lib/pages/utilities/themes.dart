import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: MyTheme.darkCreamColor,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static Color creamColor = Color(0xfff1eded);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo.shade600;
  static Color captionStyle = Colors.blueGrey.shade200;
}
