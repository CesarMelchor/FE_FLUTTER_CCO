import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/exposiciones.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExposicionDetalle extends StatefulWidget {
  const ExposicionDetalle({Key? key}) : super(key: key);

  @override
  State<ExposicionDetalle> createState() => _ExposicionDetalleState();
}

class _ExposicionDetalleState extends State<ExposicionDetalle>
    with TickerProviderStateMixin {
  String cooki = "";
  String idF = "";

  List<Imagenes> imagenes = [];
  bool video = false;

  late final Future? myFuture2 = getImagenes(idF);
  Exposiciones exposicion = Exposiciones(
      id: "",
      fechaInicio: "",
      fechaTermino: "",
      nombre: "",
      artista: "",
      descripcion: "",
      miniatura: "",
      cabecera: "",
      espacio: "",
      idImagenes: "");

  late Response response;
  var dio = Dio();
  late final String url;

  Future getImagenes(carrusel) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getImagesbyId',
          'id' : carrusel
        });
    final result = response.data;
    Iterable list = result['imagenes'];
    var imas = list.map<Imagenes>((json) => Imagenes.fromJson(json)).toList();

    setState(() {
      imagenes = imas;
      url = imagenes.first.pathlink;
      if (url == ".") {
        video = false;
      } else {
        video = true;
      }
    });
    return imas;
  }

  Future getDataExposicion(carrusel) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getExpo',
          'id' : carrusel
        });
    final result = response.data;
    var expo = Exposiciones.fromJson(result);
    myFuture2;
    setState(() {
      cookie.set('idExpo', context.vRouter.pathParameters['id'].toString(),
          maxAge: const Duration(days: 1));
      exposicion = expo;
    });
    return expo;
  }

  @override
  Widget build(BuildContext context) {
    final name = context.vRouter.pathParameters['id'];
    if (cooki == "") {
      idF = name!;
    } else {
      idF = cooki;
    }
    late final Future? myFuture = getDataExposicion(idF);

    Size size = MediaQuery.of(context).size;
    double _width = size.width / 5.8;
    double _width2 = size.width / 2.5;
    double _width4 = size.width / 4.5;
    double _width3 = size.width / 0.5;
    late double ancho;

    List<String> splits = exposicion.descripcion.split('/n');

    bool responsive = false;
    if (size.width <= 844) {
      setState(() {
        _width2 = size.width / 2;
        ancho = size.width / 1.3;
        Utilidades.anchoTextdetalleExposicion = ancho;
        Utilidades.anchoImagenExposicion = ancho;
        _width = size.width / 7;
      });
      responsive = true;
    } else {
      setState(() {
        Utilidades.anchoTextdetalleExposicion = _width2;
        Utilidades.anchoImagenExposicion = _width4;
        _width = size.width / 5.8;
      });
      responsive = false;
    }

    final List<Widget> imageSliders = imagenes
        .map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  _showImage(context, item.pathimagen, size.width, _width);
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        ImageNetwork(
                          imagen: item.pathimagen,
                          widthImage: Utilidades.anchoImagenExposicion,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.descripcion,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/home/2/0/0"),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageNetwork(
                          imagen: exposicion.cabecera, widthImage: size.width),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: _width),
                          child: responsive == false
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          exposicion.fechaInicio +
                                              " | " +
                                              exposicion.fechaTermino,
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelBold,
                                              fontSize: Utilidades.sizeTitle4),
                                        ),
                                        SizedBox(
                                          width: Utilidades.anchoTextdetalleExposicion,
                                          child: Text(
                                            exposicion.nombre,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelBold,
                                                fontSize: Utilidades.sizeTitle2),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            exposicion.artista,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize:
                                                    Utilidades.sizeTitle3_A),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            exposicion.espacio,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize: Utilidades.sizeTitle4,
                                                color: Utilidades.rosa),
                                          ),
                                        ),
                                        ...splits.map(buildSingleText).toList(),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        ...imageSliders,
                                      ],
                                    )
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          exposicion.fechaInicio +
                                              " | " +
                                              exposicion.fechaTermino,
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelBold,
                                              fontSize: Utilidades.sizeTitle4),
                                        ),
                                        SizedBox(
                                          width: Utilidades.anchoTextdetalleExposicion,
                                          child: Text(
                                            exposicion.nombre,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelBold,
                                                fontSize: Utilidades.sizeTitle2),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            exposicion.artista,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize:
                                                    Utilidades.sizeTitle3_A),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            exposicion.espacio,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize: Utilidades.sizeTitle4,
                                                color: Utilidades.rosa),
                                          ),
                                        ),
                                        ...splits.map(buildSingleText).toList(),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        ...imageSliders,
                                      ],
                                    )
                                  ],
                                )),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: SizedBox(
                            width: _width3,
                            child: video == true
                                ? YoutubePlayer(
  controller:  YoutubePlayerController.fromVideoId(
  videoId: url,
  autoPlay: false,
  params: const YoutubePlayerParams(showFullscreenButton: true),
),
  aspectRatio: 16 / 9,
)
                                : const SizedBox()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomFooter()
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

  Widget buildSingleText(String text) => buildText(text: text);

  Widget buildText({required String text}) => SizedBox(
        width: Utilidades.anchoTextdetalleExposicion,
        child: Text(
          text,
          style: TextStyle(height: 1.5, fontFamily: Utilidades.fontHelRegular),
          textAlign: TextAlign.justify,
        ),
      );

  _showImage(BuildContext context, String url, double ancho, anchoInterior) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding:
                EdgeInsets.symmetric(horizontal: anchoInterior, vertical: 30),
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
}

