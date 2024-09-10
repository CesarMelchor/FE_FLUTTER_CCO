import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:vrouter/vrouter.dart';

class IdentificacionPage4 extends StatefulWidget {
  const IdentificacionPage4({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage4> createState() => _IdentificacionPage4State();
}

class _IdentificacionPage4State extends State<IdentificacionPage4> {
  bool processing = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _discapacidad = TextEditingController(text: Utilidades.discapacidad);
  final _alergia = TextEditingController(text: Utilidades.alergia);
  final _telefonoFijo = TextEditingController(text: Utilidades.telefonoFijo);
  final _telefonoMovil = TextEditingController(text: Utilidades.telefonoMovil);

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
              Navigator.pushReplacementNamed(context, "/formulario3");
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
            Text(
              "Tipo de sangre del (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.sangre,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.sangre.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    Utilidades.tipoSangre = value;
                  } else {
                    Utilidades.tipoSangre = "";
                  }
                },
              ),
            ),
            Text(
              "¿El alumno o la alumna presenta alguna discapacidad?",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "SI",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check1_1,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.discapacidad = "SI";
                          Utilidades.form4check1_1 = true;
                          Utilidades.form4check1_2 = false;
                          Utilidades.form4Validator1 = true;
                        });
                      },
                    ),
                  ),
                  Text(
                    "NO",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check1_2,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.discapacidad = "NO";
                          Utilidades.form4check1_2 = true;
                          Utilidades.form4check1_1 = false;
                          Utilidades.form4Validator1 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "En caso afirmativo, mencione el tipo de discapacidad:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ]"))
                ],
                controller: _discapacidad,
                onChanged: (value) {
                  setState(() {
                    Utilidades.dDiscapacidad = value;
                  });
                },
                validator: (value) {
                  if (Utilidades.form4Validator1) {
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
            Text(
              "¿El alumno o la alumna padece algún tipo de alergia?",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "SI",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check2_1,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.alergia = "SI";
                          Utilidades.form4check2_1 = true;
                          Utilidades.form4check2_2 = false;
                          Utilidades.form4Validator2 = true;
                        });
                      },
                    ),
                  ),
                  Text(
                    "NO",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check2_2,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.alergia = "NO";
                          Utilidades.form4check2_2 = true;
                          Utilidades.form4check2_1 = false;
                          Utilidades.form4Validator2 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "En caso afirmativo, mencione el tipo de alergia:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ]"))
                ],
                controller: _alergia,
                onChanged: (value) {
                  setState(() {
                    Utilidades.dAlergia = value;
                  });
                },
                validator: (value) {
                  if (Utilidades.form4Validator2) {
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
            Text(
              "Tipo de inscripción del (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Nuevo ingreso",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check3_1,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.tipoInscripcion = "NUEVO INGRESO";
                          Utilidades.form4check3_1 = true;
                          Utilidades.form4check3_2 = false;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Reinscripción",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form4check3_2,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.tipoInscripcion = "REINSCRIPCION";
                          Utilidades.form4check3_2 = true;
                          Utilidades.form4check3_1 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "Datos de contacto:",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.fontSizeTitle1),
              ),
            ),
            Text(
              "Teléfono móvil (10 dígitos):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _telefonoMovil,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (value) {
                  setState(() {
                    Utilidades.telefonoMovil = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Este campo no puede estar vacío";
                  }
                  if (value.length < 10) {
                    return "Ingresa los 10 dígitos";
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
              "Teléfono fijo (10 dígitos):",
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
                maxLength: 10,
                controller: _telefonoFijo,
                onChanged: (value) {
                  setState(() {
                    Utilidades.telefonoFijo = value;
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
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Utilidades.raisedButtonStyle,
                  onPressed: () {
                    context.vRouter.to('/formulario3');
                  },
                  child: const Text('Anterior'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: Utilidades.raisedButtonStyle,
                    onPressed: () {
                      if (Utilidades.form4check1_1 == false &&
                          Utilidades.form4check1_2 == false) {
                        _buildAlertDialog1(context,
                            "Por favor, especifique si el alumno tiene alguna discapacidad");
                      } else if (Utilidades.form4check2_1 == false &&
                          Utilidades.form4check2_2 == false) {
                        _buildAlertDialog1(context,
                            "Por favor, especifique si el alumno tiene alguna alergia");
                      } else if (Utilidades.form4check3_1 == false &&
                          Utilidades.form4check3_2 == false) {
                        _buildAlertDialog1(context,
                            "Por favor, especifique si el alumno es de nuevo ingreso o reinscripción");
                      } else if (Utilidades.tipoSangre == "" ||
                          Utilidades.tipoSangre == "Seleccionar") {
                        AchievementView(
                          context,
                          title: "Aviso",
                          subTitle: "Tipo de sangre no válido.",
                          icon: const Icon(
                            Icons.warning_rounded,
                            color: Colors.white,
                          ),
                          color: Colors.amber,
                          textStyleTitle: const TextStyle(color: Colors.white),
                          textStyleSubTitle:
                              const TextStyle(color: Colors.white),
                          alignment: Alignment.centerRight,
                          duration: const Duration(seconds: 3),
                          isCircle: true,
                        ).show();
                      } else if (Utilidades.tipoSangre != "") {
                        if (formKey.currentState!.validate()) {
                          if (Utilidades.edadObtenida <= 17) {
                            context.vRouter.to('/formulario5');
                          } else if (Utilidades.edadObtenida >= 18) {
                            context.vRouter.to('/formulario6');
                          }
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

  _buildAlertDialog1(BuildContext context, String texto) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("ADVERTENCIA  "),
            insetPadding: EdgeInsets.symmetric(
                horizontal: Utilidades.alertHorizontal1, vertical: 250),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(texto)],
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
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
