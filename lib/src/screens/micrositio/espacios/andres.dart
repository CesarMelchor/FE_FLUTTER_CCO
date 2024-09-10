import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class AndresHenestrosaScreen extends StatefulWidget {
  const AndresHenestrosaScreen({Key? key}) : super(key: key);

  @override
  State<AndresHenestrosaScreen> createState() => _AndresHenestrosaScreenState();
}

class _AndresHenestrosaScreenState extends State<AndresHenestrosaScreen> {
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
                    "https://casadelaculturaoaxaca.com/images/head_salaHenestrosa.png",
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
                        "Sala “Andrés Henestrosa”",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Esta sala de la Casa de la Cultura Oaxaqueña lleva el nombre del poeta, narrador, ensayista, orador, historiador, quien nació en Ixhuatán, Oaxaca, el 30 de noviembre de 1906. Este espacio es ocupado para la realización de actividades artísticas y culturales como presentaciones y recitales, por mencionar algunos.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Andrés Henestrosa tuvo una labor crítica; durante muchos años escribió ensayos, artículos y relatos, dispersos en las páginas de revistas y periódicos o como prólogos y contribuciones a diversos libros.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "En 1929 publicó Los hombres que dispersó la danza donde recreó e inventó, en prosa llena de brío y eficacia narrativa, cuentos y leyendas de su tierra zapoteca, tomados del acervo popular. ",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "En 1936 fue becado por la Fundación Guggenheim de Nueva York para realizar estudios acerca de la significación de la cultura zapoteca en América. ",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Fonetizó el idioma zapoteco, preparó el alfabeto y un breve diccionario zapoteca-castellano, en el que ese alfabeto se puso en práctica.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //  GlobalFunctions.launchURL(
                          //    "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2022/05/Sala_AndresHenestrosa.pdf");
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
                                  "Dossier sala “Andrés Henestrosa”",
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
