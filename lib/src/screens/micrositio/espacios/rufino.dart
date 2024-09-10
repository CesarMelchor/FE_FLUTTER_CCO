import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class RufinoTamayoScreen extends StatefulWidget {
  const RufinoTamayoScreen({Key? key}) : super(key: key);

  @override
  State<RufinoTamayoScreen> createState() => _RufinoTamayoScreenState();
}

class _RufinoTamayoScreenState extends State<RufinoTamayoScreen> {
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
                    "https://casadelaculturaoaxaca.com/images/head_galeria_RufinoTamayo.png",
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
                        "Galería “Rufino Tamayo”",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.sizeTitle2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Es la principal sala de exhibición de la Casa de la Cultura Oaxaqueña, destinada a exposiciones de artes plásticas con artistas que tienen una amplia trayectoria en el estado de Oaxaca.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "En este espacio se han presentado exposiciones de artistas oaxaqueños reconocidos como: Rufino Tamayo, Rodolfo Morales, Francisco Toledo, entre otros.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelRegular,
                            fontSize: Utilidades.sizeTitle3_2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "La galería fue habilitada en el año de 1982 con motivo de la Primera Bienal “Rufino Tamayo” y fue nombrada así en honor al reconocido pintor oaxaqueño.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Tamayo, es uno de los pintores mexicanos más reconocidos a nivel mundial, fue quien a lo largo del siglo XX pudo conjugar su herencia mexicana y el arte prehispánico con las vanguardias internacionales, en piezas marcadas por el color, la perspectiva, la armonía y la textura.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "A lo largo de su trayectoria artística pintó más de mil 300 óleos; realizó 465 obras gráficas, como litografías y mixografías; 350 dibujos, 20 murales, así como un vitral.",
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelRegular,
                              fontSize: Utilidades.sizeTitle3_2),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //        GlobalFunctions.launchURL(
                          //          "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2022/09/Galeria_RufinoTamayo.pdf");
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
                                  "Dossier galería “Rufino Tamayo”",
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
