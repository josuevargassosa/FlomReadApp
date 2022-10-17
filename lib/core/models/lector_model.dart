
import 'package:meta/meta.dart' show required;

class Lector {
  final int id;
  final String nombres;
  final String apellidos;
  final identificacion;
  final String correo;
  final int edad;
  final String grado;
  final fotoPerfil;
  final estado;
  final sexo;

  Lector(
    {
      required this.id,
      required this.nombres,
      required this.apellidos,
      required this.identificacion,
      required this.edad,
      required this.correo,
      required this.grado,
      required this.fotoPerfil,
      required this.estado,
      required this.sexo
    }
  );

  static Lector FromJson(Map<String, dynamic>json) {
    return Lector(
      id: json['id'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      identificacion: json['identificacion'],
      edad: json['edad'],
      correo: json['correo'],
      grado: json['grado'],
      fotoPerfil: json['fotoPerfil'],
      estado: json['estado'],
      sexo: json['sexo']
    );
  }


}
