class Aniversarios {
  final String id;
  final String numero;
  final String descripcion;
  final String miniatura;
  final String fechaInicio;
  final String fechaTermino;
  final String nombre;
  final String cabecera;
  final String texto;
  final String encabezado;

  Aniversarios({
    required this.id,
    required this.numero,
    required this.descripcion,
    required this.miniatura,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.nombre,
    required this.cabecera,
    required this.texto,
    required this.encabezado
  });

  factory Aniversarios.fromJson(Map<String, dynamic> json) {
    return Aniversarios(
      id: json['id'],
      numero: json['numero'],
      descripcion: json['descripcion'],
      miniatura: json['miniatura'],
      fechaInicio: json['fecha_inicio'],
      fechaTermino: json['fecha_termino'],
      nombre: json['nombre'],
      cabecera: json['cabecera'],
      texto: json['texto'],
      encabezado: json['encabezado']
    );
  }
}
