import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.green;

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVarientColor = Color(0XFF23b574);
  //static const Color _lightPrimaryVarientColor = Colors.white;
  
  //Color(0xFFCADCED);
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVarientColor = Color(0xFF4A4A58);
  static const Color _darkSecondaryColor = Colors.green;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: AppBarTheme(
      color: Colors.green ,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVarientColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(color: _iconColor, size: 30),
    textTheme: _lightTextTheme,
    accentColor: Color(0XFF23b574).withOpacity(0.5)
    
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _darkPrimaryVarientColor,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVarientColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    iconTheme: IconThemeData(color: _iconColor),
    textTheme: _darkTextTheme,
    accentColor: Color(0XFF23b574).withOpacity(0.5)
  );

  static final TextTheme _lightTextTheme = TextTheme(
    headline: _lightScreenHeadingTextStyle,
    body1: _lightScreenTaskNameTextStyle,
    body2: _lightScreenTaskDurationTextStyle,
    
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline: _darkScreenHeadingTextStyle,
    body1: _darkScreenTaskNameTextStyle,
    body2: _darkScreenTaskDurationTextStyle,
  );

  static final TextStyle _lightScreenHeadingTextStyle =
      TextStyle(fontFamily: 'MeriendaOne',fontSize: 30.0, color: _lightOnPrimaryColor,fontWeight: FontWeight.bold);
  static final TextStyle _lightScreenTaskNameTextStyle =
      TextStyle(fontFamily: 'StardosStencil',  fontSize: 18.0, color: _lightOnPrimaryColor,fontWeight: FontWeight.normal);
  static final TextStyle _lightScreenTaskDurationTextStyle =
      TextStyle(fontFamily: 'Lusitana',fontSize: 14.0, color: Colors.black87,fontWeight: FontWeight.bold);

  static final TextStyle _darkScreenHeadingTextStyle =
      TextStyle(fontSize: 40.0, color: _darkOnPrimaryColor,fontWeight: FontWeight.w300);
  static final TextStyle _darkScreenTaskNameTextStyle =
      TextStyle(fontSize: 18.0, color: _darkOnPrimaryColor,fontWeight: FontWeight.w400);
  static final TextStyle _darkScreenTaskDurationTextStyle =
      TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400);
}
 
 List<BoxShadow> customShadow = [
  //  BoxShadow(
    
  //    color: Colors.white.withOpacity(0.3),
  //    blurRadius: 30,
  //    offset: Offset(-5,-5),
  //    spreadRadius: -5),

     BoxShadow(
       //color: Colors.blue.withOpacity(0.3),
       color: Colors.green.withOpacity(0.15),
       spreadRadius: 10,
       offset: Offset(10,5),
       blurRadius: 20
     )  
   
 ];

 List<BoxShadow> customGreenShadow = [
   BoxShadow(
    
     color:Color(0XFF23b574).withOpacity(0.1),
     blurRadius: 30,
     offset: Offset(-5,-5),
     spreadRadius: -5),

     BoxShadow(
       //color: Colors.blue.withOpacity(0.3),
       color: Colors.lightGreen.withOpacity(0.1),
       spreadRadius: 2,
       offset: Offset(7,7),
       blurRadius: 20
     )  
   
 ];