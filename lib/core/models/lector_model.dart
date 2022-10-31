// To parse this JSON data, do
//
//     final lector = lectorFromMap(jsonString);

import 'dart:convert';

class Lector {
    Lector({
        this.id,
        this.nombres,
        this.apellidos,
        this.identificacion,
        this.edad,
        this.correo,
        this.grado,
        this.fotoPerfil,
        this.estado,
        this.sexo,
        this.institucion,
    });

    int? id;
    String? nombres;
    String? apellidos;
    String? identificacion;
    int? edad;
    String? correo;
    String? grado;
    String? fotoPerfil;
    String? estado;
    String? sexo;
    String? institucion;

    factory Lector.fromJson(String str) => Lector.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Lector.fromMap(Map<String, dynamic> json) => Lector(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        identificacion: json["identificacion"],
        edad: json["edad"],
        correo: json["correo"],
        grado: json["grado"],
        fotoPerfil: json["fotoPerfil"],
        estado: json["estado"],
        sexo: json["sexo"],
        institucion: json["institucion"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "identificacion": identificacion,
        "edad": edad,
        "correo": correo,
        "grado": grado,
        "fotoPerfil": fotoPerfil,
        "estado": estado,
        "sexo": sexo,
        "institucion": institucion,
    };
}
