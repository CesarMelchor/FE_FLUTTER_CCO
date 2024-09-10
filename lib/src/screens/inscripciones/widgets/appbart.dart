// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class CustomAppbarLogout extends StatefulWidget {
  final String ruta;
  const CustomAppbarLogout(this.ruta);

  @override
  State<CustomAppbarLogout> createState() => _CustomAppbarLogoutState();
}

class _CustomAppbarLogoutState extends State<CustomAppbarLogout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 6.3;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }

    return AppBar(
        leading: InkWell(
            onTap: () {
              _buildAlertDialog(context);
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
        ));
  }

  _buildAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 70),
            child: AlertDialog(
              title: const Text("¿Estás seguro que deseas salir?"),
              actions: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: const Text("Aceptar"),
                        onPressed: () {
                          cookie.remove('correo');
                          setState(() {
                            Utilidades.index = 6;
                          });
                          context.vRouter.to(widget.ruta);
                        }),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        child: const Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }
}
