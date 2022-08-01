// ignore_for_file: prefer_const_constructors

import 'package:coopapp/Bodys/show_account.dart';
import 'package:coopapp/Bodys/show_loan.dart';
import 'package:coopapp/Bodys/show_stock.dart';
import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Member extends StatefulWidget {
  const Member({Key? key}) : super(key: key);

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  List<Widget> widgets = [ShowAccount(), ShowStock(),ShowLoan()];
  int indexwidget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลสมาชิก'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            buildSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                showAccount(),
                showStock(),
                showLoan(),
              ],
            ),
          ],
        ),
      ),
      body: widgets[indexwidget],
    );
  }

  ListTile showAccount() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_1_outlined),
      title: ShowTitle(
        title: 'แสดงบัญชีเงินฝาก',
        textStyle: MyConstant().h3style(),
      ),
    );
  }

  ListTile showStock() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_2_outlined),
      title: ShowTitle(
        title: 'แสดงหุ้น',
        textStyle: MyConstant().h3style(),
      ),
    );
  }

  
  ListTile showLoan() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_3_outlined),
      title: ShowTitle(
        title: 'แสดงข้อมูลเงินกู้',
        textStyle: MyConstant().h3style(),
      ),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                      context, MyConstant.routeLogin, (route) => false),
                );
          },
          tileColor: Colors.green.shade900,
          leading: Icon(
            Icons.exit_to_app,
            size: 36,
            color: Colors.white,
          ),
          title: ShowTitle(
            title: 'ออกจากระบบ',
            textStyle: MyConstant().h2Whitestyle(),
          ),
          subtitle: ShowTitle(
            title: 'ออกจากระบบ เพื่อ Login ใหม่่',
            textStyle: MyConstant().h3Whitestyle(),
          ),
        ),
      ],
    );
  }
}
