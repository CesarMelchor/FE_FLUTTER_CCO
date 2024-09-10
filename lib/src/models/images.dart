class Imagenes {
  final String id;
  final String nombrecarrusel;
  final String descripcion;
  final String pathimagen;
  final String pathlink;
  final String fechaInicio;
  final String fechaTermino;

  Imagenes({
    required this.id,
    required this.nombrecarrusel,
    required this.descripcion,
    required this.pathimagen,
    required this.pathlink,
    required this.fechaInicio,
    required this.fechaTermino
  });

  factory Imagenes.fromJson(Map<String, dynamic> json) {
    return Imagenes(
      id: json['id'],
      nombrecarrusel: json['nombre_carrusel'],
      descripcion: json['descripcion'],
      pathimagen: json['path_image'],
      pathlink: json['path_link'],
      fechaInicio: json ['fecha_inicio'],
      fechaTermino: json['fecha_termino']
    );
  }
}
