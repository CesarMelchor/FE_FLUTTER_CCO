import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:micrositio_cco/src/models/virtuales.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetalleVirtualScreen extends StatefulWidget {
  const DetalleVirtualScreen({Key? key}) : super(key: key);

  @override
  State<DetalleVirtualScreen> createState() => _DetalleVirtualScreenState();
}

class _DetalleVirtualScreenState extends State<DetalleVirtualScreen> {
  Virtuales virtual = Virtuales(
      id: "",
      numero: "",
      numeroText: "",
      fecha: "",
      nombre: "",
      artista: "",
      imagenMiniatura: "",
      imagenArtista: "",
      biografia: "",
      textoSala: "",
      idImagenes: "",
      linkVideo: "");

  late Response response;
  var dio = Dio();
  bool update = false;
  bool rVideo = true;
  String numero = "";
  String id = "";
  late final Future? myFuture2 = postImagenes(id);
  late final Future? myFuture3 = updateVisit(numero);

  Future getData(numero) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {'consulta': 'getExpoVirtual', 'numero': numero});
    virtual = Virtuales.fromJson(response.data);
    setState(() {
      id = virtual.idImagenes;
      if (virtual.linkVideo == '.') {
        rVideo = false;
      } else {
        rVideo = true;
      }
    });
    myFuture2;
    if (update == true) {
      myFuture3;
    }

    return virtual;
  }

  List<Imagenes> imagenes = [];

  Future postImagenes(carrusel) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {'consulta': 'getImagesbyId', 'id': carrusel});
    final result = response.data;
    Iterable list = result['imagenes'];

    var imas = list.map<Imagenes>((json) => Imagenes.fromJson(json)).toList();
    setState(() {
      imagenes = imas;
    });
    return imas;
  }

  double anchoTotal = 0;
  double altoTotal = 0;
  late final String dato;

  CarouselController buttonCarouselController = CarouselController();

  Future updateVisit(numer) async {
    var url = "https://casadelaculturaoaxaca.com/public/fast_query";
    var res = await dio.get(url,
        queryParameters: {'consulta': 'updateVisitas', 'numero': numer});
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    final String? dato = cookie.get("userVisit");

    if (dato == null) {
      cookie.set('userVisit', "1", maxAge: const Duration(days: 20));
      setState(() {
        update = true;
      });
    } else {
      update = false;
    }

    setState(() {
      numero = context.vRouter.pathParameters['id'].toString();
    });

    late final Future? myFuture = getData(numero);

    Size size = MediaQuery.of(context).size;
    double tercia = anchoTotal / 3.8;
    bool responsive = false;
    double anchoCarrusel = 0;

    if (size.width <= 844) {
      setState(() {
        responsive = true;
        anchoTotal = size.width;
        altoTotal = size.height;
        anchoCarrusel = (anchoTotal / 3) * 2.5;
      });
    } else {
      setState(() {
        responsive = false;
        anchoTotal = size.width;
        altoTotal = size.height;
        anchoCarrusel = tercia * 2;
      });
    }

    List<String> textoSala = virtual.textoSala.split('/n');
    List<String> biografia = virtual.biografia.split('/n');

    final List<Widget> imageSliders = imagenes
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            _showCarrusel(context, size.width - 20,
                                size.height - 20, item.pathimagen);
                          },
                          child: SizedBox(
                            width: anchoCarrusel,
                            height: anchoCarrusel,
                            child: ImageNetwork(
                              imagen: item.pathimagen,
                              widthImage: anchoCarrusel,
                            ),
                          )),
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/home/2/0/2"),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? responsive == false
                  ? ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: anchoTotal / 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                virtual.nombre,
                                style: TextStyle(
                                    fontSize: Utilidades.sizeTitle2,
                                    fontFamily: Utilidades.fontHelBold),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: tercia,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(virtual.imagenArtista,
                                              width: tercia),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            virtual.artista,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize:
                                                    Utilidades.sizeTitle4),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            virtual.numeroText,
                                            style: TextStyle(
                                                color: Utilidades.rosa,
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize:
                                                    Utilidades.sizeTitle4 - 2),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            virtual.fecha,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelMedium,
                                                fontSize:
                                                    Utilidades.sizeTitle4 - 2),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: tercia / 4,
                                                child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                            foregroundColor:
                                                                Colors.black,
                                                            backgroundColor:
                                                                Utilidades.bio ==
                                                                        false
                                                                    ? Colors
                                                                        .white
                                                                    : Utilidades
                                                                        .rosa),
                                                    onPressed: () {
                                                      setState(() {
                                                        Utilidades.bio = true;
                                                        Utilidades.sala = false;
                                                        Utilidades.obra = false;
                                                        Utilidades.video =
                                                            false;
                                                      });
                                                    },
                                                    child: Text(
                                                      "Bio",
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelMedium,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              3),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: tercia / 4,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Utilidades.bio = false;
                                                        Utilidades.sala = true;
                                                        Utilidades.obra = false;
                                                        Utilidades.video =
                                                            false;
                                                      });
                                                    },
                                                    style:
                                                        Utilidades.sala == false
                                                            ? Utilidades.color1
                                                            : Utilidades.color2,
                                                    child: Text(
                                                      "T. Sala",
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelMedium,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              3),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: tercia / 4,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Utilidades.bio = false;
                                                        Utilidades.sala = false;
                                                        Utilidades.obra = true;
                                                        Utilidades.video =
                                                            false;
                                                      });
                                                    },
                                                    style:
                                                        Utilidades.obra == false
                                                            ? Utilidades.color1
                                                            : Utilidades.color2,
                                                    child: Text(
                                                      "Obra",
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelMedium,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              3),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: tercia / 4,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Utilidades.bio = false;
                                                        Utilidades.sala = false;
                                                        Utilidades.obra = false;
                                                        Utilidades.video = true;
                                                      });
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                            foregroundColor:
                                                                Colors.black,
                                                            backgroundColor:
                                                                Utilidades.video ==
                                                                        false
                                                                    ? Colors
                                                                        .white
                                                                    : Utilidades
                                                                        .rosa),
                                                    child: Text(
                                                      "Video",
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelMedium,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              3),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: (tercia * 2) - 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Utilidades.bio == true
                                            ? SizedBox(
                                                width: tercia * 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      virtual.artista,
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelBold),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ...biografia
                                                        .map(buildSingleText)
                                                        .toList(),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                        Utilidades.sala == true
                                            ? SizedBox(
                                                width: tercia * 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      virtual.nombre,
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelBold),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ...textoSala
                                                        .map(buildSingleText)
                                                        .toList(),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                        Utilidades.obra == true
                                            ? Column(
                                                children: [
                                                  CarouselSlider(
                                                    carouselController:
                                                        buttonCarouselController,
                                                    options: CarouselOptions(
                                                        autoPlay: false,
                                                        enlargeCenterPage: true,
                                                        autoPlayInterval:
                                                            const Duration(
                                                                seconds: 4)),
                                                    items: imageSliders,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          icon: const Icon(
                                                            Icons.arrow_back,
                                                          ),
                                                          onPressed: () {
                                                            buttonCarouselController
                                                                .previousPage(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .linear);
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 25),
                                                          child: IconButton(
                                                            icon: const Icon(Icons
                                                                .arrow_forward),
                                                            onPressed: () {
                                                              buttonCarouselController.nextPage(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            : const SizedBox(),
                                        Utilidades.video == true
                                            ? Center(
                                                child: rVideo == true
                                                    ? SizedBox(
                                                        width: tercia * 2,
                                                        child: YoutubePlayer(
  controller:  YoutubePlayerController.fromVideoId(
  videoId: virtual.linkVideo,
  autoPlay: false,
  params: const YoutubePlayerParams(showFullscreenButton: true),
),
  aspectRatio: 16 / 9,
))
                                                    : Image.network(
                                                        "https://casadelaculturaoaxaca.com/images/cartelera/video_na.png",
                                                        width: tercia * 2),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomFooter()
                      ],
                    )
                  : // Widget a mostrar cuando la variable responsive es true
                  ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: anchoTotal / 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                virtual.nombre,
                                style: TextStyle(
                                    fontSize: Utilidades.sizeTitle2,
                                    fontFamily: Utilidades.fontHelBold),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.network(virtual.imagenArtista,
                                  width: (anchoTotal / 3) * 2.5),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                virtual.artista,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelMedium,
                                    fontSize: Utilidades.sizeTitle4),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                virtual.numeroText,
                                style: TextStyle(
                                    color: Utilidades.rosa,
                                    fontFamily: Utilidades.fontHelMedium,
                                    fontSize: Utilidades.sizeTitle4 - 2),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                virtual.fecha,
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelMedium,
                                    fontSize: Utilidades.sizeTitle4 - 2),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: anchoTotal / 5,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor:
                                                Utilidades.bio == false
                                                    ? Colors.white
                                                    : Utilidades.rosa),
                                        onPressed: () {
                                          setState(() {
                                            Utilidades.bio = true;
                                            Utilidades.sala = false;
                                            Utilidades.obra = false;
                                            Utilidades.video = false;
                                          });
                                        },
                                        child: Text(
                                          "Bio",
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelMedium,
                                              fontSize:
                                                  Utilidades.sizeTitle4 - 3),
                                        )),
                                  ),
                                  SizedBox(
                                    width: anchoTotal / 5,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            Utilidades.bio = false;
                                            Utilidades.sala = true;
                                            Utilidades.obra = false;
                                            Utilidades.video = false;
                                          });
                                        },
                                        style: Utilidades.sala == false
                                            ? Utilidades.color1
                                            : Utilidades.color2,
                                        child: Text(
                                          "T. Sala",
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelMedium,
                                              fontSize:
                                                  Utilidades.sizeTitle4 - 3),
                                        )),
                                  ),
                                  SizedBox(
                                    width: anchoTotal / 5,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            Utilidades.bio = false;
                                            Utilidades.sala = false;
                                            Utilidades.obra = true;
                                            Utilidades.video = false;
                                          });
                                        },
                                        style: Utilidades.obra == false
                                            ? Utilidades.color1
                                            : Utilidades.color2,
                                        child: Text(
                                          "Obra",
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelMedium,
                                              fontSize:
                                                  Utilidades.sizeTitle4 - 3),
                                        )),
                                  ),
                                  SizedBox(
                                    width: anchoTotal / 5,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            Utilidades.bio = false;
                                            Utilidades.sala = false;
                                            Utilidades.obra = false;
                                            Utilidades.video = true;
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor:
                                                Utilidades.video == false
                                                    ? Colors.white
                                                    : Utilidades.rosa),
                                        child: Text(
                                          "Video",
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelMedium,
                                              fontSize:
                                                  Utilidades.sizeTitle4 - 3),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Utilidades.bio == true
                                  ? Column(
                                      children: [
                                        Text(
                                          virtual.artista,
                                          style: TextStyle(
                                              fontFamily:
                                                  Utilidades.fontHelBold),
                                        ),
                                        const SizedBox(height: 10),
                                        ...biografia
                                            .map(buildSingleText)
                                            .toList(),
                                      ],
                                    )
                                  : const SizedBox(),
                              Utilidades.sala == true
                                  ? SizedBox(
                                      width: (anchoTotal / 3) * 2.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            virtual.nombre,
                                            style: TextStyle(
                                                fontFamily:
                                                    Utilidades.fontHelBold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ...textoSala
                                              .map(buildSingleText)
                                              .toList(),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              Utilidades.obra == true
                                  ? Column(
                                      children: [
                                        CarouselSlider(
                                          carouselController:
                                              buttonCarouselController,
                                          options: CarouselOptions(
                                              autoPlay: false,
                                              enlargeCenterPage: true,
                                              autoPlayInterval:
                                                  const Duration(seconds: 4)),
                                          items: imageSliders,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_back,
                                                ),
                                                onPressed: () {
                                                  buttonCarouselController
                                                      .previousPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          curve: Curves.linear);
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: IconButton(
                                                  icon: const Icon(
                                                      Icons.arrow_forward),
                                                  onPressed: () {
                                                    buttonCarouselController
                                                        .nextPage(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        300),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              Utilidades.video == true
                                  ? Center(
                                      child: SizedBox(
                                          width: (anchoTotal / 3) * 2.5,
                                          child: rVideo == true
                                              ? YoutubePlayer(
  controller:  YoutubePlayerController.fromVideoId(
  videoId: virtual.linkVideo,
  autoPlay: false,
  params: const YoutubePlayerParams(showFullscreenButton: true),
),
  aspectRatio: 16 / 9,
)
                                              : Image.network(
                                                  "https://casadelaculturaoaxaca.com/images/cartelera/video_na.png",
                                                  width:
                                                      (anchoTotal / 3) * 2.5)),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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

  Widget buildText({required String text}) => SizedBox(
        width: (anchoTotal / 3) * 2.5,
        child: Text(
          text,
          style: TextStyle(
            height: 1.5,
            fontFamily: Utilidades.fontHelRegular,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget buildSingleTextBold(String text) => buildText(text: text);

  Widget buildTextBold({required String text}) => SizedBox(
        width: (anchoTotal / 3) * 2.5,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontFamily: Utilidades.fontHelBold,
          ),
          textAlign: TextAlign.left,
        ),
      );

  _showCarrusel(BuildContext context, ancho, alto, link) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
                width: ancho,
                child: ImageNetwork(imagen: link, widthImage: ancho)),
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
