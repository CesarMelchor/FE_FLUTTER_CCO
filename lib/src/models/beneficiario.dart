
class Beneficiarios {
  late  String id;
  late  String idUsuario;
  late  String apellidoPaterno;
  late  String apellidoMaterno;
  late String nombres;
  late String fechaNacimiento;
  late String edad;
  late String genero;
  late String entidad;
  late String curp;
  late String pathPdf;
  late String estadoCivil;
  late String calle;
  late String numE;
  late String numI;
  late String vialidad;
  late String colonia;
  late String asentamiento;
  late String cp;
  late String municipio;
  late String otroEstado;
  late String tipoSangre;
  late String discapacidad;
  late String desDiscapacidad;
  late String alergia;
  late String desAlergia;
  late String tipoInscripcion;
  late String telMovil;
  late String telFijo;
  late String autorizacion;
  late String pRes;
  late String mRes;
  late String nomRes;
  late String telMRes;
  late String telFRes;
  

  Beneficiarios(
     {
    required this.id,required this.apellidoPaterno, required this.apellidoMaterno, required this.nombres, 
    required this.fechaNacimiento, required this.edad, required this.curp, required this.pathPdf,  
    required this.tipoInscripcion, required this.idUsuario, required this.genero, required this.entidad,
    required this.estadoCivil, required this.calle,required this.numE, required this.numI, required this.colonia,
    required this.asentamiento, required this.cp, required this.municipio, required this.otroEstado,
    required this.tipoSangre, required this.discapacidad, required this.desDiscapacidad,
    required this.alergia, required this.desAlergia, required this.telMovil, required this.telFijo,
    required this.autorizacion, required this.pRes, required this.mRes, required this.nomRes,
    required this.telMRes, required this.telFRes, required this.vialidad
  });

  factory Beneficiarios.fromJson(Map<String, dynamic> json) {
    return Beneficiarios(
      id: json['id'],
      idUsuario: json['id_usuario'],
      apellidoPaterno: json['apellido_paterno'],
      apellidoMaterno: json['apellido_materno'],
      nombres: json['nombres'],
      fechaNacimiento: json['fecha_nacimiento'],
      edad: json['edad'],
      genero: json['genero'],
      entidad: json['entidad'],
      curp: json['curp'],
      pathPdf: json['path_pdf'],
      estadoCivil: json['estado_civil'],
      calle: json['calle'],
      numE: json['num_exterior'],
      numI: json['num_interior'],
      vialidad: json['vialidad'],
      colonia: json['colonia'],
      asentamiento: json['asentamiento'],
      cp: json['cp'],
      municipio: json['municipio'],
      otroEstado: json['otro_estado'],
      tipoSangre: json['tipo_sangre'],
      discapacidad: json['discapacidad'],
      desDiscapacidad: json['des_discapacidad'],
      alergia: json['alergia'],
      desAlergia: json['des_alergia'],
      tipoInscripcion: json['tipo_inscripcion'],
      telMovil: json['tel_movil'],
      telFijo: json['tel_fijo'],
      autorizacion: json['autorizacion_imagen'],
      pRes: json['apellidoPResponsable'],
      mRes: json['apellidoMResponsable'],
      nomRes: json['nombresResponsable'],
      telMRes: json['telefonoMResponsable'],
      telFRes: json['telefonoFResponsable'],
    );

  }
   
}




