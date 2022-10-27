import 'package:flomreadapp/core/api/lector_api.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/models/lector_model.dart';
import '../profile/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  RxInt indexSegment = 0.obs;
  List<Lector> _lectores = [];
  bool _loading = true;
  bool get loading => _loading;
  int get counter => _counter;
  List<Lector> get lectores => _lectores;
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("aaaaa");
    loadLectores();
  }

  void increment() {
    _counter++;
    update(['text'], _counter >= 10);
  }

  Future<void> loadLectores() async {
    // final data = LectorAPI.instance.getLectores();
    // _lectores = await data;
    // _loading = false;
    // update(['lectores']);
  }

  showLectorProfile(Lector lector) {
    Get.to(
      const ProfilePage(),
      arguments: lector,
    );
  }
}
