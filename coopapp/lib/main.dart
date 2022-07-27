// ignore_for_file: prefer_void_to_null, prefer_const_constructors, avoid_print

import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/states/account.dart';
import 'package:coopapp/states/create_account.dart';
import 'package:coopapp/states/login.dart';
import 'package:coopapp/states/member.dart';
import 'package:coopapp/states/stock.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/Login': (BuildContext context) => const Login(),
  '/CreateAccount': (BuildContext context) => const CreateAccount(),
  '/Member': (BuildContext context) => const Member(),
  '/Account': (BuildContext context) => const Account(),
  '/Stock': (BuildContext context) => const Stock(),
};

// ignore: non_constant_identifier_names
String? InitialRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? user = preferences.getString('user');
  print('### user == $user');
  if (user?.isEmpty ?? true) {
    InitialRoute = MyConstant.routeLogin;
    runApp(MyApp());
  } else {
    InitialRoute = MyConstant.routeMember;
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: InitialRoute,
    );
  }
}
