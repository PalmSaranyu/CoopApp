import 'package:flutter/material.dart';

class MyConstant {
//Genernal
  static String appName = 'CoopApp';
  static String domain = 'www.coopmcr.com';

  //route
  static String routeLogin = '/Login';
  static String routeCreateAccount = '/CreateAccount';
  static String routeMember = '/Member';
  static String routeAccount = '/Account';
  static String routeStock = '/Stock';

  //image
  static String image1 = 'images/logo1.jpg';
  static String image2 = 'images/logo2.png';
  static String image3 = 'images/logo2.png';

  //color
  static Color primary = const Color.fromARGB(255, 4, 243, 24);
  static Color dark = const Color.fromARGB(255, 0, 85, 0);
  static Color light = const Color.fromARGB(255, 128, 255, 103);

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
  TextStyle h3style() => TextStyle(
        fontSize: 14,
        color: dark,
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
