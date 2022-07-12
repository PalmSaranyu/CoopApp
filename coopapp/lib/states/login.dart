import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/widgets/show_image.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
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
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
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
