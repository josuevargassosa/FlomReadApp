import 'dart:convert';

class Credentials {
    Credentials({
        this.correo,
        this.clave,
    });

    String? correo;
    String? clave;

    factory Credentials.fromJson(String str) => Credentials.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Credentials.fromMap(Map<String, dynamic> json) => Credentials(
        correo: json["correo"],
        clave: json["clave"],
    );

    Map<String, dynamic> toMap() => {
        "correo": correo,
        "clave": clave,
    };
}
