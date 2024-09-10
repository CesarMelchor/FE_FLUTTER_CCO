import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/page_manager.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

// ignore: must_be_immutable
class RowEpisodio extends StatefulWidget {
  String imagen = "";
  String id = "";
  String titulo = "";
  String descripcion = "";
  String rutaAudio = "";

  RowEpisodio(
      {Key? key,
      required this.imagen,
      required this.descripcion,
      required this.id,
      required this.titulo,
      required this.rutaAudio})
      : super(key: key);

  @override
  State<RowEpisodio> createState() => _RowEpisodioState();
}

class _RowEpisodioState extends State<RowEpisodio> {
  late final PageManager _pageManager;
  bool reproduccion = false;
  @override
  void initState() {
    super.initState();
    _pageManager = PageManager(widget.rutaAudio);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 5.8;
    double _width2 = size.width / 2 - _width;

    return Row(
      children: [
        ImageNetwork(imagen: widget.imagen, widthImage: 220),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Episodio" + widget.id,
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle3),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: _width2,
                child: Text(widget.titulo,
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelRegular,
                        fontSize: Utilidades.sizeTitle3_2),
                    textAlign: TextAlign.left),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: _width2,
                child: Text(widget.descripcion,
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelRegular,
                        fontSize: Utilidades.sizeTitle4,
                        color: const Color(0xff666666)),
                    textAlign: TextAlign.left),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: ValueListenableBuilder<ButtonState>(
                    valueListenable: _pageManager.buttonNotifier,
                    builder: (_, value, __) {
                      switch (value) {
                        case ButtonState.loading:
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 32.0,
                            height: 32.0,
                            child: const CircularProgressIndicator(),
                          );
                        case ButtonState.paused:
                          return InkWell(
                            child: const Image(
                              width: 40,
                              image: Svg('assets/svg/play_podcast_on.svg'),
                            ),
                            onTap: _pageManager.play,
                          );
                        case ButtonState.playing:
                          return InkWell(
                              child: const Image(
                                width: 40,
                                image: Svg('assets/svg/play_podcast_off.svg'),
                              ),
                              onTap: _pageManager.pause);
                      }
                    },
                  ),
                ),
                Text(
                  "Escúchanos en: ",
                  style: TextStyle(
                      color: const Color(0xff9D2449),
                      fontFamily: Utilidades.fontHelRegular,
                      fontSize: Utilidades.sizeTitle3_2),
                ),
                InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(Utilidades.urlSpotify);
                    },
                    child: const Image(
                      width: 20,
                      image: Svg('assets/svg/spotify_podcast.svg'),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlApple);
                      },
                      child: const Image(
                        width: 20,
                        image: Svg('assets/svg/apple_podcast.svg'),
                      )),
                ),
                InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(Utilidades.urlGoogle);
                    },
                    child: const Image(
                      width: 20,
                      image: Svg('assets/svg/google_podcast.svg'),
                    ))
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }
}
