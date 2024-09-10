import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';

class ColumnScreen1 extends StatefulWidget {
  const ColumnScreen1({Key? key}) : super(key: key);

  @override
  State<ColumnScreen1> createState() => _ColumnScreen1State();
}

class _ColumnScreen1State extends State<ColumnScreen1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 1.1;
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                  context.vRouter.to('/home/0/1/0');
            
              },
              child: ImageNetwork(
                imagen: "https://casadelaculturaoaxaca.com/images/acerca.png",
                widthImage: _width,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "¿QUIÉNES SOMOS?",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle3),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: _width,
              child: Text(
                  "Desde 1954 se inicia con el proyecto nacional para las Casas de la Cultura en el Instituto Nacional de Bellas Artes.",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 78, 78, 78),
                      fontFamily: Utilidades.fontHelRegular,
                      fontSize: Utilidades.sizeTitle4),
                  textAlign: TextAlign.center),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.vRouter.to('/home/1/0/0');
                },
                child: ImageNetwork(
                  imagen:
                      "https://casadelaculturaoaxaca.com/images/espacios.png",
                  widthImage: _width,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "ESPACIOS",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle3),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: _width,
                child: Text(
                    "Conoce los espacios que la Casa de la Cultura tiene para presentaciones y exposiciones.",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 78, 78, 78),
                        fontFamily: Utilidades.fontHelRegular,
                        fontSize: Utilidades.sizeTitle4),
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                  context.vRouter.to('/home/0/2/0');
             
              },
              child: ImageNetwork(
                imagen: "https://casadelaculturaoaxaca.com/images/visita.png",
                widthImage: _width,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "VISITA",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.sizeTitle3),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: _width,
              child: Text(
                "¡Bienvenido a nuestra casa! Sigue los lineamientos de los protocolos para garantizar la salud.",
                style: TextStyle(
                    color: const Color.fromARGB(255, 78, 78, 78),
                    fontFamily: Utilidades.fontHelRegular,
                    fontSize: Utilidades.sizeTitle4),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
