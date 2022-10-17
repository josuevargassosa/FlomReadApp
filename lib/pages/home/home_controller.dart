
import 'package:flomreadapp/core/api/lector_api.dart';
import 'package:get/state_manager.dart';

import '../../core/models/lector_model.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<Lector> _lectores = [];

  int get counter => _counter;
  List<Lector> get lectores => _lectores;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadLectores();
  }

  void increment() {
    _counter++;
    update(['text'], _counter >= 10);
  }

  Future<void> loadLectores() async {
    final data = LectorAPI.instance.getLectores();
    _lectores = await data;
    update(['lectores']);
  }
}