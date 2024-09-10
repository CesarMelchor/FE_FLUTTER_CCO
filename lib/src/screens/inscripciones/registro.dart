import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:load/load.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class RegistroInscripciones extends StatefulWidget {
  const RegistroInscripciones({Key? key}) : super(key: key);

  @override
  State<RegistroInscripciones> createState() => _RegistroInscripcionesState();
}

class _RegistroInscripcionesState extends State<RegistroInscripciones> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _correoRegistro = TextEditingController();
  final _correoRegistro2 = TextEditingController();
  final _contrasenniaRegistro = TextEditingController();
  bool processing = false;
  late Response response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool responsive = false;
    if (size.width <= 844) {
      setState(() {
        Utilidades.responsiveIns = true;
      });
    } else {
      setState(() {
        Utilidades.responsiveIns = false;
      });
    }

    double _width = size.width / 5.8;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/inscripciones"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
            padding: EdgeInsets.only(left: _width, right: _width, top: 30),
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  context.vRouter.to('/inscripciones');
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Regresar",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle3),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Crear tu cuenta",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      "Para crear una cuenta ingresa tu correo electrónico de Gmail, este lo ocuparás para realizar el proceso de inscripción a uno o más de los talleres que ofrece la Casa de la Cultura Oaxaqueña.",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle3),
                    ),
                  ),
                  Text(
                    "Correo electrónico: ",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: TextFormField(
                      controller: _correoRegistro,
                      onChanged: (value) {
                        setState(() {
                          Utilidades.correoRegistro = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Este campo no puede estar vacío";
                        }

                        if (!value.contains('@')) {
                          return "Formato de correo inválido";
                        }

                        if (!value.contains('gmail')) {
                          return "El correo debe ser gmail";
                        }

                        if (!value.contains('.')) {
                          return "Formato de correo inválido";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff9D2449)),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(237, 158, 158, 158)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Text(
                    "Confirma tu correo electrónico: ",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: TextFormField(
                      controller: _correoRegistro2,
                      onChanged: (value) {
                        setState(() {
                          Utilidades.correoRegistro2 = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Este campo no puede estar vacío";
                        }

                        if (!value.contains('@')) {
                          return "Formato de correo inválido";
                        }

                        if (!value.contains('gmail')) {
                          return "El correo debe ser gmail";
                        }

                        if (!value.contains('.')) {
                          return "Formato de correo inválido";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff9D2449)),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(237, 158, 158, 158)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Puedes usar letras, números y signos de puntuación. Ejemplo : Cultura2023",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle3),
                    ),
                  ),
                  Text(
                    "Contraseña:",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: TextFormField(
                      controller: _contrasenniaRegistro,
                      onChanged: (value) {
                        setState(() {
                          Utilidades.passRegistro = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Este campo no puede estar vacío";
                        }
                        if (value.length < 8) {
                          return "Debes ingresar al menos 8 caracteres";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff9D2449)),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(237, 158, 158, 158)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "*Usa 8 o más caracteres.",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                        child: processing == false
                            ? ElevatedButton(
                                style: Utilidades.raisedButtonStyle2,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (Utilidades.correoRegistro ==
                                        Utilidades.correoRegistro2) {
                                      registerUser();
                                    } else {
                                      AchievementView(
                                        context,
                                        title: "Advertencia",
                                        subTitle:
                                            "Ambos correos electrónicos deben ser iguales.",
                                        icon: const Icon(
                                          Icons.warning,
                                          color: Colors.white,
                                        ),
                                        color: Colors.red,
                                        textStyleTitle: const TextStyle(
                                            color: Colors.white),
                                        textStyleSubTitle: const TextStyle(
                                            color: Colors.white),
                                        alignment: Alignment.centerRight,
                                        duration: const Duration(seconds: 5),
                                        isCircle: true,
                                      ).show();
                                    }
                                  }
                                },
                                child: const Text('CREAR CUENTA'),
                              )
                            : const CircularProgressIndicator(
                                color: Color(0xff9D2449),
                              )),
                  )
                ],
              ),
            ]),
      ),
    );
  }

  _buildAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: AlertDialog(
              title: const Text("NOTIFICACIÓN "),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utilidades.responsiveIns == false
                      ? ImageNetwork(
                          imagen:
                              "https://casadelaculturaoaxaca.com/images/pc_cuenta.png",
                          widthImage: 500)
                      : ImageNetwork(
                          imagen:
                              "https://casadelaculturaoaxaca.com/images/cel_cuenta.png",
                          widthImage: 250),
                  Text(
                    "Contraseña: " + Utilidades.passRegistro,
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle3),
                  )
                ],
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                      child: const Text("Aceptar"),
                      onPressed: () {
                        Navigator.pop(context);
                        context.vRouter.to('/inscripciones');
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

  void registerUser() async {
    showCustomLoadingWidget(Image.asset("assets/logos/Logo_cco_2a.gif"),
        tapDismiss: false);
    setState(() {
      processing = true;
    });
    var url = 'https://casadelaculturaoaxaca.com/api/benefit/fast_query';
    var data = {
      "consulta": "registro",
      "correo": _correoRegistro.text,
      "contrasennia": _contrasenniaRegistro.text
    };

    var res = await dio.get(url, queryParameters: data);
    hideLoadingDialog();
    if (res.data == "Registro realizado") {
      _buildAlertDialog(context);
    }
    if (res.data == "existe") {
      AchievementView(
        context,
        title: "Advertencia",
        subTitle: "Este correo electrónico ya está asociado a una cuenta.",
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

    setState(() {
      processing = false;
    });
  }
}
