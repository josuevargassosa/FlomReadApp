import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/api/lector_api.dart';
import '../../core/models/credentials.dart';
import '../../core/models/lector_model.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  String _inputCorreo = "";
  String _inputClave = "";
  late Credentials _credentials;
  String mensajeError = "";
  late Lector lector;
  String _loginMessageFail = "";

  Credentials get credentials => _credentials;
  String get loginMessageFail => _loginMessageFail;

  void onInputCorreoChanged(String text) {
    _inputCorreo = text;
  }

  void onInputClaveChanged(String text) {
    _inputClave = text;
  }

  void goToBackWithData() {
    if (_inputCorreo.trim().isNotEmpty && _inputClave.trim().isNotEmpty) {
      //Get.to(const HomePage());
      print("Correo: $_inputCorreo Clave: $_inputClave");
      _credentials = Credentials(correo: _inputCorreo, clave: _inputClave);
      login(_credentials);
    } else {
      Get.dialog(const AlertDialog(
          title: Text("Error"), content: Text("Ingrese correo y clave")));
    }
  }

  Future<void> login(Credentials credencial) async {
    try {
      final data = await LectorAPI.instance.login(credencial);
      Get.to(const HomePage(), arguments: data);
    } catch (e) {
      print(e);
      _loginMessageFail = e.toString();
      update();
    }
  }
}
