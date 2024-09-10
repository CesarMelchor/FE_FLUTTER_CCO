import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/models/benefit.dart';
import 'package:micrositio_cco/src/models/talleres.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/utils/responsive.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';

class ExtemporaneoScreen extends StatefulWidget {
  const ExtemporaneoScreen({Key? key}) : super(key: key);

  @override
  State<ExtemporaneoScreen> createState() => _ExtemporaneoScreenState();
}

class _ExtemporaneoScreenState extends State<ExtemporaneoScreen> {
  TextEditingController nombre = TextEditingController();
  TextEditingController taller = TextEditingController();
  late final Future? myfuture = generateListTalleres();

  late Response response;
  var dio = Dio();

  List<Talleres> talleres = [];
  List<Talleres> talleresOriginales = [];
  Benefit tallerR = Benefit(
      id: "",
      nombre: "",
      paterno: "",
      materno: "",
      correo: "",
      curp: '',
      edad: '',
      fechaNac: '',
      genero: '',
      tipo: '');
  Benefit extemporaneoBe = Benefit(
      id: "",
      nombre: "",
      paterno: "",
      materno: "",
      correo: "",
      curp: '',
      edad: '',
      fechaNac: '',
      genero: '',
      tipo: '');
  Talleres extemporaneoTa = Talleres(
      id: "",
      idTrabajador: "",
      idJefe: "",
      campo: "",
      especialidad: "",
      clave: "",
      nombre: "",
      conocimientosPrevios: "",
      edadMinima: "",
      edadMaxima: "",
      tallerista: "",
      modalidad: "",
      dias: "",
      horario: "",
      cupo: "",
      salones: "",
      costo: "",
      linkImagen: "",
      solicitudes: "");

  bool gettinBenefit = false;

  Future generateListTalleres() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getTalleres"});

    final result = response.data;
    Iterable list = result['talleres'];
    talleres = list.map<Talleres>((json) => Talleres.fromJson(json)).toList();
    setState(() {
      talleresOriginales = talleres;
    });
    return talleres;
  }

  Future registro(contexto, correo, jefe, trabajador, clave) async {
    gettingData(context, "Realizando el registro ....");
    var data = {
      "consulta": "registroEx",
      "correo": correo,
      "jefe": jefe,
      "trabajador": trabajador,
      "clave": clave
    };

    var res = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: data);
    Navigator.pop(contexto);

    if (res.data == "OK") {
      AchievementView(
        context,
        title: "Registro realizado",
        subTitle: "El registro se realizó correctamente.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
    if (res.data == "RE") {
      AchievementView(
        context,
        title: "Registro repetido",
        subTitle: "Existe un registro.",
        icon: const Icon(
          Icons.warning,
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
  }

  Future getDataBenefit(correo, contexto) async {
    gettingData(contexto, "Obteniendo información de beneficiario ....");
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getBenefitbyCorreo", "correo": correo});

    final result = response.data;

    var tallerBe = Benefit.fromJson(result);
    setState(() {
      tallerR = tallerBe;
    });
    Navigator.pop(context);

    return tallerBe;
  }

  String conciliados = "";

  Future getRegisters(taller, contexto) async {
    gettingData(contexto, "Obteniendo registros ....");
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getRegistersById", "taller": taller});

    final result = response.data;

    setState(() {
      conciliados = result;
    });
    Navigator.pop(context);

    return result;
  }

  void searchRegister(String nombre) {
    talleres = talleresOriginales;

    String input = "";
    dynamic registerMail;

    if (nombre.isNotEmpty) {
      final resultados = talleres.where((element) {
        registerMail = element.clave.toLowerCase();
        input = nombre.toLowerCase();

        return registerMail.contains(input);
      }).toList();

      setState(() {
        talleres = resultados;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: FutureBuilder(
        future: myfuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: responsive.width / 3.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: responsive.width / 3.5,
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          controller: nombre,
                                          onChanged: (value) {},
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Este campo no puede estar vacío";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    getDataBenefit(
                                                        nombre.text, context);
                                                  },
                                                  child:
                                                      const Icon(Icons.search)),
                                              labelText:
                                                  "Correo electrónico ....",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                          height: (responsive.height / 3) * 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "NOMBRE (S) : " +
                                                    tallerR.nombre,
                                                style: TextStyle(
                                                    fontFamily:
                                                        Utilidades.fontHelBold,
                                                    fontSize:
                                                        Utilidades.sizeTitle3),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "APELLIDO PATERNO : " +
                                                      tallerR.paterno,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "APELLIDO MATERNO : " +
                                                      tallerR.materno,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text("EDAD : " + tallerR.edad,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "FECHA DE NACIMIENTO : " +
                                                      tallerR.fechaNac,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text("GENERO : " + tallerR.genero,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text("CURP : " + tallerR.curp,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text("TIPO : " + tallerR.tipo,
                                                  style: TextStyle(
                                                      fontFamily: Utilidades
                                                          .fontHelBold,
                                                      fontSize: Utilidades
                                                          .sizeTitle3)),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      extemporaneoBe = tallerR;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_circle_right,
                                                    color: Utilidades.rosa,
                                                    size: 45,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )),
                            SizedBox(
                                width: responsive.width / 3,
                                child: Column(
                                  children: [
                                    Container(
                                      width: responsive.width / 3.5,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextFormField(
                                        controller: taller,
                                        onChanged: (value) {
                                          searchRegister(value);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Este campo no puede estar vacío";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Clave del taller ....",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: (responsive.width / 3) * 2,
                                      width: responsive.width / 3.4,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...talleres
                                                .map(buildSingleTextHorizontal)
                                                .toList(),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                                width: responsive.width / 3.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        "Registro extemporáneo",
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize:
                                                Utilidades.sizeTitle3 + 2),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "CLAVE : " + extemporaneoTa.clave,
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.sizeTitle3),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text("TALLER : " + extemporaneoTa.nombre,
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3)),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text("CUPO : " + extemporaneoTa.cupo,
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3)),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        "REGISTROS CONCILIADOS : " +
                                            conciliados,
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3)),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        "NOMBRE : " +
                                            extemporaneoBe.nombre +
                                            " " +
                                            extemporaneoBe.paterno +
                                            " " +
                                            extemporaneoBe.materno,
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3)),
                                    const SizedBox(
                                      height: 55,
                                    ),
                                    Center(
                                      child: OutlinedButton(
                                          onPressed: () {
                                            
                                              if (extemporaneoBe.nombre != "" && extemporaneoTa.clave != "") {
                                                
                                            var actual = int.parse(conciliados);
                                            var total =
                                                int.parse(extemporaneoTa.cupo);
                                                if (actual < total) {
                                              registro(
                                                  context,
                                                  extemporaneoBe.correo,
                                                  extemporaneoTa.idTrabajador,
                                                  extemporaneoTa.idTrabajador,
                                                  extemporaneoTa.clave);}  else {
                                              // Taller sin lugares disponibles
                                               AchievementView(
                                              context,
                                              title: "Taller sin disponibilidad",
                                              subTitle: "Este taller no tiene lugares disponibles.",
                                              icon: const Icon(
                                                Icons.warning,
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

                                              } else {
                                                // Modelo de beneficiario o taller vacío
                                               AchievementView(
                                                context,
                                                title: "Datos insuficientes",
                                                subTitle: "Vuelve a intentarlo.",
                                                icon: const Icon(
                                                  Icons.warning,
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
                                            
                                          },
                                          child: Text(
                                            " ENVIAR ",
                                            style: TextStyle(
                                                color: Utilidades.rosa,
                                                fontSize:
                                                    Utilidades.sizeTitle3 + 1),
                                          )),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomFooter()
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

  Widget buildTextHorizontal({required Talleres talleres}) => Column(
        children: [
          Card(
            elevation: 1,
            child: ListTile(
              title: Text("CLAVE: " + talleres.clave),
              subtitle: Text(talleres.nombre,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Utilidades.fontHelMedium,
                      fontSize: Utilidades.sizeTitle4 - 1)),
              trailing: InkWell(
                  onTap: () {
                    getRegisters(talleres.clave, context);
                    setState(() {
                      extemporaneoTa = talleres;
                    });
                  },
                  child: Tooltip(
                    message: "Elegir este taller.",
                    child: Icon(
                      Icons.arrow_circle_right,
                      size: 45,
                      color: Utilidades.rosa,
                    ),
                  )),
            ),
          ),
        ],
      );

  gettingData(BuildContext context, texto) {
    Responsive responsive = Responsive(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Image.asset(
              "assets/logos/Logo_cco_2a.gif",
              width: responsive.width,
              height: responsive.height,
            ),
            title: Text(texto),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        barrierColor: const Color.fromARGB(0, 255, 255, 255),
        barrierDismissible: false);
  }
}
