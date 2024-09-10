import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';

class IdentificacionPage5 extends StatefulWidget {
  const IdentificacionPage5({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage5> createState() => _IdentificacionPage5State();
}

class _IdentificacionPage5State extends State<IdentificacionPage5> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _paternoResponsable =
      TextEditingController(text: Utilidades.paternoResponsable);
  final _maternoResponsable =
      TextEditingController(text: Utilidades.maternoResponsable);
  final _nombreResponsable =
      TextEditingController(text: Utilidades.nombreResponsable);
  final _fijoResponsable =
      TextEditingController(text: Utilidades.fijoResponsable);
  final _movilResponsable =
      TextEditingController(text: Utilidades.movilResponsable);

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
              Navigator.pushReplacementNamed(context, "/formulario4");
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Text("Regresar"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.only(
              left: Utilidades.leftGeneral, right: Utilidades.rightGeneral),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Datos de la persona responsable del (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                "En este apartado es importante contar con los datos de una de las personas responsables parentales del menor:",
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
              "Apellido paterno de la persona responsable:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _paternoResponsable,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ ]"))
                ],
                onChanged: (value) {
                  setState(() {
                    Utilidades.paternoResponsable = value;
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
              "Apellido materno de la persona responsable:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _maternoResponsable,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ]"))
                ],
                onChanged: (value) {
                  setState(() {
                    Utilidades.maternoResponsable = value;
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
              "Nombre(s) de la persona responsable:",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _nombreResponsable,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZñÑ ]"))
                ],
                onChanged: (value) {
                  setState(() {
                    Utilidades.nombreResponsable = value;
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
              "Teléfono móvil de la persona responsable (10 dígitos):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _movilResponsable,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (value) {
                  setState(() {
                    Utilidades.movilResponsable = value;
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
              "Teléfono fijo de la persona responsable (10 dígitos):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                controller: _fijoResponsable,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (value) {
                  setState(() {
                    Utilidades.fijoResponsable = value;
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
                    context.vRouter.to('/formulario4');
                  },
                  child: const Text('Anterior'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: Utilidades.raisedButtonStyle,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.vRouter.to('/formulario6');
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
