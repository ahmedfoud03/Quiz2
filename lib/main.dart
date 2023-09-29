import 'package:flutter/material.dart';
import 'package:quiz2/interface.dart';


void main() {
  runApp(const Quiz2());
}

class Quiz2 extends StatelessWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: app(),
    );
  }
}
