// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShowAccount extends StatefulWidget {
  const ShowAccount({Key? key}) : super(key: key);

  @override
  State<ShowAccount> createState() => _ShowAccountState();
}

class _ShowAccountState extends State<ShowAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Show account'),
    );
  }
}
