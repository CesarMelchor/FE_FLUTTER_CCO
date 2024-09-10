class Credenciales {
  final String paterno;
  final String materno;
  final String nombreUser;
  final String curpUser;
  final String taller;
  final String clave;
  final String edad;
  final String pRes;
  final String mRes;
  final String nomRes;
  final String telRes;
  final String sangre;

  Credenciales(
      {required this.paterno,
      required this.materno,
      required this.nombreUser,
      required this.curpUser,
      required this.taller,
      required this.clave,
      required this.edad,
      required this.pRes,
      required this.mRes,
      required this.nomRes,
      required this.telRes,
      required this.sangre
      
      });

  factory Credenciales.fromJson(Map<String, dynamic> json) {
    return Credenciales(
        paterno: json['apellido_paterno'],
        materno: json['apellido_materno'],
        nombreUser: json['nombres'],
        curpUser: json['curp'],
        taller: json['taller'],
        clave: json['clave'],
        edad : json['edad'],
        pRes: json['pRes'],
        mRes: json['mRes'],
        nomRes: json['nomRes'],
        telRes: json['telRes'],
        sangre: json['sangre'],
        
        );
        
  }
}
