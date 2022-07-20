// ignore_for_file: avoid_print, prefer_void_to_null, non_constant_identifier_names

import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/Utiliry/my_dialog.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool statusRedEye = true;
  bool statusRedEye2 = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  Row buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อ ด้วย คะ';
              } else {}
              return null;
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'ชื่อ :',
              prefixIcon: const Icon(Icons.fingerprint),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.light)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildLastName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: lastnameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก นามสกุล ด้วย คะ';
              } else {}
              return null;
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'นามสกุล :',
              prefixIcon: const Icon(Icons.fingerprint),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.light)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUsername() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อใช้เข้าระบบ ด้วย คะ';
              } else {}
              return null;
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'ชื่อใช้เข้าระบบ :',
              prefixIcon: const Icon(Icons.perm_identity),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.light)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: password1Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password ด้วย คะ';
              } else {}
              return null;
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? Icon(
                          Icons.remove_red_eye,
                          color: MyConstant.dark,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: MyConstant.dark,
                        )),
              labelStyle: MyConstant().h3style(),
              labelText: 'รหัสผ่าน :',
              prefixIcon: const Icon(Icons.lock_outline),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.light)),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: password2Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ยืนยันรหัสผ่าน ด้วย คะ';
              } else {}
              return null;
            },
            obscureText: statusRedEye2,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye2 = !statusRedEye2;
                    });
                  },
                  icon: statusRedEye2
                      ? Icon(
                          Icons.remove_red_eye,
                          color: MyConstant.dark,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: MyConstant.dark,
                        )),
              labelStyle: MyConstant().h3style(),
              labelText: 'ยืนยันรหัส :',
              prefixIcon: const Icon(Icons.lock_outline),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.light)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (password1Controller.text == password2Controller.text) {
                  InsertData();
                } else {
                  Mydialog().normalDialog(
                      context, 'รหัสไม่ตรงกัน', 'กรุณากรอกรหัสให้ตรงกัน');
                }
              }
            },
            icon: const Icon(Icons.cloud_upload),
          ),
        ],
        title: const Text('สร้างข้อมูล'),
        backgroundColor: MyConstant.primary,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildTitle('ข้อมูลทั่วไป'),
                  buildName(),
                  buildLastName(),
                  buildUsername(),
                  buildPassword1(),
                  buildPassword2(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> InsertData() async {
    String name = nameController.text;
    String lastname = lastnameController.text;
    String user = usernameController.text;
    String password = password1Controller.text;
    print('name=$name,lastname=$lastname,username=$user,passwoed=$password');
    String path =
        '${MyConstant.domain}/coopapp/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) => print('## value ==>> $value'));
  }

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2style(),
      ),
    );
  }
}
