class Periodos {
  final String id;
  final String numeroPeriodo;
  final String meses;
  final String anio;
  final String mes;
  final String diaInicio;
  final String diaFinal;
  final String horaInicio;
  final String horaFinal;
  final String activo;

  Periodos({
    required this.id,
    required this.numeroPeriodo,
    required this.meses,
    required this.anio,
    required this.mes,
    required this.diaInicio,
    required this.diaFinal,
    required this.horaInicio,
    required this.horaFinal,
required this.activo
  });

  factory Periodos.fromJson(Map<String, dynamic> json) {
    return Periodos(
      id: json['id'],
      numeroPeriodo: json['numero_periodo'],
      meses: json['meses'],
      anio: json['año'],
      mes: json['mes_valido'],
      diaInicio: json['dia_inicio'],
      diaFinal: json['dia_final'],
      horaInicio: json['hora_inicio'],
      horaFinal: json['hora_final'],
      activo: json['activo']
    );
  }
}
