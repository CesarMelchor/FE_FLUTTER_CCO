class Exposiciones {
  final String id;
  final String fechaInicio;
  final String fechaTermino;
  final String nombre;
  final String artista;
  final String descripcion;
  final String miniatura;
  final String cabecera;
  final String espacio;
  final String idImagenes;

  Exposiciones({
    required this.id,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.nombre,
    required this.artista,
    required this.descripcion,
    required this.miniatura,
    required this.cabecera,
    required this.espacio,
    required this.idImagenes
  });

  factory Exposiciones.fromJson(Map<String, dynamic> json) {
    return Exposiciones(
      id: json['id'],
      fechaInicio: json['fecha_inicio'],
      fechaTermino: json['fecha_termino'],
      nombre: json['nombre'],
      artista: json['artista'],
      descripcion: json['descrpicion'],
      miniatura: json['miniatura'],
      cabecera: json['cabecera'],
      espacio: json['espacio'],
      idImagenes: json['idImagenes'],
    );
  }
}
