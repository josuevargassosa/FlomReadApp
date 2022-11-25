import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flomreadapp/core/api/lector_api.dart';
import 'package:flomreadapp/core/models/prestamo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

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
  final TextEditingController _descripcionController = TextEditingController();
  bool _showButton = false;
  late TextEditingController _claveController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

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
  TextEditingController get claveController => _claveController;
  ImagePicker get picker => _picker;

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

  loadPrestamosLeidos() {
    var data = _prestamos.where((e) => e.estado == 'L');
    _prestamosLeidos.addAll(data);
  }

  loadPrestamosSin() {
    var data = _prestamos.where((e) => e.estado == 'P');
    _prestamosSin.addAll(data);
  }

  Future<void> loadPrestamos() async {
    _prestamos.clear();
    _prestamosLeidos.clear();
    _prestamosSin.clear();
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
      _descripcion = data.descripcion;
      _descripcionController.text = _descripcion!;
      _showButton = false;
    } catch (e) {
      _showButton = true;
    }
    update();
    print("Entro load $_showButton");
  }

  Future<void> loadLectoresById() async {
    final data = await LectorAPI.instance.getLectorById(lector.id!);
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
    refrescarDatos();
    update();
  }

  setDescripcion(descripcion) {
    _descripcion = descripcion;
    //descripcionController.text = descripcion!;
    print(_descripcion);
    update();
  }

  Future<void> cambiarClave() async {
    var datos = {"correo": lector.correo, "clave": _claveController.text};

    try {
      final data = await LectorAPI.instance.cambiarClave(jsonEncode(datos));
      update();
    } catch (e) {
      print(e);
    }
  }

  refrescarDatos() async {
    await loadPrestamos();
    await loadLectoresById();
    update();
  }

  Future<void> cambiarFoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image);

    if (image != null) {
      var formData = FormData.fromMap({
        "nombre": lector.nombres,
        "file": await MultipartFile.fromFile(image.path),
      });
      try {
        final data = await LectorAPI.instance.uploadPhoto(formData);
        inspect(data);
        var foto = {
          'fotoPerfil': data['secure_url'],
        };
        var resp = await LectorAPI.instance
            .actualizarFoto(lector.id!, jsonEncode(foto));
        inspect(resp);
        //_lector = resp;
        await loadLectoresById();
        update();
      } catch (e) {
        print(e);
      }
    }
  }
}
