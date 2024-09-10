import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:vrouter/vrouter.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:achievement_view/achievement_view.dart';


class IdentificacionPage1 extends StatefulWidget {
  const IdentificacionPage1({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage1> createState() => _IdentificacionPage1State();
}

class _IdentificacionPage1State extends State<IdentificacionPage1> {
  final _scaffkey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String edadString = "";
  int edadPrev = 0;
  final _primerApellido =
      TextEditingController(text: Utilidades.primerApellido);
  final _segundoApellido =
      TextEditingController(text: Utilidades.segundoApellido);
  final _nombre = TextEditingController(text: Utilidades.nombre);
  final _annioNacimiento = TextEditingController(text: Utilidades.annioNaci);
  final _diaNacimiento = TextEditingController(text: Utilidades.diaNaci);
  // ignore: unused_field
  String _fechaNacimiento = "";
  // ignore: unused_field
  late String _genero;

  // ignore: unused_field
  String _valueChanged1 = '';
  // ignore: unused_field
  String _valueToValidate1 = '';
  // ignore: unused_field, prefer_final_fields
  String _valueSaved1 = '';

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
      key: _scaffkey,
      appBar: AppBar(
        backgroundColor: const Color(0xff9D2449),
        leading: IconButton(
            onPressed: () {
              context.vRouter.to('/inscripciones');
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Text("Salir"),
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
              "Primer apellido del (la) alumno(a):",
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
                controller: _primerApellido,
                onChanged: (value) {
                  setState(() {
                    Utilidades.primerApellido = value;
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
              "Segundo apellido del (la) alumno(a):",
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
                controller: _segundoApellido,
                onChanged: (value) {
                  setState(() {
                    Utilidades.segundoApellido = value;
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
              "Nombre(s) del (la) alumno(a):",
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
                controller: _nombre,
                onChanged: (value) {
                  setState(() {
                    Utilidades.nombre = value;
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
              "Año de nacimiento (YYYY):",
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
                controller: _annioNacimiento,
                onChanged: (value) {
                  setState(() {
                    Utilidades.annioNaci = value;
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
              "Mes de nacimiento :",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.meses,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.meses.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    Utilidades.mesNaciString = value;
                    switch (Utilidades.mesNaciString) {
                      case 'ENERO':
                        setState(() {
                          Utilidades.mesNaciNumber = "01";
                        });
                        break;
                      case 'FEBRERO':
                        setState(() {
                          Utilidades.mesNaciNumber = "02";
                        });
                        break;
                      case 'MARZO':
                        setState(() {
                          Utilidades.mesNaciNumber = "03";
                        });
                        break;
                      case 'ABRIL':
                        setState(() {
                          Utilidades.mesNaciNumber = "04";
                        });
                        break;
                      case 'MAYO':
                        setState(() {
                          Utilidades.mesNaciNumber = "05";
                        });
                        break;
                      case 'JUNIO':
                        setState(() {
                          Utilidades.mesNaciNumber = "06";
                        });
                        break;
                      case 'JULIO':
                        setState(() {
                          Utilidades.mesNaciNumber = "07";
                        });
                        break;
                      case 'AGOSTO':
                        setState(() {
                          Utilidades.mesNaciNumber = "08";
                        });
                        break;
                      case 'SEPTIEMBRE':
                        setState(() {
                          Utilidades.mesNaciNumber = "09";
                        });
                        break;
                      case 'OCTUBRE':
                        setState(() {
                          Utilidades.mesNaciNumber = "10";
                        });
                        break;
                      case 'NOVIEMBRE':
                        setState(() {
                          Utilidades.mesNaciNumber = "11";
                        });
                        break;
                      case 'DICIEMBRE':
                        setState(() {
                          Utilidades.mesNaciNumber = "12";
                        });
                        break;
                      default:
                    }
                  } else {
                    Utilidades.mesNaciString = "";
                  }
                },
              ),
            ),
            Text(
              "Día de nacimiento:",
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
                controller: _diaNacimiento,
                onChanged: (value) {
                  setState(() {
                    Utilidades.diaNaci = value;
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
              "Género del (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Hombre",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form1check1,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.form1check1 = true;
                          Utilidades.form1check2 = false;
                          _genero = "Hombre";
                          Utilidades.genero = "Hombre";
                        });
                      },
                    ),
                  ),
                  Text(
                    "Mujer",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form1check2,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.form1check2 = true;
                          Utilidades.form1check1 = false;
                          Utilidades.genero = "Mujer";
                          _genero = "Mujer";
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                style: Utilidades.raisedButtonStyle,
                onPressed: () {
                  if (Utilidades.form1check1 == false &&
                      Utilidades.form1check2 == false) {
                    _buildAlertDialog1(context);
                  } else {
                    setState(() {
                      Utilidades.primerApellido = _primerApellido.text;
                      Utilidades.segundoApellido = _segundoApellido.text;
                      Utilidades.nombre = _nombre.text;
                      Utilidades.fechaNacimiento = Utilidades.annioNaci +
                          "-" +
                          Utilidades.mesNaciNumber +
                          "-" +
                          Utilidades.diaNaci;
                    });
                    if (Utilidades.primerApellido != "" && Utilidades.segundoApellido !=""&& Utilidades.nombre !=""
                    && Utilidades.annioNaci !=""&& Utilidades.mesNaciNumber !=""&& Utilidades.diaNaci !="") {
                      context.vRouter.to('/formulario2');
                    }else{
AchievementView(
                                context,
                                title: "Aviso",
                                subTitle: "Rellena todos los datos correctamente.",
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
                    }
                  }
                },
                child: const Text('Siguiente'),
              ),
            ),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }

  _buildAlertDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("ADVERTENCIA  "),
            insetPadding: EdgeInsets.symmetric(
                horizontal: Utilidades.alertHorizontal1, vertical: 250),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Por favor, selecciona tu género")],
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
