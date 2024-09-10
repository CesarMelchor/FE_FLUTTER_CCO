import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:load/load.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Inscripciones extends StatefulWidget {
  const Inscripciones({Key? key}) : super(key: key);

  @override
  State<Inscripciones> createState() => _InscripcionesState();
}

class _InscripcionesState extends State<Inscripciones>
    with SingleTickerProviderStateMixin {
  late Response response;
  var dio = Dio();

  final formKey = GlobalKey<FormState>();

  final _correo = TextEditingController();
  final _contrasennia = TextEditingController();
  late String correo;
  late String contrasennia;
  bool processing = false;
  bool ocultar = true;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/fondo_inscripciones.jpg"))),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            responsive == false
                ? Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.circular(20)),
                    width: (size.width / 10) * 9,
                    height: (size.height / 10) * 7,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: (size.width / 10) * 9,
                          child: Row(
                            children: [
                              Image.asset("assets/images/logos_cco_nuevos.png"),
                              Expanded(child: Container()),
                              Image.asset(
                                "assets/images/eslogan.png",
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 70, top: 30, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "¡Hola!",
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        child: Text(
                                            "Bienvenido al micrositio de inscripción de los talleres artísticos",
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelBold,
                                                fontSize:
                                                    Utilidades.sizeTitle3),
                                            textAlign: TextAlign.center),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          "Inicia sesión",
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelBold,
                                              fontSize: Utilidades.sizeTitle3),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: TextFormField(
                                          controller: _correo,
                                          onChanged: (value) {
                                            setState(() {
                                              correo = value;
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
                                            if (!value.contains('com')) {
                                              return "Formato de correo inválido";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        237, 158, 158, 158))),
                                            hintText: 'Correo electrónico',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: TextFormField(
                                          obscureText: ocultar,
                                          controller: _contrasennia,
                                          onSaved: (value) {
                                            setState(() {
                                              Utilidades.passLogin = value!;
                                            });
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Este campo no puede estar vacío";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      237, 158, 158, 158)),
                                            ),
                                            hintText: 'Contraseña',
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    ocultar = !ocultar;
                                                  });
                                                },
                                                child: ocultar == true
                                                    ? const Icon(
                                                        Icons.visibility)
                                                    : const Icon(
                                                        Icons.visibility_off)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: processing == false
                                            ? Container(
                                                color: Color.fromARGB(
                                                    255, 249, 249, 249),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          shadowColor: Colors
                                                              .transparent),
                                                  onPressed: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      loginUser();
                                                    }
                                                  },
                                                  child: const Text(
                                                    'INGRESAR',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              )
                                            : const CircularProgressIndicator(
                                                color: Color(0xff9D2449),
                                              ),
                                      ),
                                      Text(
                                        "¿No tienes una cuenta?'",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily:
                                                Utilidades.fontHelRegular,
                                            fontSize: Utilidades.sizeTitle5),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 249, 249, 249),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor:
                                                    Colors.transparent),
                                            onPressed: () {
                                              setState(() {
                                                Utilidades.index = 6;
                                              });
                                              context.vRouter.to('/registro');
                                            },
                                            child: const Text(
                                              'CREAR CUENTA',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Utilidades.index = 6;
                                          });
                                          context.vRouter.to('/resPassword');
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            text: '¿Olvidaste tu contraseña? ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily:
                                                    Utilidades.fontHelRegular,
                                                fontSize:
                                                    Utilidades.sizeTitle5),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '¡Haz click aquí!',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily: Utilidades
                                                          .fontHelRegular,
                                                      fontSize: Utilidades
                                                          .sizeTitle5)),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 700,
                              height: 430,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          Svg("assets/svg/cuadros_fondo.svg"))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text("INSCRIPCIONES",
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.sizeTitle2)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("TALLERES ARTÍSTICOS",
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelRegular,
                                          fontSize: Utilidades.sizeTitle3))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "¡Hola!",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelBold,
                                      fontSize: Utilidades.sizeTitle3),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text(
                                      "Bienvenido al micrositio de inscripción de los talleres artísticos",
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.sizeTitle3),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "Inicia sesión",
                                    style: TextStyle(
                                        fontFamily: Utilidades.fontHelBold,
                                        fontSize: Utilidades.sizeTitle3),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _correo,
                                    onChanged: (value) {
                                      setState(() {
                                        correo = value;
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
                                      if (!value.contains('com')) {
                                        return "Formato de correo inválido";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      hintText: 'Correo electrónico',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    obscureText: ocultar,
                                    controller: _contrasennia,
                                    onChanged: (value) {
                                      setState(() {
                                        Utilidades.passLogin = value;
                                      });
                                    },
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Este campo no puede estar vacío";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      hintText: 'Contraseña',
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              ocultar = !ocultar;
                                            });
                                          },
                                          child: ocultar == true
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: processing == false
                                      ? Container(
                                          color: Color.fromARGB(
                                              255, 249, 249, 249),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor:
                                                    Colors.transparent),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                loginUser();
                                              }
                                            },
                                            child: const Text(
                                              'INGRESAR',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.blue,
                                        ),
                                ),
                                Text(
                                  "¿No tienes una cuenta?'",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Utilidades.fontHelRegular,
                                      fontSize: Utilidades.sizeTitle5),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    color: Color.fromARGB(255, 249, 249, 249),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {
                                        setState(() {
                                          Utilidades.index = 6;
                                        });
                                        context.vRouter.to('/registro');
                                      },
                                      child: const Text(
                                        'CREAR CUENTA',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Utilidades.index = 6;
                                    });
                                    context.vRouter.to('/resPassword');
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: '¿Olvidaste tu contraseña? ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Utilidades.fontHelRegular,
                                          fontSize: Utilidades.sizeTitle5),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '¡Haz click aquí!',
                                            style: TextStyle(
                                                color: const Color(0xff9D2449),
                                                fontFamily:
                                                    Utilidades.fontHelRegular,
                                                fontSize:
                                                    Utilidades.sizeTitle5)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      processing = true;
    });
    showCustomLoadingWidget(Image.asset("assets/logos/Logo_cco_2a.gif"),
        tapDismiss: false);
    var url = "https://casadelaculturaoaxaca.com/api/benefit/fast_query";
    var data = {
      "consulta": "login",
      "correo": _correo.text,
      "contrasennia": _contrasennia.text
    };

    var res = await dio.get(url, queryParameters: data);
    hideLoadingDialog();
    if (res.data == "noexiste.") {
      AchievementView(
        context,
        title: "Correo inválido",
        subTitle: "Este correo no existe.",
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        color: Colors.red,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    } else if (res.data == "incorrecta") {
      AchievementView(
        context,
        title: "Contraseña incorrecta",
        subTitle: "La contraseña es incorrecta.",
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
    } else if (res.data == "datos") {
      cookie.set('correo', _correo.text, maxAge: const Duration(hours: 2));

      context.vRouter.to('/bienvenida');
    } else {
      cookie.set('correo', _correo.text, maxAge: const Duration(hours: 2));
      context.vRouter.to('/homeBenefit');
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
