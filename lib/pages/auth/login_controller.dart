import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../home/home_page.dart';

class LoginController extends GetxController {
  String _inputCorreo = "";
  String _inputClave = "";

  void onInputCorreoChanged(String text) {
    _inputCorreo = text;
  }

  void onInputClaveChanged(String text) {
    _inputClave = text;
  }

  void goToBackWithData() {
    if (_inputCorreo.trim().isNotEmpty && _inputClave.trim().isNotEmpty) {
      Get.to(const HomePage());
    } else {
      Get.dialog(const AlertDialog(
          title: Text("Error"), content: Text("Ingrese correo y clave")));
    }
  }
}
