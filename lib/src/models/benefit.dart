class Benefit {
  final String id;
  final String nombre;
  final String paterno;
  final String materno;
  final String correo;
  final String edad;
  final String fechaNac;
  final String genero;
  final String curp;
  final String tipo;

  Benefit({
    required this.id,
    required this.nombre,
    required this.paterno,
    required this.materno,
    required this.correo,
    required this.edad,
    required this.fechaNac,
    required this.genero,
    required this.curp,
    required this.tipo,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      id: json['id'],
      nombre: json['nombres'],
      paterno: json['apellido_paterno'],
      materno: json['apellido_materno'],
      correo: json['correo'],
      edad: json['edad'],
      fechaNac: json['fecha_nacimiento'],
      genero: json['genero'],
      curp: json['curp'],
      tipo: json['tipo_inscripcion'],
    );
  }
}
