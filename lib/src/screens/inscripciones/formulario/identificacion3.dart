import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:vrouter/vrouter.dart';

class IdentificacionPage3 extends StatefulWidget {
  const IdentificacionPage3({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage3> createState() => _IdentificacionPage3State();
}

class _IdentificacionPage3State extends State<IdentificacionPage3> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final Future? myFuture = getEdad();
  bool otro = false;
  final _calle = TextEditingController(text: Utilidades.calle);
  final _numeroExterior =
      TextEditingController(text: Utilidades.numeroExterior);
  final _numeroInterior =
      TextEditingController(text: Utilidades.numeroInterior);
  final _colonia = TextEditingController(text: Utilidades.colonia);
  final _otroEstado = TextEditingController(text: Utilidades.otroEstado);
  final _codigoPostal = TextEditingController(text: Utilidades.codigoPostal);
  // ignore: unused_field, prefer_final_fields
  String _valueChanged1 = '';
  // ignore: unused_field, prefer_final_fields
  String _valueToValidate1 = '';
  // ignore: unused_field, prefer_final_fields
  String _valueSaved1 = '';

  @override
  Widget build(BuildContext context) {
    myFuture;
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
              Navigator.pushReplacementNamed(context, "/formulario2");
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Text("Regresar"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(
              left: Utilidades.leftGeneral, right: Utilidades.rightGeneral),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Datos de identificación del (la) alumno (a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                "En este apartado se solicitarán los datos básicos de identificación de la persona que tomará el taller artístico de su elección.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                "El presente formulario no acepta acentos.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "Dirección del(la) alumno (a):",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle2 + 2),
              ),
            ),
            Text(
              "Calle",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ ]"))
                ],
                controller: _calle,
                onChanged: (value) {
                  setState(() {
                    Utilidades.calle = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Este campo no puede estar vacío";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
            ),
            Text(
              "Número exterior (Escribe 0 en caso de no contar con él.):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                ],
                keyboardType: TextInputType.number,
                controller: _numeroExterior,
                onChanged: (value) {
                  setState(() {
                    Utilidades.numeroExterior = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Este campo no puede estar vacío";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
            ),
            Text(
              "Número interior",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: _numeroInterior,
                onChanged: (value) {
                  setState(() {
                    Utilidades.numeroInterior = value;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
            ),
            Text(
              "Tipo de vialidad: ",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.vialidad,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.vialidad.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    Utilidades.tipoVialidad = value;
                  } else {
                    Utilidades.tipoVialidad = "";
                  }
                },
              ),
            ),
            Text(
              "Colonia: ",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ ]"))
                ],
                controller: _colonia,
                onChanged: (value) {
                  setState(() {
                    Utilidades.colonia = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Este campo no puede estar vacío";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
            ),
            Text(
              "Tipo de asentamiento:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.asentamiento,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.asentamiento.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      Utilidades.tipoAsentamiento = value;
                    });
                  } else {
                    setState(() {
                      Utilidades.tipoAsentamiento = "";
                    });
                  }
                },
              ),
            ),
            Text(
              "Código Postal",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  GlobalFunctions.launchURL(
                      "https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/Descarga.aspx");
                },
                child: Text(
                  "Puede consultarlo aquí. ",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.fontSizeTitle2,
                      color: Utilidades.rosa),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                maxLength: 5,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: _codigoPostal,
                onChanged: (value) {
                  setState(() {
                    Utilidades.codigoPostal = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Este campo no puede estar vacío";
                  }
                  if (value.length < 5) {
                    return "Ingresa los 5 dígitos";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
            ),
            Text(
              "Municipio:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.municipio,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.municipio.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      Utilidades.selectMunicipio = value;
                    });

                    if (Utilidades.selectMunicipio == "Otro") {
                      setState(() {
                        otro = true;
                      });
                    } else {
                      setState(() {
                        otro = false;
                      });
                    }
                  } else {
                    Utilidades.selectMunicipio = "";
                  }
                },
              ),
            ),
            Text(
              "Otro (especificar): ",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2,
                  fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                enabled: otro,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ ]"))
                ],
                controller: _otroEstado,
                onChanged: (value) {
                  setState(() {
                    Utilidades.otroEstado = value;
                  });
                },
                validator: (value) {
                  if (otro == true) {
                    if (value!.isEmpty) {
                      return "Este campo no puede estar vacío";
                    }
                  }

                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9D2449)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(237, 158, 158, 158)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Utilidades.radiusForm))),
                ),
              ),
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
                    context.vRouter.to('/formulario2');
                  },
                  child: const Text('Anterior'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: Utilidades.raisedButtonStyle,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (Utilidades.tipoVialidad == "" ||
                            Utilidades.vialidad == "Seleccionar") {
                          AchievementView(
                            context,
                            title: "Aviso",
                            subTitle: "Tipo de vialidad no válido.",
                            icon: const Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 3),
                            isCircle: true,
                          ).show();
                        } else if (Utilidades.tipoAsentamiento == "" ||
                            Utilidades.tipoAsentamiento == "Seleccionar") {
                          AchievementView(
                            context,
                            title: "Aviso",
                            subTitle: "Tipo de asentamiento no válido.",
                            icon: const Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 3),
                            isCircle: true,
                          ).show();
                        } else if (Utilidades.selectMunicipio == "" ||
                            Utilidades.selectMunicipio == "Seleccionar") {
                          AchievementView(
                            context,
                            title: "Aviso",
                            subTitle: "Municipio no válido.",
                            icon: const Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 3),
                            isCircle: true,
                          ).show();
                        } else if (Utilidades.tipoAsentamiento != "" &&
                            Utilidades.tipoVialidad != "" &&
                            Utilidades.selectMunicipio != "" &&
                            Utilidades.tipoAsentamiento != "Seleccionar" &&
                            Utilidades.tipoVialidad != "Seleccionar" &&
                            Utilidades.selectMunicipio != "Seleccionar") {
                          context.vRouter.to('/formulario4');
                        }
                      }
                    },
                    child: const Text('Siguiente'),
                  ),
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

  Future getEdad() async {
    var dio = Dio();

    var res = await dio.get(
        "https://casadelaculturaoaxaca.com/api/benefit/fast_query",
        queryParameters: {
          "consulta": "getEdadPrev",
          "fecha": Utilidades.fechaNacimiento
        });

    print(res.data);
    setState(() {
      Utilidades.edadObtenida = int.parse(res.data);
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
