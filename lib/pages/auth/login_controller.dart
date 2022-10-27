import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../home/home_page.dart';

class LoginController extends GetxController {
  String _inputText = "";

  void onInputTextChanged(String text) {
    _inputText = text;
  }

  void goToBackWithData() {
    if (_inputText.trim().isNotEmpty) {
      Get.to(const HomePage());
    } else {
      Get.dialog(const AlertDialog(
          title: Text("Error"), content: Text("Ingrese un valor valido")));
    }
  }
}
