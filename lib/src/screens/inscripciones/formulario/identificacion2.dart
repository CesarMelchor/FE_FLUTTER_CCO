import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/firebase_config.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:vrouter/vrouter.dart';

class IdentificacionPage2 extends StatefulWidget {
  const IdentificacionPage2({Key? key}) : super(key: key);

  @override
  State<IdentificacionPage2> createState() => _IdentificacionPage2State();
}

class _IdentificacionPage2State extends State<IdentificacionPage2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _curp = TextEditingController(text: Utilidades.curp);
  bool processing = false;
//  final Future<FirebaseApp> _initialization = Firebase.initializeApp('micrositio', DefaultFirebaseConfig.platformOptions);
  // ignore: prefer_typing_uninitialized_variables
  late final file;
  late FirebaseApp app;
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyDe3FMpiSlydNfKo6o8Nm08mC0wFi_b6ew',
        projectId: 'ioa-documents',
        messagingSenderId: '448618578101',
      );

  Future<void> initializeDefault() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions,
    );
    // ignore: avoid_print
    print('Initialized default app $app');
  }

  Future<void> initializeSecondary() async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'micrositio', options: firebaseOptions);

    // ignore: avoid_print
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    // ignore: avoid_print
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app('micrositio');
    final options = app.options;
    // ignore: avoid_print
    print('Current options for app : $options');
  }

  Future<void> delete(name) async {
    final FirebaseApp app = Firebase.app(name);
    await app.delete();
    // ignore: avoid_print
    print('App  deleted');
  }

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
              Navigator.pushReplacementNamed(context, "/formulario1");
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
              "Entidad federativa donde nació el (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomSearchableDropDown(
                items: Utilidades.entidades,
                label: 'Seleccionar',
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                dropDownMenuItems: Utilidades.entidades.map((item) {
                  return item;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    Utilidades.entidadFederativa = value;
                  } else {
                    Utilidades.entidadFederativa = "";
                  }
                },
              ),
            ),
            Text(
              "Capture los 18 dígitos de la CURP del (la) alumno(a):",
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
                maxLength: 18,
                controller: _curp,
                onChanged: (value) {
                  Utilidades.curp = value;
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
              "CURP en formato PDF del (la) alumno(a). ",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: InkWell(
                onTap: () {
                  GlobalFunctions.launchURL("https://www.gob.mx/curp/");
                },
                child: Text(
                  "Puede descargarla aquí.",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.fontSizeTitle2,
                      color: Utilidades.rosa),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: Utilidades.raisedButtonStyle2,
                          onPressed: () async {
                            initializeDefault();
                            final result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);
                            
                            if (result == null) return;

                            final file = result.files.first;
                            final fileBytes = result.files.first.bytes;
                            String fileName = file.name;
                            if (fileName.contains(".pdf")) {
                              setState(() {
                                processing = true;
                              });
                              await FirebaseStorage.instance
                                  .ref('files/$fileName')
                                  .putData(fileBytes!);
                              String namePath = await FirebaseStorage.instance
                                  .ref('files/$fileName')
                                  .getDownloadURL();
                              
                              setState(() {
                                Utilidades.nameFile = namePath;
                                Utilidades.file = file.name;
                              });

                              delete('[DEFAULT]');
                              apps();
                              setState(() {
                                processing = false;
                              });
                            } else {
                              AchievementView(
                                context,
                                title: "Aviso",
                                subTitle:
                                    "El formato de tu CURP debe estar en PDF.",
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
                          },
                          child: const Text(
                            "Seleccionar archivo",
                          )),
                      Text(
                        Utilidades.file,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            color: const Color(0xff9D2449)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Estado civil del (la) alumno(a):",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Soltero",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form2check1,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.estadoCivil = "Soltero";
                          Utilidades.form2check1 = true;
                          Utilidades.form2check2 = false;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Casado",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RoundCheckBox(
                      isChecked: Utilidades.form2check2,
                      onTap: (selected) {
                        setState(() {
                          Utilidades.estadoCivil = "Casado";
                          Utilidades.form2check2 = true;
                          Utilidades.form2check1 = false;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Utilidades.raisedButtonStyle,
                  onPressed: () {
                    context.vRouter.to('/formulario1');
                  },
                  child: const Text('Anterior'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: processing == false
                      ? ElevatedButton(
                          style: Utilidades.raisedButtonStyle,
                          onPressed: () {
                            if (Utilidades.form2check1 == false &&
                                Utilidades.form2check2 == false) {
                              AchievementView(
                                context,
                                title: "Advertencia",
                                subTitle:
                                    "Por favor, seleccione su estado civil antes de continuar.",
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
                            } else if (Utilidades.nameFile == '') {
                              AchievementView(
                                context,
                                title: "Aviso",
                                subTitle:
                                    "Por favor, seleccione su CURP en formato PDF antes de continuar.",
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
                            } else if (Utilidades.entidades == "" ||
                                Utilidades.entidades == "Seleccionar") {
                              AchievementView(
                                context,
                                title: "Aviso",
                                subTitle: "Entidad no válida.",
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
                            } else {
                              if (formKey.currentState!.validate()) {
                                context.vRouter.to('/formulario3');
                              }
                            }
                          },
                          child: const Text('Siguiente'),
                        )
                      : const CircularProgressIndicator(
                          color: Color(0xff9D2449),
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
