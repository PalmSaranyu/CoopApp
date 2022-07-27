// ignore_for_file: unused_local_variable, prefer_void_to_null, avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/Utiliry/my_dialog.dart';
import 'package:coopapp/models/user_model.dart';
import 'package:coopapp/widgets/show_image.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(),
                buildAppName(),
                buildUser(),
                buildPassWord(),
                buildLogin(),
                buildCreateAcc(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAcc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ? ',
          textStyle: MyConstant().h3style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeCreateAccount),
          child: const Text('Create Account'),
        )
      ],
    );
  }

  Row buildLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: 250,
          child: ElevatedButton(
            style: MyConstant().mybuttonstyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {}
              String user = userController.text;
              String password = passwordController.text;
              print('## user=$user,password=$password');
              checkLogin(user: user, password: password);
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  Future<Null> checkLogin({String? user, String? password}) async {
    String apiCheckLogin =
        '${MyConstant.domain}/coopapp/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiCheckLogin).then((value) async {
      print('### value for API ==>> $value');
      if (value.toString() == 'null') {
        Mydialog()
            .normalDialog(context, 'User ผิดพลาด', 'ไม่มี $user นี้ ในระบบ');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            //Success Login
            String user = model.user;
            print('## user == $user');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('user', model.user);
            Navigator.pushNamedAndRemoveUntil(
                context, MyConstant.routeMember, (route) => false);
          } else {
            //Login False
            Mydialog()
                .normalDialog(context, 'รหัสผิดหลาด', 'กรุณากรอกรหัสใหม่');
          }
        }
      }
    });
  }

  Row buildUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกUser';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'User :',
              prefixIcon: const Icon(Icons.account_circle_outlined),
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

  Row buildPassWord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกPassword';
              } else {
                return null;
              }
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
              labelText: 'Password :',
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

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: MyConstant.appName, textStyle: MyConstant().h1style()),
      ],
    );
  }

  Row buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ShowImage(path: MyConstant.image1),
        ),
      ],
    );
  }
}
