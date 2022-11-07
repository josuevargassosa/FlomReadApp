import 'package:dio/dio.dart';
import 'package:flomreadapp/core/models/credentials.dart';
import 'package:flomreadapp/core/models/prestamo_model.dart';

import '../models/comentario_model.dart';
import '../models/lector_model.dart';
import '../models/libro_model.dart';

class LectorAPI {
  LectorAPI._internal();

  static LectorAPI _instance = LectorAPI._internal();

  static LectorAPI get instance => _instance;

  final _dio = Dio();

  Future<List<Lector>> getLectores() async {
    final Response response =
        await _dio.get('http://192.168.100.32:4000/lector', queryParameters: {
      "delay": 4,
    });
    return (response.data as List).map((e) => Lector.fromMap(e)).toList();
  }

  Future<Lector> getLectorById(int idLector) async {
    final Response response = await _dio.get(
      'http://192.168.100.32:4000/lector/$idLector',
    );
    return (Lector.fromMap(response.data));
  }

  Future<Lector> getPrestamosByLector(int idLector) async {
    final Response response = await _dio.get(
      'http://192.168.100.32:4000/lector/$idLector',
    );
    return (Lector.fromMap(response.data));
  }

  Future<Lector> login(Credentials credential) async {
    final response = await _dio.post('http://192.168.100.32:4000/auth/login-lector' , data: {
      "correo": credential.correo,
      "clave": credential.clave
    });

    return Lector.fromMap(response.data['data']);
    // if (response.data == 'Clave incorrecta') {
    //   return response.data;
    // } else {
    //   return (Lector.fromMap(response.data));
    // }
  }


  Future<List<Prestamo>> prestamosByIdLector(int idLector) async {
    final response = await _dio.get('http://192.168.100.32:4000/LibroLector/$idLector');
    //return (Prestamo.fromMap(response.data));
    return (response.data as List).map((e) => Prestamo.fromMap(e)).toList();
  }

  Future<Comentario> postComentario(Comentario comentario) async {
    final response = await _dio.post('http://192.168.100.32:4000/Comentario' , data: {
      "idLibroLector": comentario.idLibroLector,
      "descripcion": comentario.descripcion
    });

    return Comentario.fromMap(response.data);
  }


}