import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/actividades.dart';
import 'package:micrositio_cco/src/models/aniversarios.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/carrusel_podcast.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class AniversarioDetalleScreen extends StatefulWidget {
  const AniversarioDetalleScreen({Key? key}) : super(key: key);

  @override
  State<AniversarioDetalleScreen> createState() =>
      _AniversarioDetalleScreenState();
}

class _AniversarioDetalleScreenState extends State<AniversarioDetalleScreen>
    with SingleTickerProviderStateMixin {
  late final Future? myFuture2 = generateActividades(numero);
  List<Actividades> actividades = [];
  Aniversarios aniversario = Aniversarios(id: "", numero: "", descripcion: "", miniatura: "", 
  fechaInicio: "", fechaTermino: "", nombre: "", cabecera: "", texto: "", encabezado: "");

  late Response response;
  var dio = Dio();
  String numero = "";

  Future getData(numero) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getAniversario',
          'numero' : numero
        });
    myFuture2;
    aniversario = Aniversarios.fromJson(response.data);

    return aniversario;
  }

  Future generateActividades(numero) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getActividades',
          'numero' : numero
        });
    final result = response.data;
    Iterable list = result['actividades'];

    var ima =
        list.map<Actividades>((json) => Actividades.fromJson(json)).toList();
    setState(() {
      actividades = ima;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      numero = context.vRouter.pathParameters['id'].toString();
    });

    late final Future? myFuture = getData(numero);
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;
    double _width2 = size.width / 1.3;
    double _width3 = size.width / 3;
    bool responsive = false;

    if (size.width <= 844) {
      setState(() {
        Utilidades.anchoCarruselAniversario = size.width;
        Utilidades.anchoTextdetalleActi = (size.width - (_width * 2)) * 1.2;
        Utilidades.anchoTituloActuales = _width2;
        Utilidades.responsive = true;
        responsive = true;
      });
    } else {
      setState(() {
        Utilidades.anchoCarruselAniversario = size.width;
        Utilidades.anchoTextdetalleActi = _width3;
        Utilidades.anchoTituloActuales = _width2;
        Utilidades.responsive = false;
        responsive = false;
      });
    }

    List<String> splits = aniversario.texto.split('/n');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/home/4/0/0"),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ImageNetwork(
                                imagen: aniversario.cabecera,
                                widthImage: size.width / 3),
                          ),
                          ExpansionTile(
                            textColor: Colors.black,
                            collapsedTextColor: Colors.black,
                            iconColor: Colors.black,
                            collapsedIconColor: Colors.black,
                            title: Text(
                              Utilidades.encAniversario,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelBold,
                                  fontSize: Utilidades.sizeTitle3),
                            ),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ...splits.map(buildSingleText).toList(),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "PROGRAMACIÓN DE ACTIVIDADES",
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.sizeTitle3),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ...actividades.map(buildSingleColumn).toList()
                        ],
                      ),
                    ),
                    const CustomFooter()
                  ],
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

  Widget buildSingleText(String text) => buildText(text: text);

  Widget buildText({required String text}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: Utilidades.anchoTituloActuales,
          child: Text(
            text,
            style: TextStyle(
              height: 1.5,
              fontFamily: Utilidades.fontHelRegular,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      );

  Widget buildSingleColumn(Actividades actividades) =>
      buildColumn(actividades: actividades);

  Widget buildColumn({required Actividades actividades}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utilidades.responsive == false
              ? Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                width: 200,
                                child: Text(
                                  actividades.fecha,
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelBold),
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                  width: 200,
                                  child: Text(actividades.hora,
                                      style: TextStyle(
                                          fontFamily:
                                              Utilidades.fontHelMedium))),
                            ),
                            SizedBox(
                                width: 200,
                                child: Text(actividades.lugar,
                                    style: TextStyle(
                                        fontFamily: Utilidades.fontHelMedium)))
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: Utilidades.anchoTextdetalleActi,
                                child: Text(
                                  actividades.tipo,
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelBold),
                                )),
                            SizedBox(
                                width: Utilidades.anchoTextdetalleActi,
                                child: Text(actividades.descripcionTipo,
                                    style: TextStyle(
                                        fontFamily:
                                            Utilidades.fontHelRegular))),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                                width: Utilidades.anchoTextdetalleActi,
                                child: Text("Participantes: ",
                                    style: TextStyle(
                                        fontFamily: Utilidades.fontHelBold))),
                            SizedBox(
                                width: Utilidades.anchoTextdetalleActi,
                                child: Text(actividades.participantes,
                                    style: TextStyle(
                                        fontFamily: Utilidades.fontHelRegular)))
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (actividades.linkVideo == ".") {
                                    AchievementView(
                                      context,
                                      title: "Aviso",
                                      subTitle:
                                          "Esta actividad no cuenta con contenido audiovisual.",
                                      icon: const Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                      color: Colors.blue,
                                      textStyleTitle:
                                          const TextStyle(color: Colors.white),
                                      textStyleSubTitle:
                                          const TextStyle(color: Colors.white),
                                      alignment: Alignment.centerRight,
                                      duration: const Duration(seconds: 5),
                                      isCircle: true,
                                    ).show();
                                  } else {
                                    GlobalFunctions.launchURL(
                                        actividades.linkVideo);
                                  }
                                },
                                icon: const Icon(Icons.visibility)),
                            Text(
                              "Ver video",
                              style:
                                  TextStyle(fontFamily: Utilidades.fontHelBold),
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Utilidades.idCarruselAniversario =
                              actividades.idImagenes;
                        });
                        _showCarrusel(
                            context,
                            Utilidades.anchoCarruselAniversario,
                            Utilidades.idCarruselAniversario);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                "+  Ver fotos",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelMedium,
                                    fontSize: Utilidades.sizeTitle4,
                                    color: Utilidades.rosa),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 200,
                        child: Text(
                          actividades.fecha,
                          style: TextStyle(fontFamily: Utilidades.fontHelBold),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                          width: 200,
                          child: Text(actividades.hora,
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium))),
                    ),
                    SizedBox(
                        width: 200,
                        child: Text(actividades.lugar,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelMedium))),
                    SizedBox(
                        width: Utilidades.anchoTextdetalleActi,
                        child: Text(
                          actividades.tipo,
                          style: TextStyle(fontFamily: Utilidades.fontHelBold),
                        )),
                    SizedBox(
                        width: Utilidades.anchoTextdetalleActi,
                        child: Text(actividades.descripcionTipo,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelRegular))),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: Utilidades.anchoTextdetalleActi,
                        child: Text("Participantes: ",
                            style:
                                TextStyle(fontFamily: Utilidades.fontHelBold))),
                    SizedBox(
                        width: Utilidades.anchoTextdetalleActi,
                        child: Text(actividades.participantes,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelRegular))),
                    IconButton(
                        onPressed: () {
                          if (actividades.linkVideo == ".") {
                            AchievementView(
                              context,
                              title: "Aviso",
                              subTitle:
                                  "Esta actividad no cuenta con contenido audiovisual.",
                              icon: const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              color: Colors.blue,
                              textStyleTitle:
                                  const TextStyle(color: Colors.white),
                              textStyleSubTitle:
                                  const TextStyle(color: Colors.white),
                              alignment: Alignment.centerRight,
                              duration: const Duration(seconds: 5),
                              isCircle: true,
                            ).show();
                          } else {}
                        },
                        icon: const Icon(Icons.visibility)),
                    Text(
                      "Ver video",
                      style: TextStyle(fontFamily: Utilidades.fontHelBold),
                    ),
                    InkWell(
                      onTap: () {
                        _showCarrusel(
                            context,
                            Utilidades.anchoCarruselAniversario,
                            actividades.idImagenes);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                "+  Ver fotos",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelMedium,
                                    fontSize: Utilidades.sizeTitle4,
                                    color: Utilidades.rosa),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    )
                  ],
                )
        ],
      );

  _showCarrusel(BuildContext context, anchoInterior, carrusel) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
                width: 1100, height: 600, child: CarouselPodcast(carrusel)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Center(
                  child: OutlinedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide.none),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Text(
                        "Cerrar",
                        style: TextStyle(color: Utilidades.rosa),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: true);
  }
}
