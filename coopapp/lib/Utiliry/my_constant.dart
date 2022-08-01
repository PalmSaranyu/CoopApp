// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyConstant {
//Genernal
  static String appName = 'CoopApp';
  static String domain = 'http://www.coopmcr.com';

  //route
  static String routeLogin = '/Login';
  static String routeCreateAccount = '/CreateAccount';
  static String routeMember = '/Member';
  static String routeAccount = '/Account';
  static String routeStock = '/Stock';
  static String routeLoan = '/Loan';

  //image
  static String image1 = 'images/logo1.jpg';
  static String image2 = 'images/logo2.png';
  static String image3 = 'images/logo2.png';

  //color
  static Color primary = Color(0xD70CEE17);
  static Color dark = Color(0xEB02801D);
  static Color light = Color(0xA178FA78);
  static Map<int, Color> mapMateriaColor = {
    50: Color.fromRGBO(2, 128, 29, 0.1),
    100: Color.fromRGBO(2, 128, 29, 0.2),
    200: Color.fromRGBO(2, 128, 29, 0.3),
    300: Color.fromRGBO(2, 128, 29, 0.4),
    400: Color.fromRGBO(2, 128, 29, 0.5),
    500: Color.fromRGBO(2, 128, 29, 0.6),
    600: Color.fromRGBO(2, 128, 29, 0.7),
    700: Color.fromRGBO(2, 128, 29, 0.8),
    800: Color.fromRGBO(2, 128, 29, 0.9),
    900: Color.fromRGBO(2, 128, 29, 0.10),
  };

  //style
  TextStyle h1style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2Whitestyle() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3Whitestyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );

  //styleButton
  ButtonStyle mybuttonstyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
