import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/models/talleres.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';

class AdminListasScreen extends StatefulWidget {
  const AdminListasScreen({Key? key}) : super(key: key);

  @override
  State<AdminListasScreen> createState() => _AdminListasScreenState();
}

class _AdminListasScreenState extends State<AdminListasScreen> {
  late Response response;
  var dio = Dio();

  List<Talleres> _talleres = [];

  Future generateListTalleres() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getTalleres"});
    final result = response.data;
    Iterable list = result['talleres'];
    _talleres = list.map<Talleres>((json) => Talleres.fromJson(json)).toList();
    return _talleres;
  }

  final _diaInicio = TextEditingController();
  final _diaFinal = TextEditingController();
  String dropdownvalue = 'Seleccionar';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateListTalleres(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 130),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: [
                          const Text(
                            "Selecciona el mes :",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                Utilidades.mesAdmin = newValue;
                              });
                            },
                            items: <String>[
                              'Seleccionar',
                              'ENERO',
                              'FEBRERO',
                              'MARZO',
                              'ABRIL',
                              'MAYO',
                              'JUNIO',
                              'JULIO',
                              'AGOSTO',
                              'SEPTIEMBRE',
                              'OCTUBRE',
                              'NOVIEMBRE',
                              'DICIEMBRE',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              const Text("Día de inicio : "),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"))
                                    ],
                                    controller: _diaInicio,
                                    onChanged: (value) {
                                      setState(() {
                                        Utilidades.diaInicioAdmin = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff9D2449)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Utilidades.radiusForm))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  237, 158, 158, 158)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Utilidades.radiusForm))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    const Text("Día de cierre : "),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[0-9]"))
                                          ],
                                          controller: _diaFinal,
                                          onChanged: (value) {
                                            setState(() {
                                              Utilidades.diaFinAdmin = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff9D2449)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(Utilidades
                                                        .radiusForm))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        237, 158, 158, 158)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(Utilidades
                                                        .radiusForm))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ..._talleres.map(buildSingleTextHorizontal).toList(),
                  ],
                )
              : Center(
                  child: Image.asset(
                    "assets/logos/Logo_cco_2a.gif",
                    height: 100,
                  ),
                );
        });
  }

  Widget buildSingleTextHorizontal(Talleres talleres) =>
      buildTextHorizontal(talleres: talleres);

  Widget buildTextHorizontal({required Talleres talleres}) => Column(
        children: [
          Column(
            children: [
              Card(
                elevation: 1,
                child: ListTile(
                  leading: const Icon(
                    Icons.description,
                    size: 45,
                  ),
                  title: Text("Clave: " + talleres.clave),
                  subtitle: Text(talleres.nombre,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: Utilidades.fontHelMedium)),
                  trailing: InkWell(
                      onTap: () {
                        if (Utilidades.mesAdmin == "" ||
                            Utilidades.diaInicioAdmin == "" ||
                            Utilidades.diaFinAdmin == "") {
                          AchievementView(
                            context,
                            title: "Datos insuficientes",
                            subTitle: "Ingresa todos los datos necesarios.",
                            icon: const Icon(
                              Icons.warning_amber,
                              color: Colors.white,
                            ),
                            color: Colors.amber,
                            textStyleTitle:
                                const TextStyle(color: Colors.white),
                            textStyleSubTitle:
                                const TextStyle(color: Colors.white),
                            alignment: Alignment.centerRight,
                            duration: const Duration(seconds: 5),
                            isCircle: true,
                          ).show();
                        } else {
                          GlobalFunctions.launchURLPost(
                              talleres.clave,
                              Utilidades.diaInicioAdmin,
                              Utilidades.diaFinAdmin,
                              Utilidades.mesAdmin);
                        }
                      },
                      child: Tooltip(
                        message: "Generar y descargar lista.",
                        child: Icon(
                          Icons.download_for_offline,
                          color: Utilidades.rosa,
                          size: 45,
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      );
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
