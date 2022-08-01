// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShowStock extends StatefulWidget {
  const ShowStock({Key? key}) : super(key: key);

  @override
  State<ShowStock> createState() => _ShowStockState();
}

class _ShowStockState extends State<ShowStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Show Stock'),
    );
  }
}