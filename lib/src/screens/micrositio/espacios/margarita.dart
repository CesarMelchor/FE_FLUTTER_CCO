import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class MargaritaMazaScreen extends StatefulWidget {
  const MargaritaMazaScreen({Key? key}) : super(key: key);

  @override
  State<MargaritaMazaScreen> createState() => _MargaritaMazaScreenState();
}

class _MargaritaMazaScreenState extends State<MargaritaMazaScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
      _width = size.width / 14;
    } else {
      responsive = false;
      _width = size.width / 11;
    }
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: responsive == true
              ? const Size.fromHeight(30.0)
              : const Size.fromHeight(40.0),
          child: const CustomAppbar(true, "/home/1/0/0"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageNetwork(
                imagen:
                    "https://casadelaculturaoaxaca.com/images/head_foromargarita.png",
                widthImage: double.infinity,
              ),
              Container(
                padding: EdgeInsets.only(left: _width, right: _width),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Foro “Margarita Maza Parada”",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Este espacio de la Casa de la Cultura Oaxaqueña es ocupado para la realización de actividades escénicas como presentaciones de obras de teatro, conciertos, danza, entre otros. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "El foro lleva por nombre Margarita Maza Parada en honor a la oaxaqueña, hija adoptiva de Antonio Maza Padilla y Petra Parada Sigüenza quienes la acogieron al nacer y criaron sin distingo, como la menor de la familia. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Margarita Maza se distinguió por la caridad y ayuda que brindaba a los que tenían menos oportunidades, asimismo, fue una mujer de carácter sólido pues, a pesar de todos los obstáculos presentados, siempre apoyó la causa de su esposo, Benito Juárez.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("En 1871 murió en su casa de campo en San Cosme.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //          GlobalFunctions.launchURL(
                          //            "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2022/05/Foro_MargaritaMazaParada.pdf");
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/archivo.png",
                              height: 45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Descarga",
                                  style: TextStyle(
                                      color: const Color(0xff9D2449),
                                      fontFamily: Utilidades.fontHelRegular,
                                      fontSize: Utilidades.sizeTitle3_2),
                                ),
                                Text(
                                  "Dossier foro “Margarita Maza Parada”",
                                  style: TextStyle(
                                      fontFamily: Utilidades.fontHelRegular,
                                      fontSize: Utilidades.sizeTitle3_2),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomFooter()
            ],
          ),
        ));
  }
}
