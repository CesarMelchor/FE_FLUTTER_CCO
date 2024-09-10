
import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class DisciplinaWidget extends StatefulWidget {
 const DisciplinaWidget({Key? key}) : super(key: key);

  @override
  State<DisciplinaWidget> createState() => _DisciplinaWidgetState();
}

class _DisciplinaWidgetState extends State<DisciplinaWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    if (Utilidades.responsive == false) {
      setState(() {
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
      });
    } else {
      setState(() {
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
      });
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.r = 196;
                Utilidades.g = 40;
                Utilidades.b = 102;
                Utilidades.colorMail = "C42866";
                cookie.set('campo', 'CULTURA PARA NIÑOS Y NIÑAS', maxAge: const Duration(days: 1));
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
                
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset(
                  "assets/logos/logo_culturainfantil.png",
                  width: (size.width / 6) - 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "CULTURA PARA NIÑOS Y NIÑAS",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3 - 2),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.r = 86;
                Utilidades.g = 98;
                Utilidades.b = 163;
                Utilidades.colorMail = "5662A3";
                cookie.set('campo', 'ARTES PLÁSTICAS', maxAge: const Duration(days: 1));
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
                
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset("assets/logos/logo_artesplasticas.png",
                    width: (size.width / 6) - 100),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "ARTES PLÁSTICAS",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3 - 2),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.r = 83;
                Utilidades.g = 160;
                Utilidades.b = 212;
                Utilidades.colorMail = "53A0D4";
                cookie.set('campo', 'DANZA', maxAge: const Duration(days: 1));
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
               
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset("assets/logos/logo_danza.png",
                    width: (size.width / 6) - 100),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "DANZA",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3 - 2),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.r = 215;
                Utilidades.g = 186;
                Utilidades.b = 28;
                Utilidades.colorMail = "D7BA1C";
                cookie.set('campo', 'MÚSICA', maxAge: const Duration(days: 1));
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
               
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset("assets/logos/logo_musica.png",
                    width: (size.width / 6) - 100),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "MÚSICA",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3 - 2),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.r = 114;
                Utilidades.g = 30;
                Utilidades.b = 101;
                Utilidades.colorMail = "721E65";
                cookie.set('campo', 'TEATRO', maxAge: const Duration(days: 1));
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
                
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset("assets/logos/logo_teatro.png",
                    width: (size.width / 6) - 100),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "TEATRO",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3 - 2),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              Utilidades.r = 95;
              Utilidades.g = 138;
              Utilidades.b = 55;
                Utilidades.colorMail = "5F8A37";
                cookie.set('campo', 'ALTERNATIVOS', maxAge: const Duration(days: 1));
              Utilidades.imagenMail =
                  "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
                          context.vRouter.to('/especialidad');
            });
          },
          child: Column(
            children: [
              Image.asset("assets/logos/logo_alternativos.png",
                  width: (size.width / 6) - 100),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "ALTERNATIVOS",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.fontSizeTitle3 - 2),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
