// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShowLoan extends StatefulWidget {
  const ShowLoan({Key? key}) : super(key: key);

  @override
  State<ShowLoan> createState() => _ShowLoanState();
}

class _ShowLoanState extends State<ShowLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Show Loan'),
    );
  }
}
