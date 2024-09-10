import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/models/periodos.dart';
import 'package:micrositio_cco/src/utils/responsive.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:dio/dio.dart';

class PeriodoScreen extends StatefulWidget {
  const PeriodoScreen({Key? key}) : super(key: key);

  @override
  State<PeriodoScreen> createState() => _PeriodoScreenState();
}

class _PeriodoScreenState extends State<PeriodoScreen> {
  late Response response;
  var dio = Dio();
  TextEditingController meses = TextEditingController();
  String mesActivo = "Enero";
  TextEditingController diaInicio = TextEditingController();
  TextEditingController diaFinal = TextEditingController();
  TextEditingController horaInicio = TextEditingController();
  TextEditingController horaFinal = TextEditingController();

  TextEditingController meses2 = TextEditingController();
  String mesActivo2 = "Enero";
  TextEditingController diaInicio2 = TextEditingController();
  TextEditingController diaFinal2 = TextEditingController();
  TextEditingController horaInicio2 = TextEditingController();
  TextEditingController horaFinal2 = TextEditingController();
  String id = "";

  final List<String> mes = <String>[
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  Future _createPeriod(
      rango, mesValido, diaInici, diaFina, horaInici, horaFina) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {
          "consulta": "createPeriod",
          "rango": rango,
          "mesInicio": mesValido,
          "diaInicio": diaInici,
          "diaFinal": diaFina,
          "horaInicio": horaInici,
          "horaFinal": horaFina
        });
    final result = response.data;
    if (result == "OK") {
      AchievementView(
        context,
        title: "Cuatrimestre creado",
        subTitle: "El cuatrimestre se creó correctamente.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
      getPeriodos();

      setState(() {
        meses.text = '';
        mesActivo = 'Enero';
        diaInicio.text = '';
        diaFinal.text = '';
        horaInicio.text = '';
        horaFinal.text = '';
      });
    } else {
      AchievementView(
        context,
        title: "Error al añadir",
        subTitle: "Vuelve a intentarlo más tarde.",
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
    }
  }

  Future _editPeriod(
      rango, mesInicio, diaInicio, diaFinal, horaInicio, horaFinal, id) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {
          "consulta": "editPeriod",
          "rango": rango,
          "mesInicio": mesInicio,
          "diaInicio": diaInicio,
          "diaFinal": diaFinal,
          "horaInicio": horaInicio,
          "horaFinal": horaFinal,
          "id": id
        });
    final result = response.data;
    if (result == "OK") {
      AchievementView(
        context,
        title: "Datos actualizados",
        subTitle: "La información ha sido modificada.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();

      getPeriodos();

      setState(() {
        meses2.text = '';
        mesActivo2 = 'Enero';
        diaInicio2.text = '';
        diaFinal2.text = '';
        horaInicio2.text = '';
        horaFinal2.text = '';
      });
    } else {
      AchievementView(
        context,
        title: "Error al actualizar",
        subTitle: "Vuelve a intentarlo más tarde.",
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
    }
  }

  Future _activatePeriod(id) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "activatePeriod", "id": id});
    final result = response.data;

    if (result == "OK") {
      AchievementView(
        context,
        title: "Activo",
        subTitle: "El cuatrimestre fue activado exitosamente.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();

      getPeriodos();
    } else {
      AchievementView(
        context,
        title: "Error al actualizar",
        subTitle: "Vuelve a intentarlo más tarde.",
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
    }
  }

  Future _deletePeriod(id) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "deletePeriod", "id": id});
    final result = response.data;

    if (result == "OK") {
      AchievementView(
        context,
        title: "Activo",
        subTitle: "El cuatrimestre ha sido eliminado.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();

      getPeriodos();
    } else {
      AchievementView(
        context,
        title: "Error al eliminar",
        subTitle: "Vuelve a intentarlo más tarde.",
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
    }
  }

  List<Periodos> periodos = [];
  late final getPeriods = getPeriodos();

  Future getPeriodos() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getPeriodos"});
    final result = response.data;
    Iterable list = result['periodos'];
    periodos = list.map<Periodos>((json) => Periodos.fromJson(json)).toList();
    setState(() {
      periodos = periodos;
    });
    return periodos;
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double mitad = responsive.width / 2.2;
    if (responsive.width < 700) {
      setState(() {
        Utilidades.width = responsive.width;
      });
    } else {
      setState(() {
        Utilidades.width = responsive.width;
      });
    }
    return FutureBuilder(
      future: getPeriods,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: responsive.height * 1.8,
                        width: responsive.width / 2.2,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "AÑADIR PERIODO",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.sizeTitle3),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: (mitad / 4) * 2.2,
                                  child: TextFormField(
                                    controller: meses,
                                    decoration: InputDecoration(
                                        labelText: "Meses : ",
                                        focusedBorder: Utilidades.form1,
                                        enabledBorder: Utilidades.form1_1),
                                  ),
                                ),
                                Expanded(child: Container()),
                                SizedBox(
                                  width: mitad / 4,
                                  child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                          labelText: "Mes activo : ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                      value: mesActivo,
                                      autofocus: true,
                                      focusColor: Colors.transparent,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp),
                                      isExpanded: true,
                                      onChanged: (String? value) {
                                        setState(() {
                                          mesActivo = value!;
                                        });
                                      },
                                      items: mes.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mitad / 6,
                                  child: TextFormField(
                                    controller: diaInicio,
                                    inputFormatters: [
                                      UpperCaseTextFormatter(),
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"))
                                    ],
                                    decoration: InputDecoration(
                                        labelText: "Día inicial: ",
                                        focusedBorder: Utilidades.form1,
                                        enabledBorder: Utilidades.form1_1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SizedBox(
                                    width: mitad / 6,
                                    child: TextFormField(
                                      controller: diaFinal,
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9]"))
                                      ],
                                      decoration: InputDecoration(
                                          labelText: "Dia límite: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mitad / 6,
                                  child: TextFormField(
                                    controller: horaInicio,
                                    inputFormatters: [
                                      UpperCaseTextFormatter(),
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"))
                                    ],
                                    decoration: InputDecoration(
                                        labelText: "Hora inicial: ",
                                        focusedBorder: Utilidades.form1,
                                        enabledBorder: Utilidades.form1_1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    width: mitad / 6,
                                    child: TextFormField(
                                      controller: horaFinal,
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9]"))
                                      ],
                                      decoration: InputDecoration(
                                          labelText: "Hora límite: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(20),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (meses.text == '' ||
                                        diaInicio.text == '' ||
                                        diaFinal.text == '' ||
                                        horaInicio.text == '' ||
                                        horaFinal.text == '') {
                                      AchievementView(
                                        context,
                                        title: "Datos incompletos",
                                        subTitle: "Ingresa todos los datos.",
                                        icon: const Icon(
                                          Icons.warning_amber,
                                          color: Colors.white,
                                        ),
                                        color: Colors.amber,
                                        textStyleTitle: const TextStyle(
                                            color: Colors.white),
                                        textStyleSubTitle: const TextStyle(
                                            color: Colors.white),
                                        alignment: Alignment.centerRight,
                                        duration: const Duration(seconds: 5),
                                        isCircle: true,
                                      ).show();
                                    } else {
                                      _createPeriod(
                                          meses.text.toString(),
                                          mesActivo,
                                          int.parse(diaInicio.text.toString()),
                                          int.parse(diaFinal.text.toString()),
                                          int.parse(horaInicio.text.toString()),
                                          int.parse(horaFinal.text.toString()));
                                    }
                                  },
                                  child: Text(
                                    "AGREGAR",
                                    style: TextStyle(
                                        fontFamily: Utilidades.fontHelMedium,
                                        fontSize: Utilidades.sizeTitle4),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        height: responsive.height,
                        width: responsive.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text("ACTIVAR / EDITAR PERIODOS",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelBold,
                                    fontSize: Utilidades.sizeTitle3)),
                            SizedBox(
                              height: responsive.height / 2.3,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...periodos
                                        .map(buildSingleTextHorizontal)
                                        .toList(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: responsive.height / 3.1,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: mitad / 4,
                                        child: TextFormField(
                                          controller: meses2,
                                          decoration: InputDecoration(
                                              labelText: "Meses : ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          width: mitad / 4,
                                          child: DropdownButtonFormField<
                                                  String>(
                                              decoration: InputDecoration(
                                                  labelText: "Mes activo : ",
                                                  focusedBorder:
                                                      Utilidades.form1,
                                                  enabledBorder:
                                                      Utilidades.form1_1),
                                              value: mesActivo2,
                                              autofocus: true,
                                              focusColor: Colors.transparent,
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              isExpanded: true,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  mesActivo2 = value!;
                                                });
                                              },
                                              items: mes.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SizedBox(
                                            width: mitad / 4,
                                            child: TextFormField(
                                              controller: diaInicio2,
                                              inputFormatters: [
                                                UpperCaseTextFormatter(),
                                                FilteringTextInputFormatter
                                                    .allow(RegExp("[0-9]"))
                                              ],
                                              decoration: InputDecoration(
                                                  labelText: "Día inicial: ",
                                                  focusedBorder:
                                                      Utilidades.form1,
                                                  enabledBorder:
                                                      Utilidades.form1_1),
                                            )),
                                      ),
                                      SizedBox(
                                          width: mitad / 4,
                                          child: TextFormField(
                                            controller: diaFinal2,
                                            inputFormatters: [
                                              UpperCaseTextFormatter(),
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[0-9]"))
                                            ],
                                            decoration: InputDecoration(
                                                labelText: "Día final: ",
                                                focusedBorder: Utilidades.form1,
                                                enabledBorder:
                                                    Utilidades.form1_1),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: responsive.width / 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: mitad / 4,
                                            child: TextFormField(
                                              controller: horaInicio2,
                                              inputFormatters: [
                                                UpperCaseTextFormatter(),
                                                FilteringTextInputFormatter
                                                    .allow(RegExp("[0-9]"))
                                              ],
                                              decoration: InputDecoration(
                                                  labelText: "Hora inicial: ",
                                                  focusedBorder:
                                                      Utilidades.form1,
                                                  enabledBorder:
                                                      Utilidades.form1_1),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                              width: mitad / 4,
                                              child: TextFormField(
                                                controller: horaFinal2,
                                                inputFormatters: [
                                                  UpperCaseTextFormatter(),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp("[0-9]"))
                                                ],
                                                decoration: InputDecoration(
                                                    labelText: "Hora final: ",
                                                    focusedBorder:
                                                        Utilidades.form1,
                                                    enabledBorder:
                                                        Utilidades.form1_1),
                                              )),
                                        ),
                                        Expanded(child: Container()),
                                        OutlinedButton(
                                            onPressed: () {
                                              if (meses2.text == '' ||
                                                  diaInicio2.text == '' ||
                                                  diaFinal2.text == '' ||
                                                  horaInicio2.text == '' ||
                                                  horaFinal2.text == '') {
                                                AchievementView(
                                                  context,
                                                  title: "Datos incompletos",
                                                  subTitle:
                                                      "Ingresa todos los datos.",
                                                  icon: const Icon(
                                                    Icons.warning_amber,
                                                    color: Colors.white,
                                                  ),
                                                  color: Colors.amber,
                                                  textStyleTitle:
                                                      const TextStyle(
                                                          color: Colors.white),
                                                  textStyleSubTitle:
                                                      const TextStyle(
                                                          color: Colors.white),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  duration: const Duration(
                                                      seconds: 5),
                                                  isCircle: true,
                                                ).show();
                                              } else {
                                                _editPeriod(
                                                    meses2.text.toString(),
                                                    mesActivo2,
                                                    int.parse(diaInicio2.text
                                                        .toString()),
                                                    int.parse(diaFinal2.text
                                                        .toString()),
                                                    int.parse(horaInicio2.text
                                                        .toString()),
                                                    int.parse(horaFinal2.text
                                                        .toString()),
                                                    int.parse(id));
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Utilidades.rosa,
                                              padding: const EdgeInsets.all(20),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            child: Text(
                                              "ACTUALIZAR",
                                              style: TextStyle(
                                                  fontFamily:
                                                      Utilidades.fontHelBold,
                                                  fontSize:
                                                      Utilidades.sizeTitle4),
                                            )),
                                        SizedBox(
                                          width: mitad / 10,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Image.asset(
                  "assets/logos/Logo_cco_2a.gif",
                  height: 100,
                ),
              );
      },
    );
  }

  Widget buildSingleTextHorizontal(Periodos periodo) =>
      buildTextHorizontal(periodo: periodo);

  Widget buildTextHorizontal({required Periodos periodo}) => Column(
        children: [
          SizedBox(
            width: Utilidades.width / 2,
            child: Column(
              children: [
                Card(
                  elevation: 1,
                  child: ListTile(
                    leading: InkWell(
                      onTap: () {
                        if (periodo.activo == 'SI') {
                          AchievementView(
                            context,
                            title: "Activo",
                            subTitle:
                                "Este cuatrimestre ya se encuentra activo.",
                            icon: const Icon(
                              Icons.warning,
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
                          _activatePeriod(int.parse(periodo.id));
                        }
                      },
                      child: Tooltip(
                        message: periodo.activo == 'NO'
                            ? 'Activar periodo.'
                            : 'Desactivar periodo.',
                        child: Icon(
                          Icons.power_settings_new,
                          size: 45,
                          color: periodo.activo == 'NO'
                              ? Colors.grey
                              : Utilidades.rosa,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          "Periodo: " + periodo.numeroPeriodo,
                          style: TextStyle(fontFamily: Utilidades.fontHelBold),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          "Año: " + periodo.anio,
                          style: TextStyle(fontFamily: Utilidades.fontHelBold),
                        ),
                      ],
                    ),
                    subtitle: SizedBox(
                      width: Utilidades.width / 2.2,
                      child: Row(
                        children: [
                          Text("Meses: " + periodo.meses,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: Utilidades.fontHelMedium)),
                          Expanded(child: Container()),
                          Tooltip(
                              message: "Eliminar periodo.",
                              child: InkWell(
                                  onTap: () {
                                    _buildAlertDialogConfirm(
                                        context, int.parse(periodo.id));
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Utilidades.rosa,
                                    size: 30,
                                  ))),
                          SizedBox(
                            width: Utilidades.width / 13,
                          ),
                        ],
                      ),
                    ),
                    trailing: Tooltip(
                      message: "Editar.",
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            meses2.text = periodo.meses;
                            mesActivo2 = periodo.mes;
                            diaInicio2.text = periodo.diaInicio;
                            diaFinal2.text = periodo.diaFinal;
                            horaInicio2.text = periodo.horaInicio;
                            horaFinal2.text = periodo.horaFinal;
                            id = periodo.id;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Utilidades.rosa,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  _buildAlertDialogConfirm(BuildContext context, idP) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 70),
            child: AlertDialog(
              title:
                  const Text("¿Estás seguro que deseas eliminar este periodo?"),
              actions: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: const Text("Aceptar"),
                        onPressed: () {
                          _deletePeriod(idP);
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        child: const Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
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
