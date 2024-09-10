import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';

class ColumnEspacios1 extends StatefulWidget {
  const ColumnEspacios1({Key? key}) : super(key: key);

  @override
  State<ColumnEspacios1> createState() => _ColumnEspacios1State();
}

class _ColumnEspacios1State extends State<ColumnEspacios1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 7.5;
    double _widhtImage = (size.width - (_width * 2));
    return Padding(
      padding: EdgeInsets.only(left: _width, right: _width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                        Utilidades.index = 0;
                    Utilidades.index2 = 1;
                  });
                      context.vRouter.to('/rufino');
                },
                child: ImageNetwork(
                  imagen:
                      "https://casadelaculturaoaxaca.com/assets/assets/images/espacios1.png",
                  widthImage: _widhtImage,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Galería",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "“Rufino Tamayo”",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                        Utilidades.index = 0;
                      Utilidades.index2 = 1;
                    });
                      context.vRouter.to('/alfonso');
                  },
                  child: ImageNetwork(
                    imagen:
                        "https://casadelaculturaoaxaca.com/assets/assets/images/espacios2.png",
                    widthImage: _widhtImage,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Galería",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.sizeTitle3_2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "“Alfonso Rivas”",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.sizeTitle3_2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                        Utilidades.index = 0;
                    Utilidades.index2 = 1;
                  });
                      context.vRouter.to('/atanasio');
                },
                child: ImageNetwork(
                  imagen:
                      "https://casadelaculturaoaxaca.com/assets/assets/images/espacios3.png",
                  widthImage: _widhtImage,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Galería",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "“Atanacio García Tapia”",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                        Utilidades.index = 0;
                    Utilidades.index2 = 1;
                  });
                      context.vRouter.to('/margarita');
                },
                child: ImageNetwork(
                  imagen:
                      "https://casadelaculturaoaxaca.com/assets/assets/images/espacios4.png",
                  widthImage: _widhtImage,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Foro",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.sizeTitle3_2),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "“Margarita Maza Parada”",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                        Utilidades.index = 0;
                      Utilidades.index2 = 1;
                    });
                      context.vRouter.to('/arcelia');
                  },
                  child: ImageNetwork(
                    imagen:
                        "https://casadelaculturaoaxaca.com/assets/assets/images/espacios5.png",
                    widthImage: _widhtImage,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Sala",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.sizeTitle3_2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "“Arcelia Yañiz”",
                  style: TextStyle(
                      fontFamily: Utilidades.fontHelBold,
                      fontSize: Utilidades.sizeTitle3_2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                        Utilidades.index = 0;
                    Utilidades.index2 = 1;
                  });
                      context.vRouter.to('/andres');
                },
                child: ImageNetwork(
                  imagen:
                      "https://casadelaculturaoaxaca.com/assets/assets/images/espacios6.png",
                  widthImage: _widhtImage,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Sala",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "“Andrés Henestrosa”",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3_2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
