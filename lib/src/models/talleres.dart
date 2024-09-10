class Talleres {
  final String id;
  final String idTrabajador;
  final String idJefe;
  final String campo;
  final String especialidad;
  final String clave;
  final String nombre;
  final String conocimientosPrevios;
  final String edadMinima;
  final String edadMaxima;
  final String tallerista;
  final String modalidad;
  final String dias;
  final String horario;
  final String cupo;
  final String salones;
  final String costo;
  final String linkImagen;
  final String solicitudes;

  Talleres({
    required this.id,
    required this.idTrabajador,
    required this.idJefe,
    required this.campo,
    required this.especialidad,
    required this.clave,
    required this.nombre,
    required this.conocimientosPrevios,
    required this.edadMinima,
    required this.edadMaxima,
    required this.tallerista,
    required this.modalidad,
    required this.dias,
    required this.horario,
    required this.cupo,
    required this.salones,
    required this.costo,
    required this.linkImagen,
    required this.solicitudes
  });

  factory Talleres.fromJson(Map<String, dynamic> json) {
    return Talleres(
      id: json['id'],
      idTrabajador: json['id_trabajador'],
      idJefe: json['id_jefe'],
      campo: json['campo'],
      especialidad: json['especialidad'],
      clave: json['clave'],
      nombre: json['nombre'],
      conocimientosPrevios: json['conocimientos_previos'],
      edadMinima: json['edad_minima'],
      edadMaxima: json['edad_maxima'],
      tallerista: json['tallerista'],
      modalidad: json['modalidad'],
      dias: json['dias'],
      horario: json['horario'],
      cupo: json['cupo'],
      salones: json['salones'],
      costo: json['costo'],
      linkImagen: json['link_imagen'],
      solicitudes: json['solicitudes']
    );
  }
}
