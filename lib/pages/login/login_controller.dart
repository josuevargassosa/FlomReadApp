import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // se llama imediatamente despues de que el widget se encuentre en memoria
    // fetchApi();
    super.onInit();
  }

  @override
  void onReady() {
    // se llama imediatamente despues de que el widget  este renderizado en pantalla
    // showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() {
    // se llama imediatamente despues de que el widget es borrado de memoria
    // closeStream();
    super.onClose();
  }
}

class incrementar extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update(); // mira esto!
  }
}
