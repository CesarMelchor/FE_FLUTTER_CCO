class Actividades {
  final String id;
  final String idActividades;
  final String fecha;
  final String hora;
  final String lugar;
  final String tipo;
  final String descripcionTipo;
  final String participantes;
  final String linkVideo;
  final String idImagenes;

  Actividades({
    required this.id,
    required this.idActividades,
    required this.fecha,
    required this.hora,
    required this.lugar,
    required this.tipo,
    required this.descripcionTipo,
    required this.participantes,
    required this.linkVideo,
    required this.idImagenes
  });

  factory Actividades.fromJson(Map<String, dynamic> json) {
    return Actividades(
      id: json['id'],
      idActividades: json['id_actividades'],
      fecha: json['fecha'],
      hora: json['hora'],
      lugar: json['lugar'],
      tipo: json['tipo'],
      descripcionTipo: json['descripcion_tipo'],
      participantes: json['participantes'],
      linkVideo: json['link_video'],
      idImagenes: json['id_imagenes'],
    );
  }
}
