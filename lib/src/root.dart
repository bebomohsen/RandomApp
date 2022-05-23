import 'package:flutter/material.dart';
import 'package:random/main.dart';
import 'package:random/screens/home.dart';
import 'package:random/screens/login.dart';
import 'package:random/screens/register.dart';
import 'package:random/screens/welcome.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: isLogin == false ? Welcome() : Home(),
    );
  }
}
