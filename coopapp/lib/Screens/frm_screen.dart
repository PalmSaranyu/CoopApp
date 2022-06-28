import 'package:flutter/material.dart';

class FromScreen extends StatelessWidget {
  const FromScreen({Key? key}) : super(key: key);
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "ชื่อรายการ"),
              autofocus: true,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "จำนวนเงิน"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  text(String s) {}
}
