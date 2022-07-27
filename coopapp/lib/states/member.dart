// ignore_for_file: prefer_const_constructors

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ช้อมูลสมาชิก'),
      ),
      drawer: Drawer(
        child: buildSignOut(),
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
            preferences.clear();
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
