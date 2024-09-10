import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;
    double widhLogo = size.width / 12;
    bool responsive = false;
    if (size.width <= 844) {
      setState(() {
        responsive = true;
        _width = 10;
      });
    } else {
      setState(() {
        responsive = false;
      });
    }
    return Container(
      color: const Color(0xff666666),
      child: Padding(
        padding:
            EdgeInsets.only(top: 10, bottom: 10, left: _width, right: _width),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logos/LogoHorizontal_CCO.png",
                      height: 55,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Text("González Ortega No. 403,",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text("Col. Centro, C.P. 68000,",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle5,
                              color: Colors.white)),
                    ),
                    Text("Oaxaca de Juárez, Oaxaca",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    Text(
                      "Teléfonos:",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle5,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        "951 51 61154",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle4,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      "951 51 62483",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle4,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text("951 50 10357",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle4,
                              color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    Text("casaculturaoax@gmail.com",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    const SizedBox(height: 10)
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("SÍGUENOS EN NUESTRAS",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text("REDES SOCIALES",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle5,
                              color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GlobalFunctions.launchURL(Utilidades.urlFacebook);
                          },
                          child: const Image(
                            width: 22,
                            color: Colors.white,
                            image: Svg('assets/svg/facebook.svg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: InkWell(
                            onTap: () {
                              GlobalFunctions.launchURL(
                                  Utilidades.urlInstagram);
                            },
                            child: const Image(
                              width: 24,
                              color: Colors.white,
                              image: Svg('assets/svg/instagram.svg'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            GlobalFunctions.launchURL(Utilidades.urlTwitter);
                          },
                          child: const Image(
                            width: 24,
                            color: Colors.white,
                            image: Svg('assets/svg/twitter.svg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: InkWell(
                            onTap: () {
                              GlobalFunctions.launchURL(Utilidades.urlYoutube);
                            },
                            child: const Image(
                              width: 24,
                              color: Colors.white,
                              image: Svg('assets/svg/youtube.svg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Image.asset("assets/logos/Logo_gob2023.png", width: widhLogo),
                    ),
                    Text("2022, AÑO DEL CENTENARIO DE LA",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text("CONSTITUCIÓN POLÍTICA DEL ESTADO",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle5,
                              color: Colors.white)),
                    ),
                    Text("LIBRE Y SOBERANO DE OAXACA",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle5,
                            color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 15),
            responsive == false
                ? Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Copyright 2022 | Designed by @MC & @AP",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelRegular,
                                  fontSize: Utilidades.sizeTitle5,
                                  color: Colors.white)),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Gobierno del Estado de Oaxaca",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelRegular,
                                  fontSize: Utilidades.sizeTitle5,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Copyright 2022 | Designed by @MC & @AP",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelRegular,
                                  fontSize: Utilidades.sizeTitle5,
                                  color: Colors.white)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Gobierno del Estado de Oaxaca",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelRegular,
                                  fontSize: Utilidades.sizeTitle5,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
