import 'package:get/get.dart';
import '../home/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }


  @override
  void onClose() {
    print("Same as dispose");
    super.onClose();
  }

}
