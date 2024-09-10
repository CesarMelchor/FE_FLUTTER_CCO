class Eventos {
  final String id;
  final String tipoEvento;
  final String fechaInicio;
  final String horaInicio;
  final String fechaTermino;
  final String lugar;
  final String titulo;
  final String presentador;
  final String resennia;
  final String semblanza;
  final String textoSala;
  final String portada;
  final String idImagenes;
  final String mapa;

  Eventos({
    required this.id,
    required this.tipoEvento,
    required this.fechaInicio,
    required this.horaInicio,
    required this.fechaTermino,
    required this.lugar,
    required this.titulo,
    required this.presentador,
    required this.resennia,
    required this.semblanza,
    required this.textoSala,
    required this.portada,
    required this.idImagenes,
    required this.mapa
  });

  factory Eventos.fromJson(Map<String, dynamic> json) {
    return Eventos(
      id: json['id'],
      tipoEvento: json['tipo_evento'],
      fechaInicio: json['fecha_inicio'],
      horaInicio: json['hora_inicio'],
      fechaTermino: json['fecha_termino'],
      lugar: json['lugar'],
      titulo: json['titulo'],
      presentador: json['presentador'],
      resennia: json['resennia'],
      semblanza:  json['semblanza'],
      textoSala: json['texto_sala'],
      portada: json['imagen_portada'],
      idImagenes: json['id_imagenes'],
      mapa: json['mapa']
    );
  }
}
