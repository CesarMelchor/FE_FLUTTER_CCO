
class Registros {
  late  String id;
  late String beneficiario;
  late String claveTaller;
  late String diaRegistro;
  late String horaRegistro;
  late String minutoRegistro;
  late  String apellidoPaterno;
  late  String apellidoMaterno;
  late String nombres;
  late  String correo;
  late String fechaNacimiento;
  late String edad;
  late String curp;
  late String pathPdf;
  late String tipoInscripcion;
  late String folio;
  late  String enviado;
  late String comprobante;
  late String reimpresion;
  late  String sefin;
  late String observaciones;
  late String accesoAula;
  late String concluido;
  late String tipoRegistro;
  

  Registros(
     {
    required this.id, required this.beneficiario, required this.claveTaller, 
    required this.diaRegistro, required this.horaRegistro, required this.minutoRegistro, 
    required this.folio, required this.enviado, required this.comprobante, required this.reimpresion, 
    required this.sefin, required this.observaciones, required this.accesoAula, required this.concluido, 
    required this.apellidoPaterno, required this.apellidoMaterno, required this.nombres, 
    required this.fechaNacimiento, required this.edad, 
    required this.curp, required this.pathPdf,  required this.tipoInscripcion, 
     required this.correo, required this.tipoRegistro
  });

  factory Registros.fromJson(Map<String, dynamic> json) {
    return Registros(
      id: json['id'],
      beneficiario: json['beneficiario'],
      claveTaller: json['clave_taller'],
      diaRegistro: json['dia_registro'],
      horaRegistro: json['hora_registro'],
      minutoRegistro: json['minuto_registro'],
      apellidoPaterno: json['apellido_paterno'],
      apellidoMaterno: json['apellido_materno'],
      nombres: json['nombres'],
      correo: json['correo'],
      fechaNacimiento: json['fecha_nacimiento'],
      edad: json['edad'],
      curp: json['curp'],
      pathPdf: json['path_pdf'],
      tipoInscripcion: json['tipo_inscripcion'],
      folio: json['folio'],
      enviado: json['enviado'],
      comprobante: json['comprobante'],
      reimpresion: json['reimpresion'],
      sefin: json['sefin'],
      observaciones: json['observaciones'],
      accesoAula: json['acceso_aula'],
      concluido: json['concluido'],
      tipoRegistro: json['tipo_registro'],
    );

  }
    Map<String, dynamic> toJson() =>{
      "id" : id,
      "beneficiario" : beneficiario,
      "clave_taller" : claveTaller,
      "dia_registro" : diaRegistro,
      "hora_registro" : horaRegistro,
      "minuto_registro" : minutoRegistro,
      "apellido_paterno" : apellidoPaterno,
      "apellido_materno" : apellidoMaterno,
      "nombres" : nombres,
      "correo" : correo,
      "fecha_nacimiento" : fechaNacimiento,
      "edad" : edad,
      "curp" : curp,
      "path_pdf" : pathPdf,
      "tipo_inscripcion" : tipoInscripcion,
      "folio" : folio,
      "enviado" : enviado,
      "comprobante" : comprobante,
      "reimpresion" : reimpresion,
      "sefin" : sefin,
      "observaciones" : observaciones,
      "acceso_aula" : accesoAula,
      "concluido" : concluido,
      "tipo_registro" : tipoRegistro,

    };
}




