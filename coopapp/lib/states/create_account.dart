import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool statusRedEye = true;
  bool statusRedEye2 = true;

  Row buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
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

  Row buildGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'กลุ่ม :',
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
            decoration: InputDecoration(
              labelStyle: MyConstant().h3style(),
              labelText: 'ชื่อใช้เข้าระบบ :',
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

  Row buildPassword1() {
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

  Row buildCreate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: 250,
          child: ElevatedButton(
            style: MyConstant().mybuttonstyle(),
            onPressed: () {},
            child: const Text('บันทึกข้อมูล'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สร้างข้อมูล'),
        backgroundColor: MyConstant.primary,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              buildTitle('ข้อมูลทั่วไป'),
              buildName(),
              buildLastName(),
              buildUsername(),
              buildPassword1(),
              buildPassword2(),
              buildCreate(),
            ],
          ),
        ),
      ),
    );
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
