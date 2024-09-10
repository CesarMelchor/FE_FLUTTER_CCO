import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/jefe.dart';
import 'package:micrositio_cco/src/models/talleres.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:cooky/cooky.dart' as cookie;

class AsignUsuarioScreen extends StatefulWidget {
  const AsignUsuarioScreen({Key? key}) : super(key: key);

  @override
  State<AsignUsuarioScreen> createState() => _AsignUsuarioScreenState();
}

class _AsignUsuarioScreenState extends State<AsignUsuarioScreen> {
  late final Future? myFutureClaves =
      getListClaves(cookie.get('idControl').toString());
  late final Future? myFutureUsers = getListUsuarios();

  late Response response;
  var dio = Dio();
  List<Jefe> usuarios = [];
  List<Talleres> claves = [];

  TextEditingController jefe = TextEditingController();
  String usuario = "";

  Future getListUsuarios() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getUsuarios"});
    final result = response.data;
    Iterable list = result['usuarios'];

    var usuario = list.map<Jefe>((json) => Jefe.fromJson(json)).toList();
    setState(() {
      usuarios = usuario;
    });
  }

  Future getListClaves(jefeC) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {"consulta": "getClavesJefe", "jefe": jefeC});
    final result = response.data;
    Iterable list = result['talleres'];
    myFutureUsers;

    claves = list.map<Talleres>((json) => Talleres.fromJson(json)).toList();

    return claves;
  }

  Future asignUsuario(usuarioID, clave) async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: {
          "consulta": "asignUsuario",
          "usuario": usuarioID,
          "clave": clave
        });
    final result = response.data;
    if (result == 'OK') {
      AchievementView(
        context,
        title: "Usuario de apoyo asignado correctamente.",
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
    setState(() {});
    if (size.width < 600) {
      setState(() {
        Utilidades.width = size.width;
      });
    } else {
      Utilidades.width = size.width;
    }
    return Scaffold(
      body: FutureBuilder(
        future: myFutureClaves,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 11),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ASIGNACIÓN DE TALLERES",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ...claves.map(buildSingleTextHorizontal).toList(),
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

  Widget buildSingleTextHorizontal(Talleres taller) =>
      buildTextHorizontal(taller: taller);

  Widget buildTextHorizontal({required Talleres taller}) => Column(
        children: [
          SizedBox(
            width: Utilidades.width,
            child: Row(
              children: [
                SizedBox(
                  width: Utilidades.width / 2.5,
                  child: Text(
                    taller.clave + " : " + taller.nombre,
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.sizeTitle3),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: Utilidades.width / 3.5,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Asignar usuario de apoyo...",
                        focusedBorder: Utilidades.form1,
                        enabledBorder: Utilidades.form1_1),
                    focusColor: Colors.transparent,
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        usuario = value as String;
                      });
                    },
                    items: usuarios.map((jefe) {
                      return DropdownMenuItem(
                        child: Text(jefe.nombre),
                        value: jefe.id,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: Utilidades.width / 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      asignUsuario(usuario, taller.clave);
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Utilidades.width / 8, Utilidades.width / 22),
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
          const Divider(
            thickness: 3,
          )
        ],
      );
}
