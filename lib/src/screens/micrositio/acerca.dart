import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class Acerca extends StatefulWidget {
  const Acerca({Key? key}) : super(key: key);

  @override
  State<Acerca> createState() => _AcercaState();
}

class _AcercaState extends State<Acerca> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
    padding: EdgeInsets.only(left: _width, right: _width),
            child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
            const SizedBox(height: 50,),
     Text("Misión", style: TextStyle(fontFamily: Utilidades.fontHelBold, fontSize: Utilidades.sizeTitle2),),
    const SizedBox(height: 15,),
     Text("Promover las manifestaciones artísticas y culturales a través de la difusión y fomento de la enseñanza y actividades que impulsen la libre expresión cultural, estimulando los trabajos de creación, investigación, científicos, literarios y artísticos. Contribuyendo así a la formación integral de individuos con capacidad crítica y sensible ante la diversidad de su entorno cultural.", 
    textAlign: TextAlign.justify,
    style: TextStyle(fontFamily: Utilidades.fontHelRegular, fontSize: Utilidades.sizeTitle3),),
    Container(height: 15,),
     Text("Visión",style: TextStyle(fontFamily: Utilidades.fontHelBold, fontSize: Utilidades.sizeTitle2),),
    const SizedBox(height: 15,),
     Text("Ser el espacio más importante de referencia en el ámbito cultural del Estado de Oaxaca para proyectar a nivel Nacional e Internacional, una perspectiva intercultural de las manifestaciones populares y artísticas de Oaxaca.", 
    textAlign: TextAlign.justify,style: TextStyle(fontFamily: Utilidades.fontHelRegular, fontSize: Utilidades.sizeTitle3_2),),
    Container(height: 400,),
    ],),
          ),
              const SizedBox(height: 30,),
  const CustomFooter()
        ],
      ),
    );
  }
}