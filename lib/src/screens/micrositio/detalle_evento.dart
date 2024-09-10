import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/eventos.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class DetalleEventoScreen extends StatefulWidget {
  const DetalleEventoScreen({Key? key}) : super(key: key);

  @override
  State<DetalleEventoScreen> createState() => _DetalleEventoScreenState();
}

class _DetalleEventoScreenState extends State<DetalleEventoScreen> {
  late final Future? myFuture2 = generateImages();
  Eventos evento = Eventos(
      id: "",
      tipoEvento: "",
      fechaInicio: "",
      horaInicio: "",
      fechaTermino: "",
      lugar: "",
      titulo: "",
      presentador: "",
      resennia: "",
      semblanza: "",
      textoSala: "",
      portada: "",
      idImagenes: "",
      mapa: "");
  List<Imagenes> imagenes = [];

  late Response response;
  var dio = Dio();
  bool vac = false;
  String id = "";
  String idIm = "";

  Future generateEvento() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {'consulta': 'getEvento', 'id': id});
    evento = Eventos.fromJson(response.data);
    setState(() {
      idIm = evento.idImagenes;
    });

    myFuture2;

    return evento;
  }

  Future generateImages() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {'consulta': 'getImagesbyId', 'id': idIm});
    final result = response.data;
    Iterable list = result['imagenes'];

    var ima = list.map<Imagenes>((json) => Imagenes.fromJson(json)).toList();
    setState(() {
      if (ima.isEmpty) {
        vac = true;
      } else {
        vac = false;
      }
      imagenes = ima;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      id = context.vRouter.pathParameters['id'].toString();
    });
    late final Future? myFuture = generateEvento();

    Size size = MediaQuery.of(context).size;
    double ancho = size.width / 10;
    double tercia = (size.width - (ancho * 2)) / 3.4;

    bool responsive = false;

    double _width = size.width / 6.3;
    if (size.width <= 844) {
      setState(() {
        responsive = true;
        Utilidades.anchoEvento = size.width / 1.7;
      });
    } else {
      setState(() {
        responsive = false;
        Utilidades.anchoEvento = tercia;
      });
    }

    late List<String> splits = evento.semblanza.split('/n');

    final List<Widget> imageSliders = imagenes
        .map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  _showImage(context, item.pathimagen, size.width);
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.black,
                          width: responsive == false
                              ? tercia * 1.2
                              : size.width - (ancho * 2),
                          child: ImageNetwork(
                            imagen: item.pathimagen,
                            widthImage: responsive == false
                                ? tercia * 1.2
                                : size.width - (ancho * 2),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == false
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: AppBar(
            leading: InkWell(
                onTap: () {
                  context.vRouter.to('/home/3/0/0');
                },
                child: const Icon(Icons.arrow_back)),
            iconTheme: const IconThemeData(color: Color(0xff9D2449)),
            backgroundColor: const Color(0xfff6f1f6),
            title: Padding(
              padding: EdgeInsets.only(right: _width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  responsive == false
                      ? Text("Micrositio de la Casa de la Cultura Oaxaqueña",
                          style: TextStyle(
                            color: const Color(0xff666666),
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle4,
                          ))
                      : Container(
                          width: 1,
                        ),
                  responsive == false
                      ? Expanded(child: Container())
                      : Container(
                          width: 25,
                        ),
                  const Image(
                    width: 15,
                    image: Svg('assets/svg/telefono.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5),
                    child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlPhone);
                      },
                      child: Text("951 516 11 54",
                          style: TextStyle(
                            color: const Color(0xff666666),
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle4,
                          )),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlMail);
                      },
                      child: const Image(
                        width: 25,
                        image: Svg('assets/svg/mail.svg'),
                      )),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Síguenos",
                        style: TextStyle(
                          color: const Color(0xff666666),
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle4,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                        onTap: () {
                          GlobalFunctions.launchURL(Utilidades.urlFacebook);
                        },
                        child: const Image(
                          width: 20,
                          image: Svg('assets/svg/facebook.svg'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: InkWell(
                        onTap: () {
                          GlobalFunctions.launchURL(Utilidades.urlInstagram);
                        },
                        child: const Image(
                          width: 20,
                          image: Svg('assets/svg/instagram.svg'),
                        )),
                  ),
                  InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlTwitter);
                      },
                      child: const Image(
                        width: 20,
                        image: Svg('assets/svg/twitter.svg'),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                        onTap: () {
                          GlobalFunctions.launchURL(Utilidades.urlYoutube);
                        },
                        child: const Image(
                          width: 20,
                          image: Svg('assets/svg/youtube.svg'),
                        )),
                  ),
                ],
              ),
            )),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView(
                  controller: ScrollController(),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20, left: ancho, right: ancho),
                      child: responsive == false
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  SizedBox(
                                    width: tercia * 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: tercia * 2,
                                            child: Text(
                                              evento.tipoEvento,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle3_A,
                                                  color: Utilidades.rosa,
                                                  fontFamily:
                                                      Utilidades.fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: tercia * 2,
                                            child: Text(
                                              evento.titulo,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle2,
                                                  fontFamily:
                                                      Utilidades.fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                            width: tercia * 2,
                                            child: Text(
                                              evento.presentador,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle4,
                                                  fontFamily:
                                                      Utilidades.fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: tercia,
                                            child: Text(
                                              evento.fechaInicio +
                                                  " | " +
                                                  evento.horaInicio,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle4,
                                                  fontFamily:
                                                      Utilidades.fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: tercia * 2,
                                            child: InkWell(
                                              onTap: () {
                                                GlobalFunctions.launchURL(
                                                    evento.mapa);
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.place,
                                                    size: 15,
                                                    color: Utilidades.rosa,
                                                  ),
                                                  Text(
                                                    "Lugar : " + evento.lugar,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: Utilidades
                                                            .sizeTitle4,
                                                        fontFamily: Utilidades
                                                            .fontHelMedium),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ...splits.map(buildSingleText).toList(),
                                        const SizedBox(
                                          height: 200,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  vac == false
                                      ? Column(
                                          children: [
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            ...imageSliders,
                                          ],
                                        )
                                      : Container()
                                ])
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    width: size.width - (ancho * 2),
                                    child: Text(
                                      evento.tipoEvento,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: Utilidades.sizeTitle3_A,
                                          color: Utilidades.rosa,
                                          fontFamily: Utilidades.fontHelMedium),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    width: size.width - (ancho * 2),
                                    child: Text(
                                      evento.titulo,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: Utilidades.sizeTitle2,
                                          fontFamily: Utilidades.fontHelMedium),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    width: size.width - (ancho * 2),
                                    child: Text(
                                      evento.presentador,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: Utilidades.sizeTitle4,
                                          fontFamily: Utilidades.fontHelMedium),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    width: size.width - (ancho * 2),
                                    child: Text(
                                      evento.fechaInicio +
                                          " | " +
                                          evento.horaInicio,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: Utilidades.sizeTitle4,
                                          fontFamily: Utilidades.fontHelMedium),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    width: size.width - (ancho * 2),
                                    child: InkWell(
                                      onTap: () {
                                        GlobalFunctions.launchURL(evento.mapa);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            size: 15,
                                            color: Utilidades.rosa,
                                          ),
                                          Text(
                                            "Lugar : " + evento.lugar,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: Utilidades.sizeTitle4,
                                                fontFamily:
                                                    Utilidades.fontHelMedium),
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                ...splits.map(buildSingleText).toList(),
                                const SizedBox(
                                  height: 35,
                                ),
                                ...imageSliders,
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

  _showImage(BuildContext context, String url, double ancho) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ImageNetwork(imagen: url, widthImage: ancho),
              ),
            ),
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

  Widget buildSingleText(String text) => buildText(text: text);

  Widget buildText({required String text}) => SizedBox(
        width: Utilidades.anchoEvento * 2,
        child: Text(text,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: Utilidades.sizeTitle4 - 1,
                fontFamily: Utilidades.fontHelRegular)),
      );
}
