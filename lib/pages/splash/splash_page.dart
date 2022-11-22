import 'package:flomreadapp/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      dispose: (_) {
        print("normal dispose");
      },
      init: SplashController(),
      initState: (_) {},
      builder: (_) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
