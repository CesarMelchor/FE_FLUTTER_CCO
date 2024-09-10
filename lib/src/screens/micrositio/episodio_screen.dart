import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/episodios.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/carrusel_podcast.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/column_episodio.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/row_episodio.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/page_manager.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class EpisodioScreen extends StatefulWidget {
  const EpisodioScreen({Key? key}) : super(key: key);

  @override
  State<EpisodioScreen> createState() => _EpisodioScreenState();
}

class _EpisodioScreenState extends State<EpisodioScreen> {
  late final PageManager _pageManager;
  String id = "";

  Episodios episodio = Episodios(
      id: "",
      titulo: "",
      descripcion: "",
      rutaimagen: "",
      rutacabecera: "",
      rutaaudio: "",
      idcarrusel: "");

  late Response response;
  var dio = Dio();

  Future getEpisodio(id) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {'consulta': 'getEpisodio', 'id': id});
    final result = response.data;
    episodio = Episodios.fromJson(result);

    return episodio;
  }

  bool reproduccion = false;
  @override
  void initState() {
    super.initState();
    _pageManager = PageManager(Utilidades.rutaaudio);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      id = context.vRouter.pathParameters['id'].toString();
    });

    late final Future? myFuture = getEpisodio(id);
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 5.8;
    double _widthR = size.width / 6.3;
    double _widthL = size.width / 9;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: AppBar(
            leading: InkWell(
                onTap: () {
                  if (Utilidades.reproduccion == true) {
                    _pageManager.pause;
                  }
                  context.vRouter.to('/home/5/0/0');
                },
                child: const Icon(Icons.arrow_back)),
            iconTheme: const IconThemeData(color: Color(0xff9D2449)),
            backgroundColor: const Color(0xfff6f1f6),
            title: Padding(
              padding: EdgeInsets.only(right: _widthR, left: _widthL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  responsive == false
                      ? Text("Micrositio de la Casa de la Cultura Oaxaqueña",
                          style: TextStyle(
                              color: const Color(0xff666666),
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle4))
                      : Container(
                          width: 1,
                        ),
                  Expanded(child: Container()),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Image(
                      width: 15,
                      image: Svg('assets/svg/telefono.svg'),
                    ),
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
                        width: 15,
                        image: Svg('assets/svg/mail.svg'),
                      )),
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
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      ImageNetwork(
                          imagen: episodio.rutacabecera,
                          widthImage: size.width),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Un podcast para toda la familia",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelBold,
                                      fontSize: Utilidades.sizeTitle3),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                    onTap: () {
                                      context.vRouter.to('/home/5/0/0');
                                    },
                                    child: const Icon(
                                      Icons.keyboard_return,
                                      color: Color(0xff9D2449),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: InkWell(
                                      onTap: () {
                                        context.vRouter.to('/home/5/0/0');
                                      },
                                      child: Text(
                                        "Regresar",
                                        style: TextStyle(
                                            color: const Color(0xff9D2449),
                                            fontFamily:
                                                Utilidades.fontHelRegular,
                                            fontSize: Utilidades.sizeTitle4),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            responsive == false
                                ? RowEpisodio(
                                    imagen: episodio.rutaimagen,
                                    id: episodio.id,
                                    descripcion: episodio.descripcion,
                                    titulo: episodio.titulo,
                                    rutaAudio: episodio.rutaaudio,
                                  )
                                : ColumnEpisodio(
                                    imagen: episodio.rutaimagen,
                                    id: episodio.id,
                                    descripcion: episodio.descripcion,
                                    titulo: episodio.titulo,
                                    rutaAudio: episodio.rutaaudio,
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      episodio.idcarrusel == '0'
                          ? Container()
                          : CarouselPodcast(episodio.idcarrusel),
                      const SizedBox(
                        height: 25,
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
          }),
    );
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }
}
