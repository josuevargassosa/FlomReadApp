import 'package:flomreadapp/pages/home/home_controller.dart';
import 'package:flomreadapp/pages/home/widgets/home_label.dart';
import 'package:flomreadapp/pages/home/widgets/home_list.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          print("Build HOME");
          return Scaffold(
            body: const HomeList(),
            floatingActionButton: FloatingActionButton(
              onPressed: _.increment,
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
