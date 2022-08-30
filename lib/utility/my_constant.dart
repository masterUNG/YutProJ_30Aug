import 'package:flutter/material.dart';

class MyConstant {
  static Color primary = Colors.blue;
  static Color dark = Colors.black;

  TextStyle h1Style() => TextStyle(
    fontSize:  36,
    color: dark,
    fontWeight: FontWeight.bold,
  );

   TextStyle h2Style() => TextStyle(
    fontSize:  18,
    color: dark,
    fontWeight: FontWeight.w700,
  );

   TextStyle h3Style() => TextStyle(
    fontSize:  14,
    color: dark,
    fontWeight: FontWeight.normal,
  );


}
