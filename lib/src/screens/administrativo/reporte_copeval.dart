import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/responsive.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';

class ReporteCopevalScreen extends StatefulWidget {
  const ReporteCopevalScreen({Key? key}) : super(key: key);

  @override
  State<ReporteCopevalScreen> createState() => _ReporteCopevalScreenState();
}

class _ReporteCopevalScreenState extends State<ReporteCopevalScreen> {
  final _fechaAlta = TextEditingController();
  final _mesBeneficio = TextEditingController();
  final _periodoBeneficio = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
                child: Text(
              "GENERAR REPORTE DE COPEVAL",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("FECHA DE ALTA : "),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      controller: _fechaAlta,
                      onChanged: (value) {
                        setState(() {
                          Utilidades.fechaAlta = value;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff9D2449)),
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
                ),
                Expanded(child: Container()),
                const Text("MES DE BENEFICIO : "),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      controller: _mesBeneficio,
                      onChanged: (value) {
                        setState(() {
                          Utilidades.mesBeneficio = value;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff9D2449)),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25, left: 25),
                  child: Row(
                    children: [
                      const Text("PERIODO DE BENEFICIO : "),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9_]"))
                            ],
                            controller: _periodoBeneficio,
                            onChanged: (value) {
                              setState(() {
                                Utilidades.peridoBeneficio = value;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff9D2449)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Utilidades.radiusForm))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(237, 158, 158, 158)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Utilidades.radiusForm))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: responsive.width / 2.5,
                child: OutlinedButton(
                    style: Utilidades.buttonGenerate,
                    onPressed: () {
                      if (Utilidades.fechaAlta == "" ||
                          Utilidades.mesBeneficio == "" ||
                          Utilidades.peridoBeneficio == "") {
                        AchievementView(
                          context,
                          title: "Datos insuficientes",
                          subTitle: "Ingresa todos los datos necesarios.",
                          icon: const Icon(
                            Icons.warning_amber,
                            color: Colors.white,
                          ),
                          color: Colors.amber,
                          textStyleTitle: const TextStyle(color: Colors.white),
                          textStyleSubTitle:
                              const TextStyle(color: Colors.white),
                          alignment: Alignment.centerRight,
                          duration: const Duration(seconds: 5),
                          isCircle: true,
                        ).show();
                      } else {
                        GlobalFunctions.launchURLCopeval(
                            Utilidades.fechaAlta,
                            Utilidades.mesBeneficio,
                            Utilidades.peridoBeneficio);
                      }
                    },
                    child: const Text("PUB - COPEVAL")),
              ),
              Expanded(child: Container()),
              SizedBox(
                width: responsive.width / 2.5,
                child: OutlinedButton(
                    style: Utilidades.buttonGenerate,
                    onPressed: () {
                      GlobalFunctions.launchURLRegistrosAll();
                    },
                    child: const Text("REGISTROS")),
              ),
            ],
          ),
        ]);
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
