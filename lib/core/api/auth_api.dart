import 'package:dio/dio.dart';

class authAPI {
  authAPI._internal();

  static authAPI _instance = authAPI._internal();

  static authAPI get instance => _instance;

  final _dio = Dio();
  //final urlApi = "http://192.168.100.32:3000";
  final urlApi = "https://flomreadmysqlbackend-production.up.railway.app";

  Future<List<dynamic>> auth() async {
    final Response response =
        await _dio.get('$urlApi/lector', queryParameters: {
      "delay": 4,
    });
    return (response.data as List);
    // .map((e) => Lector.FromJson(e))
    // .toList();
  }
}
