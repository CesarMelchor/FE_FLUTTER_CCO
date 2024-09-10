import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class IdentificacionPage6 extends StatefulWidget {
  const IdentificacionPage6({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage6> createState() => _IdentificacionPage6State();
}

class _IdentificacionPage6State extends State<IdentificacionPage6> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width <= 844) {
      setState(() {
        Utilidades.responsive = true;
      });
    } else {
      setState(() {
        Utilidades.responsive = false;
      });
    }
    if (Utilidades.responsive == false) {
      setState(() {
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
      });
    } else {
      setState(() {
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9D2449),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/formulario5");
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Text("Regresar"),
      ),
      body: Form(
        key: _oFormKey,
        child: ListView(
          padding: EdgeInsets.only(
              left: Utilidades.leftGeneral, right: Utilidades.rightGeneral),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Autorización informada para el uso del derecho de imagen del alumnado",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                "Por favor, lea detenidamente el siguiente documento:",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle3),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "AUTORIZACIÓN INFORMADA PARA EL USO DEL DERECHO DE IMAGEN DEL ALUMNADO",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.fontSizeTitle2),
                    ),
                  ),
                  Text(
                    "Estando en pleno uso de mis facultades de goce como de ejercicio, otorgo mi autorización voluntaria, para que la Casa de la Cultura Oaxaqueña (C.C.O.) pueda utilizar; la reproducción de imagen, entrevistas y/o videos del tutorado; siempre y cuando la finalidad sea en materia de promoción cultural y/o educativa, bajo el amparo del Artículo 87 de la Ley Federal del Derecho de Autor, en su última reforma publicada en el D.O.F., de fecha 01 de julio de 2020, que a la letra dice: El retrato de una persona sólo puede ser usado o publicado, con su consentimiento expreso, o bien con el de sus representantes o los titulares de los derechos correspondientes. La autorización de usar o publicar el retrato podrá revocarse por quien la otorgo quien, en su caso, responderá por los daños y perjuicios que pudiera ocasionar dicha revocación.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: Utilidades.fontHelBold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Utilidades.responsive == false
                  ? Row(
                      children: [
                        Image.asset(
                          "assets/images/archivo.png",
                          height: 45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Color.fromARGB(255, 207, 207, 207),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: const Text(
                                  "AUTORIZACIÓN PARA EL USO DE IMAGEN",
                                  style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                GlobalFunctions.launchURL(
                                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/AUTORIZACIÓN-PARA-EL-USO-DE-IMÁGEN.pdf");
                                setState(() {
                                  Utilidades.aviso1 = true;
                                });
                              }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Color.fromARGB(255, 207, 207, 207),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: const Text(
                                "CARTA RESPONSIVA DE BUENA SALUD",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                GlobalFunctions.launchURL(
                                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/Carta-responsiva-de-buena-salud.pdf");
                                setState(() {
                                  Utilidades.aviso2 = true;
                                });
                              }),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image.asset(
                          "assets/images/archivo.png",
                          height: 45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 207, 207, 207),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: const Text(
                                      "AUTORIZACIÓN PARA EL USO DE IMAGEN",
                                      style: TextStyle(color: Colors.black)),
                                  onPressed: () {
                                    GlobalFunctions.launchURL(
                                        "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/AUTORIZACIÓN-PARA-EL-USO-DE-IMÁGEN.pdf");
                                    setState(() {
                                      Utilidades.aviso1 = true;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Color.fromARGB(255, 207, 207, 207),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: const Text(
                                    "CARTA RESPONSIVA DE BUENA SALUD",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    GlobalFunctions.launchURL(
                                        "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/Carta-responsiva-de-buena-salud.pdf");
                                    setState(() {
                                      Utilidades.aviso2 = true;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "Imprime y rellena los documentos ya que se deberán entregar al Departamento de Fomento Artístico, al momento de traer su orden de pago.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle3 + 2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff9D2449),
                    minimumSize: const Size(88, 36),
                    maximumSize: const Size(200, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  onPressed: () {
                    if (Utilidades.aviso1 == true &&
                        Utilidades.aviso2 == true) {
                      registerUser();
                    } else {
                      AchievementView(
                        context,
                        title: "Mensaje",
                        subTitle:
                            "Es necesario descargar ambos avisos de privacidad para continuar.",
                        icon: const Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.white,
                        ),
                        color: Colors.amber,
                        textStyleTitle: const TextStyle(color: Colors.white),
                        textStyleSubTitle: const TextStyle(color: Colors.white),
                        alignment: Alignment.centerRight,
                        duration: const Duration(seconds: 3),
                        isCircle: true,
                      ).show();
                    }
                  },
                  child: processing == false
                      ? const Text('Enviar')
                      : const CircularProgressIndicator(
                          color: Color(0xff9D2449),
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Utilidades.raisedButtonStyle,
                  onPressed: () {
                    if (int.parse(Utilidades.edad) < 18) {
                      context.vRouter.to('/formulario5');
                    } else {
                      context.vRouter.to('/formulario4');
                    }
                  },
                  child: const Text('Anterior'),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }

  void registerUser() async {
    setState(() {
      processing = true;
    });
    var data = {
      "primerA": Utilidades.primerApellido,
      "segundoA": Utilidades.segundoApellido,
      "nombres": Utilidades.nombre,
      "fechaNac": Utilidades.fechaNacimiento,
      "genero": Utilidades.genero,
      "entidad": Utilidades.entidadFederativa,
      "curp": Utilidades.curp,
      "curp_path": Utilidades.nameFile,
      "estadoCivil": Utilidades.estadoCivil,
      "calle": Utilidades.calle,
      "numE": Utilidades.numeroExterior,
      "numI": Utilidades.numeroInterior,
      "vialidad": Utilidades.tipoVialidad,
      "colonia": Utilidades.colonia,
      "asentamiento": Utilidades.tipoAsentamiento,
      "cp": Utilidades.codigoPostal,
      "municipio": Utilidades.selectMunicipio,
      "otroEstado": Utilidades.otroEstado,
      "tipoSangre": Utilidades.tipoSangre,
      "bdiscapacidad": Utilidades.discapacidad,
      "ddiscapacidad": Utilidades.dDiscapacidad,
      "balergia": Utilidades.alergia,
      "dalergia": Utilidades.dAlergia,
      "tipoInscripcion": Utilidades.tipoInscripcion,
      "telM": Utilidades.telefonoMovil,
      "telF": Utilidades.telefonoFijo,
      "pResponsable": Utilidades.paternoResponsable,
      "mResponsable": Utilidades.maternoResponsable,
      "nResponsable": Utilidades.nombreResponsable,
      "telMRes": Utilidades.movilResponsable,
      "telFRes": Utilidades.fijoResponsable,
      "autorizacion": Utilidades.autoImagen,
      "email": cookie.get('correo').toString(),
      "consulta": "registroData"
    };

    var dio = Dio();
    var res = await dio.get(
        "https://casadelaculturaoaxaca.com/api/benefit/fast_query",
        queryParameters: data);
    if (res.data == "exito") {
      AchievementView(
        context,
        title: "DATOS GUARDADOS",
        subTitle: "Inicia sesión para inscribirte.",
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 3),
        isCircle: true,
      ).show();
      setState(() {
        Utilidades.primerApellido = "";
        Utilidades.segundoApellido = "";
        Utilidades.nombre = "";
        Utilidades.fechaNacimiento = "";
        Utilidades.annioNaci = "";
        Utilidades.mesNaciNumber = "";
        Utilidades.mesNaciString = "";
        Utilidades.diaNaci = "";
        Utilidades.nameFile = "";
        Utilidades.genero = "";
        Utilidades.entidadFederativa = "";
        Utilidades.curp = "";
        Utilidades.nameFile = "";
        Utilidades.file = "";
        Utilidades.estadoCivil = "";
        Utilidades.calle = "";
        Utilidades.numeroExterior = "";
        Utilidades.numeroInterior = "";
        Utilidades.tipoVialidad = "";
        Utilidades.colonia = "";
        Utilidades.tipoAsentamiento = "";
        Utilidades.codigoPostal = "";
        Utilidades.selectMunicipio = "";
        Utilidades.otroEstado = "";
        Utilidades.tipoSangre = "";
        Utilidades.discapacidad = "";
        Utilidades.dDiscapacidad = "";
        Utilidades.alergia = "";
        Utilidades.dAlergia = "";
        Utilidades.tipoInscripcion = "";
        Utilidades.telefonoMovil = "";
        Utilidades.telefonoFijo = "";
        Utilidades.paternoResponsable = "";
        Utilidades.maternoResponsable = "";
        Utilidades.nombreResponsable = "";
        Utilidades.movilResponsable = "";
        Utilidades.fijoResponsable = "";
        Utilidades.autoImagen = "";

        Utilidades.form1check1 = false;
        Utilidades.form1check2 = false;

        Utilidades.form2check1 = false;
        Utilidades.form2check2 = false;

        Utilidades.form3check1 = false;
        Utilidades.form3check2 = false;

        Utilidades.form4check1_1 = false;
        Utilidades.form4check1_2 = false;
        Utilidades.form4check2_1 = false;
        Utilidades.form4check2_2 = false;
        Utilidades.form4check3_1 = false;
        Utilidades.form4check3_2 = false;

        Utilidades.form6check1 = false;
        Utilidades.form6check2 = false;

        Utilidades.form4Validator1 = false;
        Utilidades.form4Validator2 = false;
      });

      context.vRouter.to('/inscripciones');
    }

    setState(() {
      processing = false;
    });
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }

  
}
