import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class ArceliaScreen extends StatefulWidget {
  const ArceliaScreen({Key? key}) : super(key: key);

  @override
  State<ArceliaScreen> createState() => _ArceliaScreenState();
}

class _ArceliaScreenState extends State<ArceliaScreen> {
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
                    "https://casadelaculturaoaxaca.com/images/head_salaYaniz.png",
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
                        "Sala “Arcelia Yañiz”",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Este espacio de la Casa de la Cultura Oaxaqueña es ocupado para la realización de diversas actividades culturales como recitales de música, presentaciones de libros y audiovisuales.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lleva el nombre de Arcelia Yañiz, en honor a la poeta, periodista, promotora cultural, funcionaria, quien también fue directora de la Red Estatal de Bibliotecas. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "La vida de Arcelia Yañiz estuvo enlazada en forma indisoluble con la cultura artística oaxaqueña. Maestra de múltiples generaciones de actores y declamadores e impulsora de jóvenes creadores en todos los géneros del arte.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Durante la Guerra Civil Española, fue integrante del Comité de Ayuda a España que apoyó a los inmigrantes exiliados. Desde muy joven inició su tránsito por el periodismo, tanto en su ciudad natal como en diarios de Puebla y Guadalajara.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Fundó la revista de Bellas Artes, el periódico Oaxaca Gráfico y de 1968 a 1973 editó y dirigió la revista Síntesis Gráfica. También fue merecedora de la Medalla Magdalena Mondragón otorgada por mujeres periodistas de la Universidad Nacional Autónoma de México por 50 años de periodismo. ",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //   GlobalFunctions.launchURL(
                          //     "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2022/05/Sala_ArceliaYaniz-1.pdf");
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
                                  "Dossier sala “Arcelia Yañiz”",
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
