// To parse this JSON data, do
//
//     final libro = libroFromMap(jsonString);

import 'dart:convert';

class Libro {
    Libro({
        this.id,
        this.nombre,
        this.autor,
        this.resumen,
        this.fotoPortada,
        this.estado,
        this.fechaCreacion,
        this.fechaModificacion,
        this.codigo,
        this.cantidad,
    });

    int? id;
    String? nombre;
    String? autor;
    dynamic resumen;
    dynamic fotoPortada;
    String? estado;
    dynamic fechaCreacion;
    dynamic fechaModificacion;
    String? codigo;
    int? cantidad;

    factory Libro.fromJson(String str) => Libro.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Libro.fromMap(Map<String, dynamic> json) => Libro(
        id: json["id"],
        nombre: json["nombre"],
        autor: json["autor"],
        resumen: json["resumen"],
        fotoPortada: json["fotoPortada"],
        estado: json["estado"],
        fechaCreacion: json["fechaCreacion"],
        fechaModificacion: json["fechaModificacion"],
        codigo: json["codigo"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "autor": autor,
        "resumen": resumen,
        "fotoPortada": fotoPortada,
        "estado": estado,
        "fechaCreacion": fechaCreacion,
        "fechaModificacion": fechaModificacion,
        "codigo": codigo,
        "cantidad": cantidad,
    };
}
