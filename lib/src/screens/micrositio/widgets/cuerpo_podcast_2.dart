import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ColumnPodcast1 extends StatefulWidget {
  const ColumnPodcast1({Key? key}) : super(key: key);

  @override
  State<ColumnPodcast1> createState() => _ColumnPodcast1State();
}

class _ColumnPodcast1State extends State<ColumnPodcast1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Farolito Cultural",
          style: TextStyle(
              fontFamily: Utilidades.fontHelBold,
              fontSize: Utilidades.sizeTitle2),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Escúchanos en: ",
              style: TextStyle(
                  color: const Color(0xff9D2449),
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle3_2),
            ),
            const SizedBox(
              width: 3,
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
                )),
          ],
        )
      ],
    );
  }
}
