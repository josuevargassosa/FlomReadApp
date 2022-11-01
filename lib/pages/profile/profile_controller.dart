import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/api/lector_api.dart';
import '../../core/models/lector_model.dart';

class ProfileController extends GetxController {
  late Lector _lector;
  Lector get lector => _lector;
  String _inputText = "";

  @override
  void onInit() {
    // super.onInit();
    // this._lector = Get.arguments as Lector;
    // final dataLector = LectorAPI.instance.getLectorById(1);
    // print(dataLector);
  }

  void onInputTextChanged(String text) {
    _inputText = text;
  }

  void goToBackWithData() {
    if (_inputText.trim().length > 0) {
      Get.back();
    } else {
      Get.dialog(AlertDialog(
          title: Text("Error"), content: Text("Ingrese un valor valido")));
    }
  }
}
