import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/aniversarios.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class AniversarioScreen extends StatefulWidget {
  const AniversarioScreen({Key? key}) : super(key: key);

  @override
  State<AniversarioScreen> createState() => _AniversarioScreenState();
}

class _AniversarioScreenState extends State<AniversarioScreen>
    with SingleTickerProviderStateMixin {
  List<Aniversarios> aniversarios = [];

  late Response response;
  var dio = Dio();

  Future generateListAniversarios() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getAniversarios',
        });
    final result = response.data;
    Iterable list = result['aniversarios'];
    aniversarios = list.map<Aniversarios>((json) => Aniversarios.fromJson(json)).toList();

    return aniversarios;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 11;
    double _width2 = size.width / 3;
    double _width3 = size.width / 4;
    bool responsive = false;
    if (size.width <= 844) {
      setState(() {
        responsive = true;
        Utilidades.anchoImagenActuales = size.width - (_width * 2);
      });
    } else {
      setState(() {
        responsive = false;
        Utilidades.anchoTituloActuales = _width2;
        Utilidades.anchoImagenActuales = _width3;
      });
    }

    return Scaffold(
        body: FutureBuilder(
          future: generateListAniversarios(),
          builder: (context, snapshot) {
            return snapshot.hasData ? 
            ListView(
              children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width),
            child: responsive == false ? Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ...aniversarios.map(buildSingleColumn).toList(),
              ],
            ) : Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ...aniversarios.map(buildSingleColumn2).toList(),
              ],
            ),
          ),
          const CustomFooter()
              ],
            )
            :
            Center(
                child: Image.asset(
                  "assets/logos/Logo_cco_2a.gif",
                  height: 100,
                ),
              );
          },
        ));
  }

  Widget buildSingleColumn(Aniversarios aniversarios) =>
      buildColumn(aniversarios: aniversarios);

  Widget buildColumn({required Aniversarios aniversarios}) => InkWell(
        onTap: () {
          setState(() {
            Utilidades.index = 4;
          });
          context.vRouter.to('/detalleAniversario/' + aniversarios.numero);
        },
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aniversarios.fechaInicio +
                          " | " +
                          aniversarios.fechaTermino,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.sizeTitle5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: Utilidades.anchoTituloActuales,
                        child: Text(aniversarios.numero + " aniversario",
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.sizeTitle2)),
                      ),
                    ),
                    SizedBox(
                      width: Utilidades.anchoTituloActuales,
                      child: Text(aniversarios.nombre,
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4)),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                ImageNetwork(
                    imagen: aniversarios.miniatura,
                    widthImage: Utilidades.anchoImagenActuales)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Divider(
                thickness: 2,
                color: Utilidades.grisFooter,
              ),
            ),
          ],
        ),
      );


      
  Widget buildSingleColumn2(Aniversarios aniversarios) =>
      buildColumn2(aniversarios: aniversarios);

  Widget buildColumn2({required Aniversarios aniversarios}) => InkWell(
        onTap: () {
          setState(() {
            Utilidades.index = 4;
          });
          context.vRouter.to('/detalleAniversario/' + aniversarios.numero);
        },
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                ImageNetwork(
                    imagen: aniversarios.miniatura,
                    widthImage: Utilidades.anchoImagenActuales),
                    Text(
                      aniversarios.fechaInicio +
                          " | " +
                          aniversarios.fechaTermino,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.sizeTitle5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: Utilidades.anchoImagenActuales,
                        child: Text(aniversarios.numero + " aniversario",
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.sizeTitle2)),
                      ),
                    ),
                    SizedBox(
                      width: Utilidades.anchoImagenActuales,
                      child: Text(aniversarios.nombre,
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4)),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Divider(
                thickness: 2,
                color: Utilidades.grisFooter,
              ),
            ),
          ],
        ),
      );
}
