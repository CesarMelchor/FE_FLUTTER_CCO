class Jefe {
  final String id;
  final String nombre;
  final String correo;

  Jefe({
    required this.id,
    required this.nombre,
    required this.correo,
  });

  factory Jefe.fromJson(Map<String, dynamic> json) {
    return Jefe(
      id: json['id_trabajador'],
      nombre: json['nombres'],
      correo: json['correo'],
    );
  }
}
