import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';


class RowScreen1 extends StatefulWidget {
  const RowScreen1({Key? key}) : super(key: key);

  @override
  State<RowScreen1> createState() => _RowScreen1State();
}

class _RowScreen1State extends State<RowScreen1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width - ((size.width / 11) * 2);
    double _widhtImage = _width / 3.2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                widthImage: _widhtImage,
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
              width: _widhtImage,
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
                  widthImage: _widhtImage,
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
                width: _widhtImage,
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
                widthImage: _widhtImage,
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
              width: _widhtImage,
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
