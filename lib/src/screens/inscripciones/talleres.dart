import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/models/talleres.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
//import 'package:micrositio_cco/src/utils/mobile.dart'
//  if (dart.library.html) 'package:micrositio_cco/src/utils/web.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class TalleresScreen extends StatefulWidget {
  const TalleresScreen({Key? key}) : super(key: key);

  @override
  State<TalleresScreen> createState() => _TalleresScreenState();
}

class _TalleresScreenState extends State<TalleresScreen> {
  bool processing = false;
  var disciplina = cookie.get('campo').toString();

  List<Talleres> talleres = [];

  late Response response;
  var dio = Dio();

  Future generateListTalleres(especialidad) async {
    final consult = {
      'consulta': "getTalleres",
      'campo_art': cookie.get('campo').toString(),
      'especialidad': especialidad
    };

    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/benefit/fast_query',
        queryParameters: consult);
    final result = response.data;
    Iterable list = result['talleres'];
    talleres = list.map<Talleres>((json) => Talleres.fromJson(json)).toList();

    return talleres;
  }

  @override
  Widget build(BuildContext context) {
    var imagen = "";
    var texto = "";
    switch (disciplina) {
      case "CULTURA PARA NIÑOS Y NIÑAS":
        imagen = "assets/logos/logo_culturainfantil.png";
        texto = "CULTURA PARA NIÑOS Y NIÑAS";
        break;
      case "ARTES PLÁSTICAS":
        imagen = "assets/logos/logo_artesplasticas.png";
        texto = "ARTES PLÁSTICAS";
        break;
      case "DANZA":
        imagen = "assets/logos/logo_danza.png";
        texto = "DANZA";
        break;
      case "MÚSICA":
        imagen = "assets/logos/logo_musica.png";
        texto = "MÚSICA";
        break;
      case "TEATRO":
        imagen = "assets/logos/logo_teatro.png";
        texto = "TEATRO";
        break;
      case "ALTERNATIVOS":
        imagen = "assets/logos/logo_alternativos.png";
        texto = "ALTERNATIVOS";
        break;
      default:
    }
    Size size = MediaQuery.of(context).size;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
      Utilidades.responsive = true;
      Utilidades.widthDivider = size.width - 40;
    } else {
      responsive = false;
      Utilidades.responsive = false;
      Utilidades.widthDivider = size.width - 400;
    }
    if (responsive == false) {
      setState(() {
        Utilidades.sizeContainer = 440;
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
      });
    } else {
      setState(() {
        Utilidades.sizeContainer = 1;
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/especialidad"),
      ),
      body: FutureBuilder(
        future: generateListTalleres(cookie.get('seccion').toString()),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: Utilidades.leftGeneral,
                      right: Utilidades.rightGeneral),
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Image.asset(imagen),
                    ),
                    Center(
                        child: Text(
                      texto,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.fontSizeTitle3),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 25),
                      child: Center(
                          child: Text("CUATRIMESTRE MARZO - JUNIO DE 2023",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.fontSizeTitle2))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  context.vRouter.to('/especialidad');
                                },
                                child: const Icon(
                                  Icons.keyboard_return,
                                  color: Color(0xff9D2449),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: InkWell(
                                    onTap: () {
                                      context.vRouter.to('/especialidad');
                                    },
                                    child: Text(
                                      "Regresar",
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.fontSizeTitle3,
                                          color: const Color(0xff9D2449)),
                                    ))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Desliza para ver más",
                              textAlign: TextAlign.end,
                            ),
                            Icon(
                              Icons.arrow_downward_outlined,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                    Text("SECCIÓN : " + Utilidades.especialidad,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.fontSizeTitle3,
                            color: const Color(0xff9D2449))),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      width: size.width - 400,
                      color: Colors.black,
                    ),
                    ...talleres.map(buildSingleTextHorizontal).toList(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              context.vRouter.to('/talleres');
                            },
                            child: const Icon(
                              Icons.keyboard_return,
                              color: Color(0xff9D2449),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: InkWell(
                                onTap: () {
                                  context.vRouter.to('/especialidad');
                                },
                                child: Text(
                                  "Regresar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelBold,
                                      fontSize: Utilidades.fontSizeTitle3,
                                      color: const Color(0xff9D2449)),
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                )
              : Center(
                  child: Image.asset(
                    "assets/logos/Logo_cco_2a.gif",
                    height: 100,
                  ),
                );
        },
      ),
    );
  }

  Widget buildSingleTextHorizontal(Talleres talleres) =>
      buildTextHorizontal(talleres: talleres);

  Widget buildTextHorizontal({required Talleres talleres}) => Utilidades
              .responsive ==
          false
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    width: 100,
                    child: Text("Clave: ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
                SizedBox(
                    width: 300,
                    child: Text("Taller: ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
                const SizedBox(
                  width: 6,
                ),
                SizedBox(
                    width: 120,
                    child: Text("Edades : ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
                SizedBox(
                    width: 250,
                    child: Text("Horas: ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100,
                    child: Text(
                      talleres.clave,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontWeight: FontWeight.w900),
                    )),
                SizedBox(
                    width: 300,
                    child: Text(talleres.nombre,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold, fontSize: 11))),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                    width: 120,
                    child: Text(
                        talleres.edadMinima +
                            " a " +
                            talleres.edadMaxima +
                            " años",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
                SizedBox(
                    width: 250,
                    child: Text(talleres.horario,
                        style: TextStyle(fontFamily: Utilidades.fontHelBold)))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Tallerista : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.tallerista,
                            style:
                                TextStyle(fontFamily: Utilidades.fontHelBold))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Modalidad : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.modalidad,
                            style:
                                TextStyle(fontFamily: Utilidades.fontHelBold))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Cupo : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.cupo,
                            style:
                                TextStyle(fontFamily: Utilidades.fontHelBold))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Conocimientos previos : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        SizedBox(
                            width: 300,
                            child: Text(
                              talleres.conocimientosPrevios,
                              style:
                                  TextStyle(fontFamily: Utilidades.fontHelBold),
                              maxLines: 10,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Costo : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.costo,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Dias : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.dias,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text("Cupo actual : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.solicitudes,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 200,
                    ),
                    ElevatedButton(
                      style: Utilidades.raisedButtonStyle,
                      onPressed: () {
                        if (Utilidades.edadUserInt >=
                                int.parse(talleres.edadMinima) &&
                            Utilidades.edadUserInt <=
                                int.parse(talleres.edadMaxima)) {
                          setState(() {
                            Utilidades.imagenRuta = talleres.linkImagen;
                            Utilidades.tallerClave = talleres.clave;
                            Utilidades.tallerMail = talleres.nombre;
                            Utilidades.claveMail = talleres.clave;
                          });

                          registerInscripciones(talleres.clave, talleres.cupo,
                              disciplina, talleres.nombre, talleres.linkImagen);
                        } else if (Utilidades.edadUserInt <
                                int.parse(talleres.edadMinima) ||
                            Utilidades.edadUserInt >
                                int.parse(talleres.edadMaxima)) {
                          AchievementView(
                            context,
                            title: "Información",
                            subTitle: "Tu edad es de " +
                                Utilidades.edadUserString +
                                " años. No coincide con la edad del taller elegido.",
                            icon: const Icon(
                              Icons.warning_amber,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 5),
                            isCircle: true,
                          ).show();
                        }
                      },
                      child: const Text("Enviar solicitud"),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 227, 227),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 40,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 600,
                    child: Text(
                        "Objetivos y requerimientos: Es de suma importancia que tengas a la mano los requerimientos necesarios para el taller.",
                        maxLines: 4,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.fontSizeTitle3 - 4)),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  InkWell(
                    onTap: () {
                      //    _createPDF(
                      //      talleres.linkImagen.toString(), talleres.linkImagen);
                      GlobalFunctions.launchURL(
                          "https://casadelaculturaoaxaca.com/pdf/" +
                              talleres.clave +
                              ".pdf");
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/btn_descarga.png",
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Descargar",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.fontSizeTitle3 - 4)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 1,
                width: Utilidades.widthDivider,
                color: const Color(0xffa7a8aa)),
            const SizedBox(
              height: 10,
            ),
          ],
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    width: 70,
                    child: Text("Clave: ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
                SizedBox(
                    width: 200,
                    child: Text("Taller: ",
                        style: TextStyle(fontFamily: Utilidades.fontHelBold))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 70,
                    child: Text(
                      talleres.clave,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontWeight: FontWeight.w900),
                    )),
                SizedBox(
                    width: 200,
                    child: Text(talleres.nombre,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold, fontSize: 11))),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Horas : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.horario,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Costo : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.costo,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Edad : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(
                            talleres.edadMinima +
                                " a " +
                                talleres.edadMaxima +
                                " años",
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Dias : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.dias,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Cupo : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.solicitudes,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Cupo actual : ",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold))),
                        Text(talleres.solicitudes,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: Utilidades.raisedButtonStyle,
                      onPressed: () {
                        if (Utilidades.edadUserInt >=
                                int.parse(talleres.edadMinima) &&
                            Utilidades.edadUserInt <=
                                int.parse(talleres.edadMaxima)) {
                          setState(() {
                            Utilidades.imagenRuta = talleres.linkImagen;
                            Utilidades.tallerClave = talleres.clave;
                          });

                          registerInscripciones(
                              talleres.clave,
                              talleres.cupo,
                              disciplina,
                              talleres.nombre,
                              talleres.linkImagen.toString());
                        } else if (Utilidades.edadUserInt <
                                int.parse(talleres.edadMinima) ||
                            Utilidades.edadUserInt >
                                int.parse(talleres.edadMaxima)) {
                          AchievementView(
                            context,
                            title: "Información",
                            subTitle: "Tu edad es de " +
                                Utilidades.edadUserString +
                                " años. No coincide con la edad del taller elegido.",
                            icon: const Icon(
                              Icons.warning_amber,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 5),
                            isCircle: true,
                          ).show();
                        }
                      },
                      child: const Text("Enviar solicitud"),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 227, 227),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 90,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Objetivos y requerimientos: ",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.fontSizeTitle3),
                        maxLines: 10,
                      ),
                      SizedBox(
                          width: 200,
                          child: Text(
                            "Es de suma importancia que tengas a la mano los requerimientos necesarios para el taller.",
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.fontSizeTitle3),
                            maxLines: 6,
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(
                          "https://casadelaculturaoaxaca.com/pdf/" +
                              talleres.clave +
                              ".pdf");
                      //   _createPDF(
                      //     talleres.linkImagen.toString(), talleres.clave);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/btn_descarga.png",
                          height: 30,
                        ),
                        Text("Descargar",
                            style:
                                TextStyle(fontFamily: Utilidades.fontHelBold)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 1,
                width: Utilidades.widthDivider,
                color: const Color(0xffa7a8aa)),
            const SizedBox(
              height: 10,
            ),
          ],
        );

  Future sendEmail({
    required String email,
    required String imagen,
    required String color,
    required String taller,
    required String clave,
  }) async {
    var dio = Dio();
    final consult = jsonEncode({
      'correo_usuario': email,
      'imagen': imagen,
      'color': color,
      'taller': taller,
      'clave': clave,
    });
    // ignore: unused_local_variable
    final response = await dio.post(
      'https://casadelaculturaoaxaca.com/api/sendinblue',
      data: consult,
    );
  }

  _buildAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 70),
            child: AlertDialog(
              title: const Text("NOTIFICACIÓN "),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/pc_solicitud.png",
                    height: 300,
                  ),
                ],
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                      child: const Text("Aceptar"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }

  _buildAlertDialogMax300(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 70),
            child: AlertDialog(
              title: const Text("AVISO"),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tu solicitud fue realizada correctamente, sin embargo, no recibirás un correo electrónico de confirmación. ¿Tienes dudas sobre tu registro? Envíanos un Whats App al Centro de Mensajes de la Casa de la Cultura Oaxaqueña: 951 392 43 90.  ¡No se aceptan llamadas telefónicas!",
                    style: TextStyle(
                        fontSize: Utilidades.sizeTitle4,
                        fontFamily: Utilidades.fontHelBold),
                  ),
                ],
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                      child: const Text("Aceptar"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }

  void registerInscripciones(String clave, String cupo, String disciplina,
      String taller, String imagen) async {
    var dio = Dio();
    setState(() {
      processing = true;
    });

    var data = {
      "consulta": "registroTaller",
      "email": cookie.get('correo').toString(),
      "clave": clave,
      "cupo": cupo,
      "disciplinaweb": disciplina,
      "id_jefe": Utilidades.idJefeRegistro
    };
    var res = await dio.get(
        'https://casadelaculturaoaxaca.com/api/benefit/fast_query',
        queryParameters: data);
    if (res.data == "FIN") {
      AchievementView(
        context,
        title: "Aviso",
        subTitle: "Periodo de inscripciones inválido.",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
    if (res.data == "OK") {
      sendEmail(
          email: cookie.get('correo').toString(),
          taller: Utilidades.tallerMail,
          clave: Utilidades.claveMail,
          color: Utilidades.colorMail,
          imagen: Utilidades.imagenMail);
      _buildAlertDialog(context);
      GlobalFunctions.launchURL(
          "https://casadelaculturaoaxaca.com/pdf/" + clave + ".pdf");
      //  _createPDF(imagen, clavePng);
    }

    if (res.data == "M300") {
      sendEmail(
          email: cookie.get('correo').toString(),
          taller: Utilidades.tallerMail,
          clave: Utilidades.claveMail,
          color: Utilidades.colorMail,
          imagen: Utilidades.imagenMail);
      _buildAlertDialogMax300(context);

      // _createPDF(imagen, clavePng);
    }
    if (res.data == "FULL") {
      AchievementView(
        context,
        title: "Aviso",
        subTitle: "Este taller no cuenta con cupos disponibles.",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
    if (res.data == "MAXIMO") {
      AchievementView(
        context,
        title: "Aviso",
        subTitle: "Sólo puedes realizar un máximo de 8 registros.",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
    if (res.data == "REPETIDO") {
      AchievementView(
        context,
        title: "Aviso",
        subTitle: "Ya te encuentras registrado en este taller.",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }

    if (res.data == "ANTES") {
      AchievementView(
        context,
        title: "Aviso",
        subTitle: "Periodo de inscripciones inválido.",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }


    setState(() {
      processing = false;
    });
  }
}

/*
Future<void> _createPDFF(String image, String clave) async {
  var dio = Dio();
  var response = await dio.get<List<int>>(
      "https://casadelaculturaoaxaca.com/images/objetivos/" + clave,
      options: Options(responseType: ResponseType.bytes));
  var data = response.data;

  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  PdfBitmap image = PdfBitmap(data!);

  page.graphics.drawImage(
      image,
      Rect.fromLTWH(
          0, 0, page.getClientSize().width, page.getClientSize().height));

  List<int> bytes = await document.save();
  document.dispose();
  saveAndLaunchFile(bytes, clave + ".pdf");
}
*/