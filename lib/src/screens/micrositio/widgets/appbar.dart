// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/custom_drawer.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';

class CustomAppbar extends StatefulWidget {
  final bool leading;
  final String ruta;
  const CustomAppbar(this.leading, this.ruta);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 10;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }

    return AppBar(
        leading: widget.leading == true
            ? InkWell(
                onTap: () {
                  Utilidades.sala = false;
                  Utilidades.bio = true;
                  Utilidades.video = false;
                  Utilidades.obra = false;
                  context.vRouter.to(widget.ruta);
                },
                child: const Icon(Icons.arrow_back))
            : const CustomDrawer(),
        iconTheme: const IconThemeData(color: Color(0xff9D2449)),
        backgroundColor: const Color(0xfff6f1f6),
        title: Padding(
          padding: EdgeInsets.only(right: responsive == false ? _width : 1),
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
              responsive == true
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
                padding: EdgeInsets.only(left: responsive == false ? 10 : 1),
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
        ));
  }
}
