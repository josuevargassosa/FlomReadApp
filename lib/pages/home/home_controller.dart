import 'dart:developer';

import 'package:flomreadapp/core/api/lector_api.dart';
import 'package:flomreadapp/core/models/prestamo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/models/comentario_model.dart';
import '../../core/models/lector_model.dart';
import '../../core/models/libro_model.dart';

class HomeController extends GetxController {
  int _counter = 0;
  RxInt indexSegment = 0.obs;
  List<Lector> _lectores = [];
  List<Prestamo> _prestamos = [];
  List<Prestamo> _prestamosLeidos = [];
  List<Prestamo> _prestamosSin = [];
  final bool _loading = true;
  late Lector _lector = Lector();
  String? _descripcion;
  TextEditingController _descripcionController = TextEditingController();
  bool _showButton = false;

  bool get loading => _loading;
  int get counter => _counter;
  List<Lector> get lectores => _lectores;
  Lector get lector => _lector;
  List<Prestamo> get prestamos => _prestamos;
  List<Prestamo> get prestamosLeidos => _prestamosLeidos;
  List<Prestamo> get prestamosSin => _prestamosSin;
  String? get descripcion => _descripcion;
  TextEditingController get descripcionController => _descripcionController;
  bool get showButton => _showButton;

  @override
  void onInit() {
    super.onInit();
    _lector = Get.arguments;
    loadPrestamos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  loadDataArgument() {
    print('ENTROOOO');
    _lector = Get.arguments;
    loadPrestamos();
    update();
  }

  void loadPrestamosLeidos() {
    var data = _prestamos.where((e) => e.estado == 'L');
    _prestamosLeidos.addAll(data);
  }

  loadPrestamosSin() {
    var data = _prestamos.where((e) => e.estado == 'P');
    _prestamosSin.addAll(data);
  }

  Future<void> loadPrestamos() async {
    final data = await LectorAPI.instance.prestamosByIdLector(_lector.id!);
    _prestamos = data;
    loadPrestamosLeidos();
    loadPrestamosSin();
    update();
  }

  Future<void> loadComentario(int idPrestamo) async {
    descripcionController.text = '';
    _descripcion = '';
    try {
      final data = await LectorAPI.instance.comentariosByIdPrestamo(idPrestamo);
      inspect(data);
      _descripcion = data.descripcion;
      _descripcionController.text = _descripcionController.text + _descripcion!;
      _showButton = false;
      update();
    } catch (e) {
      print(e);
      _showButton = true;
      update();
    }
  }

  Future<void> loadLectoresById() async {
    final data = await LectorAPI.instance.getLectorById(1);
    _lector = data;
    update();
  }

  Future<void> postComentario(Prestamo prestamo) async {
    Comentario comentario = Comentario(
      idLibroLector: prestamo.id,
      descripcion: _descripcion,
      idLector: prestamo.idLector,
      idLibro: prestamo.idLibro,
    );
    final data = await LectorAPI.instance.postComentario(comentario);
    update();
  }

  setDescripcion(descripcion) {
    _descripcion = descripcion;
    //descripcionController.text = descripcion!;
    print(_descripcion);
    update();
  }

  // showLectorProfile(Lector lector) {
  //   Get.to(
  //     const ProfilePage(),
  //     arguments: lector,
  //   );
  // }
}
