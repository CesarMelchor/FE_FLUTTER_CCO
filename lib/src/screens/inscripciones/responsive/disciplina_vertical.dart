import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class DisciplinaVertical extends StatefulWidget {
  const DisciplinaVertical({Key? key}) : super(key: key);

  @override
  State<DisciplinaVertical> createState() => _DisciplinaVerticalState();
}

class _DisciplinaVerticalState extends State<DisciplinaVertical> {
  @override
  Widget build(BuildContext context) {
    return Column(


      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              setState(() {
                Utilidades.imagenMail =
                    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/CABECERA-GENERAL.png";
                Utilidades.r = 196;
                Utilidades.g = 40;
                Utilidades.b = 102;
                Utilidades.colorMail = "C42866";
                cookie.set('campo', 'CULTURA PARA NIÑOS Y NIÑAS', maxAge: const Duration(days: 1));
              
                          context.vRouter.to('/especialidad');
              });
            },
            child: Column(
              children: [
                Image.asset("assets/logos/logo_culturainfantil.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Cultura Infantil",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
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
                Image.asset(
                  "assets/logos/logo_artesplasticas.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Artes Plásticas",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
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
                Image.asset(
                  "assets/logos/logo_danza.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Danza",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
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
                Image.asset(
                  "assets/logos/logo_musica.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Música",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
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
                Image.asset(
                  "assets/logos/logo_teatro.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Teatro",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
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
                Image.asset(
                  "assets/logos/logo_alternativos.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Alternativos",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
