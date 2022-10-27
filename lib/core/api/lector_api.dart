import 'package:dio/dio.dart';

import '../models/lector_model.dart';

class LectorAPI { 

  LectorAPI._internal();

  static LectorAPI _instance = LectorAPI._internal();

  static LectorAPI get instance => _instance;

  final _dio = Dio();

  Future<List<Lector>> getLectores() async {
      final Response response = await _dio.get('http://192.168.100.32:4000/lector',
        queryParameters: {
          "delay": 4,
        }
      );
      return (response.data as List)
      .map((e) => Lector.FromJson(e))
      .toList();
  }


}