import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

ThemeData getTchombeTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: TchombeColor.primarySwatch,
        iconTheme: IconThemeData(color: TchombeColor.kGwhite),
        titleTextStyle: TextStyle(
          color: TchombeColor.kGwhite,
          fontSize: fontSize25,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          focusColor: TchombeColor.primarySwatch,
          fillColor: TchombeColor.primarySwatch,
          hoverColor: TchombeColor.primarySwatch),

      /// Text theme
      textTheme: TextTheme(
        headline5: TextStyle(
            color: TchombeColor.kGwhite,
            fontSize: fontSize20,
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: TchombeColor.kGwhite, fontSize: fontSize15),
        bodyText2: TextStyle(color: TchombeColor.kblack, fontSize: fontSize15),
        button: TextStyle(color: TchombeColor.kGwhite, fontSize: fontSize15),
      ),

      /// tab Bar theme
      tabBarTheme: TabBarTheme(
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize15),
          labelColor: TchombeColor.kGwhite,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize15)),

      /// icon theme
      iconTheme: IconThemeData(color: TchombeColor.primarySwatch),

      /// bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: TchombeColor.K_dart_color,
        unselectedLabelStyle:
            TextStyle(fontSize: fontSize15, fontWeight: FontWeight.bold),
        selectedLabelStyle:
            TextStyle(fontSize: fontSize20, fontWeight: FontWeight.bold),
        unselectedItemColor: TchombeColor.kGwhite,
        selectedItemColor: TchombeColor.kGwhite,
      ),

      /// button theme
      buttonTheme: ButtonThemeData(
        buttonColor: TchombeColor.K_button,
        splashColor: TchombeColor.K_button,
      ),

      /// Another colors
      backgroundColor: Colors.black54,
      primaryColor: TchombeColor.colorGrey,
      accentColor: TchombeColor.K_button,
      buttonColor: TchombeColor.K_button,

      /// card theme
      cardTheme: CardTheme(
        color: TchombeColor.kGwhite,
        elevation: elevationA,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius10),
        ),
      ));
}
