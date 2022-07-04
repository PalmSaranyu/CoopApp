import 'package:flutter/material.dart';

class MyConstant {
//Genernal
  static String appName = 'CoopApp';

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
  static Color primary = const Color(0xff87861d);
  static Color dark = const Color(0xff575900);
  static Color light = const Color(0xffb9b64e);

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
