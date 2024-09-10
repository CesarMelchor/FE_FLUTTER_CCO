import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class CuerpoVisita2 extends StatefulWidget {
  const CuerpoVisita2({Key? key}) : super(key: key);

  @override
  State<CuerpoVisita2> createState() => _CuerpoVisita2State();
}

class _CuerpoVisita2State extends State<CuerpoVisita2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width2 = size.width / 1.2;
    double _width3 = size.width / 1.6;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _width2,
          child: Text(
            "González Ortega No. 403, Col. Centro, C.P.",
            style: TextStyle(
                fontFamily: Utilidades.fontHelMedium,
                fontSize: Utilidades.sizeTitle4),
          ),
        ),
        SizedBox(
          width: _width2,
          child: Text(
            "68000,Oaxaca de Juárez, Oaxaca.",
            style: TextStyle(
                fontFamily: Utilidades.fontHelMedium,
                fontSize: Utilidades.sizeTitle4),
          ),
        ),
        InkWell(
          onTap: () {
            GlobalFunctions.launchURL(
                "https://goo.gl/maps/R3Lh59zCgYJ5eSrW6");
          },
          child: Row(
            children: [
              const Icon(Icons.place),
              const SizedBox(
                width: 3,
              ),
              Text(
                "MAPA",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4,
                    color: Utilidades.rosa),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Acceso",
            style: TextStyle(
                fontFamily: Utilidades.fontHelBold,
                fontSize: Utilidades.sizeTitle4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: _width2,
            child: Text(
              "La entrada a las galerías de la Casa de la Cultura Oaxaqueña es gratuita.",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelMedium,
                  fontSize: Utilidades.sizeTitle4),
            ),
          ),
        ),
        SizedBox(
          width: _width2,
          child: Text(
            "Las visitas se llevan a cabo de lunes a viernes, en un horario de 15:30 a 18:30 horas.",
            style: TextStyle(
                fontFamily: Utilidades.fontHelMedium,
                fontSize: Utilidades.sizeTitle4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: _width2,
            child: Text(
              "Cerrado sábado y domingo",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: _width2,
            child: Text(
              "Visitas guiadas",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle4),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: _width2,
            child: Text(
              "Las visitas guiadas a las exposiciones de la Casa de la Cultura Oaxaqueña están sujetas a la agenda de los artistas exponentes y se llevan a cabo en grupos de diez personas como máximo.",
              style: TextStyle(
                fontFamily: Utilidades.fontHelMedium,
                fontSize: Utilidades.sizeTitle4,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
              width: _width3,
              child: Text(
                "Criterios de la visita por motivos de la COVID-19",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle4),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_1.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: _width3,
                      child: Text(
                        "A tu ingreso deberás aplicarte gel antibacterial en las manos. ",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelMedium,
                            fontSize: Utilidades.sizeTitle4),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_2.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "El uso del cubrebocas es obligatorio, deberás usarlo durante mientras te encuentres dentro de la institución.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_3.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "El personal de la Casa de la Cultura Oaxaqueña te dará las indicaciones sobre el recorrido a las exposiciones. ",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_4.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "El aforo máximo de las galerías es de diez personas por grupo.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_5.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "No se permite el acceso con alimentos o bebidas.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_6.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "Mantén en todo momento la sana distancia.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_7.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "Recuerda las medidas de protección a la salud: estornudo de etiqueta, lavado frecuente de manos y sana distancia.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_8.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "Por favor, en todo momento, atiende las indicaciones del personal.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter),
            Row(
              children: [
                 Image.asset("assets/icons/CriteriosCOVID_9.png", height: 55,),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: _width3,
                        child: Text(
                          "La Casa de la Cultura Oaxaqueña no cuenta con servicio de paquetería ni estacionamiento, no se permite la entrada con bicicletas.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ],
            ),
            Divider(thickness: 3, color: Utilidades.grisFooter)
      ],
    );
  }
}
