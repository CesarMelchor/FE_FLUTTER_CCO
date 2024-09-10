import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:load/load.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class RestoredPassword extends StatefulWidget {
  const RestoredPassword({Key? key}) : super(key: key);

  @override
  State<RestoredPassword> createState() => _RestoredPasswordState();
}

class _RestoredPasswordState extends State<RestoredPassword>
    with SingleTickerProviderStateMixin {
  late Response response;
  var dio = Dio();
  final formKey = GlobalKey<FormState>();
  String correo = "";
  String curp = "";
  String newPass = "";

  final _correo = TextEditingController();
  final _curp = TextEditingController();
  final _newPass = TextEditingController();

  bool processing = false;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Utilidades.grisFooter,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/inscripciones"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                responsive == false
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageNetwork(
                              imagen:
                                  "https://casadelaculturaoaxaca.com/images/base_datos2.png",
                              widthImage: 400),
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Recuperar ',
                                        style: TextStyle(
                                            color: const Color(0xff9D2449),
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'contraseña',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      Utilidades.fontHelBold,
                                                  fontSize:
                                                      Utilidades.sizeTitle3)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: Text(
                                        "Ingresa correctamente los siguientes datos:",
                                        style: TextStyle(
                                            fontFamily: Utilidades.fontHelBold,
                                            fontSize: Utilidades.sizeTitle3),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: TextFormField(
                                      controller: _correo,
                                      onSaved: (value) {
                                        setState(() {
                                          correo = value!;
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
                                                color: Color(0xff9D2449)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    237, 158, 158, 158)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        hintText: 'Correo electrónico',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                      ],
                                      controller: _curp,
                                      onSaved: (value) {
                                        setState(() {
                                          curp = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff9D2449)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    237, 158, 158, 158)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        hintText: 'CURP',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _newPass,
                                      onSaved: (value) {
                                        setState(() {
                                          newPass = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff9D2449)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    237, 158, 158, 158)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        hintText: 'Nueva contraseña',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: processing == false
                                        ? ElevatedButton(
                                            style: raisedButtonStyle,
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                restoredPass();
                                              }
                                            },
                                            child: const Text('Restablecer'),
                                          )
                                        : const CircularProgressIndicator(
                                            color: Color(0xff9D2449),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Recuperar ',
                                      style: TextStyle(
                                          color: const Color(0xff9D2449),
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.sizeTitle3),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'contraseña',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily:
                                                    Utilidades.fontHelBold,
                                                fontSize:
                                                    Utilidades.sizeTitle3)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text(
                                      "Ingresa correctamente los siguientes datos:",
                                      style: TextStyle(
                                          fontFamily: Utilidades.fontHelBold,
                                          fontSize: Utilidades.sizeTitle3),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _correo,
                                    onSaved: (value) {
                                      setState(() {
                                        correo = value!;
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
                                              color: Color(0xff9D2449)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      hintText: 'Correo electrónico',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TextFormField(
                                    inputFormatters: [
                                      UpperCaseTextFormatter(),
                                    ],
                                    controller: _curp,
                                    onSaved: (value) {
                                      setState(() {
                                        curp = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Este campo no puede estar vacío";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff9D2449)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      hintText: 'CURP',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _newPass,
                                    onSaved: (value) {
                                      setState(() {
                                        newPass = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Este campo no puede estar vacío";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff9D2449)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      hintText: 'Nueva contraseña',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: processing == false
                                      ? ElevatedButton(
                                          style: raisedButtonStyle,
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              restoredPass();
                                            }
                                          },
                                          child: const Text('Restablecer'),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Color(0xff9D2449),
                                        ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void restoredPass() async {
    setState(() {
      processing = true;
    });
    showCustomLoadingWidget(Image.asset("assets/logos/Logo_cco_2a.gif"),
        tapDismiss: false);
    var url = 'https://casadelaculturaoaxaca.com/api/benefit/fast_query';
    var data = {
      "consulta": "newPassword",
      "correo": _correo.text,
      "curp": _curp.text,
      "newPass": _newPass.text
    };

    var res = await dio.get(url, queryParameters: data);
    hideLoadingDialog();
    if (res.data == "NE") {
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
    } else if (res.data == "DI") {
      AchievementView(
        context,
        title: "Información inválida",
        subTitle: "La CURP es incorrecta.",
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
    } else if (res.data == "OK") {
      AchievementView(
        context,
        title: "Contraseña restablecida correctamente",
        subTitle: "Inicia sesión con tu nueva contraseña.",
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
      Utilidades.index = 6;
      context.vRouter.to('/resPassword');
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
