import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_visita1.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_visita2.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class VisitaScreen extends StatefulWidget {
  const VisitaScreen({Key? key}) : super(key: key);

  @override
  State<VisitaScreen> createState() => _VisitaScreenState();
}

class _VisitaScreenState extends State<VisitaScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;
    bool responsive = false;
    if (size.width <= 844) {
      setState(() {
        responsive = true;
      });
    } else {
      setState(() {
        responsive = false;
      });
    }
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Visita",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelBold,
                    fontSize: Utilidades.sizeTitle2),
              ),
              const SizedBox(
                height: 20,
              ),
              responsive == false ?
              const CuerpoVisita1() : const CuerpoVisita2()
            ],
          ),
        ),
        const CustomFooter()
      ],
    ));
  }
}
