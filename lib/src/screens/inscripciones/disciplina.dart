import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/inscripciones/responsive/disciplina_vertical.dart';
import 'package:micrositio_cco/src/screens/inscripciones/responsive/disciplina_widget.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class DisciplinaScreen extends StatefulWidget {
  const DisciplinaScreen({Key? key}) : super(key: key);

  @override
  State<DisciplinaScreen> createState() => _DisciplinaScreenState();
}

class _DisciplinaScreenState extends State<DisciplinaScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool responsive = false;

    if (size.width <= 844) {
      setState(() {
        responsive = true;
      });
    } else {
      setState(() {
        responsive == false;
      });
    }

    if (responsive == false) {
      setState(() {
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
      });
    } else {
      setState(() {
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
      });
    }
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            left: Utilidades.leftGeneral, right: Utilidades.rightGeneral),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            child: Text(
              "Talleres Artísticos ",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "CUATRIMESTRE MARZO - JUNIO DE 2023",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle2,
                  color: const Color(0xff666666)),
            ),
          ),
          Text(
            "Las cuotas cuatrimestrales se establecen de acuerdo al tabulador contenido en la Ley Estatal de Derechos de Oaxaca, Titulo 3o., Capítulo VII, Art. 31 decreto número 10 aprobado por la LXV Legislatura el 09-12-21 y publicado en el Periódico Oficial del Estado número 51 Décimo Sexta Sección del 18-12-21; se calculan con base a la Unidad de Medida y Actualización (UMA) vigente.",
            style: TextStyle(
                fontFamily: Utilidades.fontHelBold,
                fontSize: Utilidades.fontSizeTitle3,
                height: 1.5),
          ),
          const SizedBox(
            height: 45,
          ),
          Center(
            child: Text(
              "Selecciona el campo artístico de tu interés",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle3 + 3),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          responsive == false
              ? const DisciplinaWidget()
              : const DisciplinaVertical()
        ],
      ),
    );
  }
}
