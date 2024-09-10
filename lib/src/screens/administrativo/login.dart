import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:load/load.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

import 'package:dio/dio.dart';

class LoginAdministrativo extends StatefulWidget {
  const LoginAdministrativo({Key? key}) : super(key: key);

  @override
  State<LoginAdministrativo> createState() => _LoginAdministrativoState();
}

class _LoginAdministrativoState extends State<LoginAdministrativo>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  final _correo = TextEditingController();
  final _contrasennia = TextEditingController();
  bool processing = false;
  String dropdownvalue = 'Seleccionar';

  var items = [
    'Seleccionar',
    'Administrador',
    'Jefe de equipo',
    'Usuario de apoyo',
    'General'
  ];

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
    if (size.width <= 844) {
    } else {}
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageNetwork(
                    imagen:
                        "https://casadelaculturaoaxaca.com/images/base_datos1.png",
                    widthImage: 400),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
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
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                              "Bienvenido al servicio de control escolar",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.sizeTitle3),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RichText(
                            text: TextSpan(
                              text: 'Inicia ',
                              style: TextStyle(
                                  color: const Color(0xff9D2449),
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.sizeTitle3),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'sesión',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: Utilidades.fontHelBold,
                                        fontSize: Utilidades.sizeTitle3)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                Utilidades.tipoUsuario = newValue;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: _correo,
                            onSaved: (value) {
                              setState(() {
                                cookie.set('correoControl', value!,
                                    maxAge: const Duration(days: 1));
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Este campo no puede estar vacío";
                              }
                              if (!value.contains('@')) {
                                return "Formato de correo inválido";
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
                                      BorderSide(color: Color(0xff9D2449)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(237, 158, 158, 158)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: 'Correo electrónico',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            obscureText: true,
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
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff9D2449)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(237, 158, 158, 158)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: 'Contraseña',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: processing == false
                              ? ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      loginAd();
                                    }
                                  },
                                  child: const Text('Ingresar'),
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
          ],
        ),
      ),
    );
  }

  void loginAd() async {
    Dio dio = Dio();
    setState(() {
      processing = true;
    });
    showCustomLoadingWidget(Image.asset("assets/logos/Logo_cco_2a.gif"),
        tapDismiss: false);
    var data = {
      "tipo_usuario": Utilidades.tipoUsuario,
      "correo": _correo.text,
      "contrasennia": _contrasennia.text,
      "consulta": "loginAd",
    };

    var res = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: data);
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
    } else if (res.data == "TI") {
      AchievementView(
        context,
        title: "Tipo de usuario",
        subTitle: "El tipo de usuario es incorrecto.",
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
    } else {
      switch (Utilidades.tipoUsuario) {
        case "Administrador":
          context.vRouter.to('/homeAdmin');
          break;
        case "General":
          context.vRouter.to('/homeGeneral');
          break;
        case "Jefe de equipo":
          var id = res.data;

          cookie.set('correoControl', _correo.text,
              maxAge: const Duration(days: 1));
          cookie.set('idControl', id, maxAge: const Duration(days: 1));

          context.vRouter.to('/homeJefe');
          break;
        case "Usuario de apoyo":
          var id = res.data;

          cookie.set('correoControl', _correo.text,
              maxAge: const Duration(days: 1));
          cookie.set('idControl', id, maxAge: const Duration(days: 1));

          context.vRouter.to('/homeUser');
          break;
        case "Base":
          var id = res.data;

          cookie.set('correoControl', _correo.text,
              maxAge: const Duration(days: 1));
          cookie.set('idControl', id, maxAge: const Duration(days: 1));

          context.vRouter.to('/userCredencial');
          break;
        default:
      }
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
