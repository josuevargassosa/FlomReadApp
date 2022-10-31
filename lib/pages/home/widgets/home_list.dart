import 'package:flomreadapp/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../core/models/lector_model.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'lectores',
      builder: (_) {
        if (_.loading) {
          return Center(child: LinearProgressIndicator());
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final Lector lector = _.lectores[index];
            return ListTile(
              title: Text(lector.nombres!),
              subtitle: Text(lector.apellidos!),
              onTap: () => _.showLectorProfile(lector),
            );
          },
          itemCount: _.lectores.length,
        );
      },
    );
  }
}
