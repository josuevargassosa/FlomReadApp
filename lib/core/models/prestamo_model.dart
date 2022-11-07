// To parse this JSON data, do
//
//     final prestamo = prestamoFromMap(jsonString);

import 'dart:convert';

import 'package:flomreadapp/core/models/libro_model.dart';

class Prestamo {
    Prestamo({
        this.fechaCreacion,
        this.fechaModificacion,
        this.id,
        this.idLibro,
        this.idLector,
        this.estado,
        this.libro,
    });

    DateTime? fechaCreacion;
    DateTime? fechaModificacion;
    int? id;
    int? idLibro;
    int? idLector;
    String? estado;
    Libro? libro;

    factory Prestamo.fromJson(String str) => Prestamo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Prestamo.fromMap(Map<String, dynamic> json) => Prestamo(
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaModificacion: DateTime.parse(json["fechaModificacion"]),
        id: json["id"],
        idLibro: json["idLibro"],
        idLector: json["idLector"],
        estado: json["estado"],
        libro: Libro.fromMap(json["libro"]),
    );

    Map<String, dynamic> toMap() => {
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaModificacion": fechaModificacion?.toIso8601String(),
        "id": id,
        "idLibro": idLibro,
        "idLector": idLector,
        "estado": estado,
        "libro": libro?.toMap(),
    };
}
