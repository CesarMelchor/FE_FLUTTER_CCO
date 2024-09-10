class Episodios {
  final String id;
  final String titulo;
  final String descripcion;
  final String rutaimagen;
  final String rutacabecera;
  final String rutaaudio;
  final String idcarrusel;

  Episodios({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.rutaimagen,
    required this.rutacabecera,
    required this.rutaaudio,
    required this.idcarrusel,
  });

  factory Episodios.fromJson(Map<String, dynamic> json) {
    return Episodios(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      rutaimagen: json['ruta_imagen'],
      rutacabecera: json['ruta_cabecera'],
      rutaaudio: json['ruta_audio'],
      idcarrusel: json['id_carrusel'],
    );
  }
}
