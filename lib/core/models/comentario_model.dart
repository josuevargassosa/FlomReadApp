// To parse this JSON data, do
//
//     final comentario = comentarioFromMap(jsonString);

import 'dart:convert';

class Comentario {
    Comentario({
        this.idLibroLector,
        this.idLector,
        this.idLibro,
        this.descripcion,
    });

    int? idLibroLector;
    int? idLector;
    int? idLibro;
    String? descripcion;

    factory Comentario.fromJson(String str) => Comentario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Comentario.fromMap(Map<String, dynamic> json) => Comentario(
        idLibroLector: json["idLibroLector"],
        idLector: json["idLector"],
        idLibro: json["idLibro"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toMap() => {
        "idLibroLector": idLibroLector,
        "idLector": idLector,
        "idLibro": idLibro,
        "descripcion": descripcion,
    };
}
