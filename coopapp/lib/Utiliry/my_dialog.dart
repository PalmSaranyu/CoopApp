import 'package:coopapp/Utiliry/my_constant.dart';
import 'package:coopapp/widgets/show_title.dart';
import 'package:coopapp/widgets/show_image.dart';
import 'package:flutter/material.dart';

class Mydialog {
  Future<void> normalDialog(
      BuildContext context, String title, String massage) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image1),
          title: ShowTitle(title: title, textStyle: MyConstant().h2style()),
          subtitle:
              ShowTitle(title: massage, textStyle: MyConstant().h3style()),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('ok'))
        ],
      ),
    );
  }
}
