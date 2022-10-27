import 'package:flomreadapp/pages/home/home_page.dart';
import 'package:flomreadapp/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'pages/auth/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
