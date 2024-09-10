import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class AtanasioGarciaScreen extends StatefulWidget {
  const AtanasioGarciaScreen({Key? key}) : super(key: key);

  @override
  State<AtanasioGarciaScreen> createState() => _AtanasioGarciaScreenState();
}

class _AtanasioGarciaScreenState extends State<AtanasioGarciaScreen> {
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
                    "https://casadelaculturaoaxaca.com/images/head_galeria_AtanacioTapia.png",
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
                        "Galería “Atanacio García Tapia”",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Esta galería se encuentra en el segundo patio de la Casa de la Cultura Oaxaqueña. Fue nombrada así en honor al artista plástico nacido en Yolomécatl, Teposcolula, Oaxaca.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "La galería que lleva su nombre está destinada a exposiciones de los trabajos de quienes participan en los talleres de artes plásticas de la institución y para artistas que inician su trayectoria profesional. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Atanacio García Tapia fue alumno, maestro y director del Taller de Artes Plásticas “Rufino Tamayo”, fundado en 1974 en Oaxaca de Juárez. También estudió en la Escuela de Bellas Artes de la Universidad Autónoma Benito Juárez de Oaxaca.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "En 1983, el artista oaxaqueño, obtuvo el Premio Nacional de Grabado, en la Bienal Gráfica, organizada por el Instituto Nacional de Bellas Artes (INBA) y destacó entre 300 grabadores mexicanos con su obra “Fertilidad II”. ",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //     GlobalFunctions.launchURL(
                          //       "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2022/05/Galeria_AtanacioGarciaTapia.pdf");
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
                                  "Dossier galería “Atanacio García Tapia”",
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
