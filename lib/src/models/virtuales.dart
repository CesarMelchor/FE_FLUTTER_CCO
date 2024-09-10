class Virtuales {
  final String id;
  final String numero;
  final String numeroText;
  final String fecha;
  final String nombre;
  final String artista;
  final String imagenMiniatura;
  final String imagenArtista;
  final String biografia;
  final String textoSala;
  final String idImagenes;
  final String linkVideo;

  Virtuales({
    required this.id,
    required this.numero,
    required this.numeroText,
    required this.fecha,
    required this.nombre,
    required this.artista,
    required this.imagenMiniatura,
    required this.imagenArtista,
    required this.biografia,
    required this.textoSala,
    required this.idImagenes,
    required this.linkVideo
  });

  factory Virtuales.fromJson(Map<String, dynamic> json) {
    return Virtuales(
      id: json['id'],
      numero: json['numero'],
      numeroText: json['numero_text'],
      fecha: json['fecha'],
      nombre: json['nombre'],
      artista: json['artista'],
      imagenMiniatura: json['imagen_miniatura'],
      imagenArtista: json['imagen_artista'],
      biografia: json['biografia'],
      textoSala : json['texto_sala'],
      idImagenes: json['idImagenes'],
      linkVideo: json['link_video']
    );
  }
}
