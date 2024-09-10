import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/jefe.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:achievement_view/achievement_view.dart';

class AsignJefeScreen extends StatefulWidget {
  const AsignJefeScreen({Key? key}) : super(key: key);

  @override
  State<AsignJefeScreen> createState() => _AsignJefeScreenState();
}

class _AsignJefeScreenState extends State<AsignJefeScreen> {
  late final Future? myFuture = getListJefes();
  late Response response;
  var dio = Dio();
  List<Jefe> jefes = [];
  TextEditingController jefe = TextEditingController();
  String culturaA = "";
  String artesA = "";
  String danzaA = "";
  String musicaA = "";
  String teatroA = "";
  String alternativoA = "";

  Future getListJefes() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getJefes"});
    final result = response.data;
    Iterable list = result['jefes'];

    jefes = list.map<Jefe>((json) => Jefe.fromJson(json)).toList();

    return jefes;
  }

  Future asignJefe(jefeID, campo) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {
          "consulta": "asignJefe",
          "jefe": jefeID,
          "campo": campo
        });
    final result = response.data;
    if (result == 'OK') {
      AchievementView(
        context,
        title: "Jefe de equipo asignado correctamente.",
        subTitle: '',
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
    } else {
      AchievementView(
        context,
        title: "Ocurrió un error, inténtalo más tarde.",
        subTitle: '',
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

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 11),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ASIGNACIÓN DE CAMPOS ARTÍSTICOS",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "CULTURA INFANTIL: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                  culturaA = value as String;
                                  });
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  asignJefe(culturaA, 'CULTURA INFANTIL');
                                },
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "ARTES PLÁSTICAS: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  artesA = value as String;
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  
                                  asignJefe(artesA, 'ARTES PLÁSTICAS');
                                },
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "DANZA: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  danzaA = value as String;
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  
                                  asignJefe(danzaA, 'DANZA');
                                },
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "MÚSICA: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  musicaA = value as String;
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  asignJefe(musicaA, 'MÚSICA');},
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "TEATRO: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  teatroA = value as String;
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  asignJefe(teatroA, 'TEATRO');},
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              "ALTERNATIVOS: ",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3 + 4),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              width: size.width / 3,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: "Asignar jefe de equipo...",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                                focusColor: Colors.transparent,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                isExpanded: true,
                                onChanged: (value) {
                                  alternativoA = value as String;
                                },
                                items: jefes.map((jefe) {
                                  return DropdownMenuItem(
                                    child: Text(jefe.nombre),
                                    value: jefe.id,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  asignJefe(alternativoA, 'ALTERNATIVOS');},
                                style: OutlinedButton.styleFrom(
                                    minimumSize:
                                        Size(size.width / 8, size.height / 12),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Utilidades.rosa,
                                    padding: const EdgeInsets.all(25)),
                                child: Text(
                                  "Asignar",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelMedium,
                                      fontSize: Utilidades.sizeTitle3),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Image.asset(
                    "assets/logos/Logo_cco_2a.gif",
                    height: 100,
                  ),
                );
        },
      ),
    );
  }
}
