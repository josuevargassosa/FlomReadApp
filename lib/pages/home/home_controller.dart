import 'package:flomreadapp/core/api/lector_api.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/models/lector_model.dart';
import '../profile/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  RxInt indexSegment = 0.obs;
  List<Lector> _lectores = [];
  final bool _loading = true;
  late Lector _lector = Lector();

  bool get loading => _loading;
  int get counter => _counter;
  List<Lector> get lectores => _lectores;
  Lector get lector => _lector;

  @override
  void onInit() {
    super.onInit();
    // loadLectoresById();
  }

  @override
  void onReady() {
    super.onReady();
    // loadLectores();
  }

  void increment() {
    _counter++;
    update(['text'], _counter >= 10);
  }

  Future<void> loadLectores() async {
    final data = LectorAPI.instance.getLectores();
    _lectores = await data;
    // _loading = false;
    // update(['lectores']);
  }

  Future<void> loadLectoresById() async {
    final data = await LectorAPI.instance.getLectorById(1);
    _lector = data;
    // _lectores = await data;
    // _loading = false;
    update();
  }

  showLectorProfile(Lector lector) {
    Get.to(
      const ProfilePage(),
      arguments: lector,
    );
  }
}
