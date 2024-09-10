
import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/exposiciones.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class AnterioresScreen extends StatefulWidget {
  const AnterioresScreen({Key? key}) : super(key: key);

  @override
  State<AnterioresScreen> createState() => _AnterioresScreenState();
}

class _AnterioresScreenState extends State<AnterioresScreen>
    with SingleTickerProviderStateMixin {
  late final Future? myFuture = getExposiciones();

  List<Exposiciones> exposiciones = [];
  late Response response;
  var dio = Dio();
  late final String url;

  Future getExposiciones() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getExposAnteriores'
        });
    final result = response.data;
      Iterable list = result['exposiciones'];
    var expo = list.map((exposicion) => Exposiciones.fromJson(exposicion)).toList();
    setState(() {
      exposiciones = expo;
    });
    return expo;
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
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width),
                      child: responsive == false ? Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ...exposiciones.map(buildSingleColumn).toList(),
                        ],
                      ) : Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ...exposiciones.map(buildSingleColumn2).toList(),
                        ],
                      ),
                    ),
                    const CustomFooter()
                  ],
                )
              : Center(
                  child: Image.asset(
                    "assets/logos/Logo_cco_2a.gif",
                    height: 100,
                  ),
                );
        },
      ),
    );
  }

  Widget buildSingleColumn(Exposiciones exposiciones) =>
      buildColumn(exposiciones: exposiciones);

  Widget buildColumn({required Exposiciones exposiciones}) => InkWell(
        onTap: () {
          setState(() {
           Utilidades.index = 2;
           context.vRouter.to('/detalleExposicion/' + exposiciones.idImagenes);
          });
        },
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exposiciones.fechaInicio +
                          " | " +
                          exposiciones.fechaTermino,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.sizeTitle5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: Utilidades.anchoTituloActuales,
                        child: Text(exposiciones.nombre,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.sizeTitle2)),
                      ),
                    ),
                    SizedBox(
                      width: Utilidades.anchoTituloActuales,
                      child: Text(exposiciones.artista,
                          style: TextStyle(
                              fontFamily: Utilidades.fontHelMedium,
                              fontSize: Utilidades.sizeTitle4)),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                ImageNetwork(
                    imagen: exposiciones.miniatura,
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

      
  Widget buildSingleColumn2(Exposiciones exposiciones) =>
      buildColumn2(exposiciones: exposiciones);

  Widget buildColumn2({required Exposiciones exposiciones}) => InkWell(
        onTap: () {
          setState(() {
           Utilidades.index = 2;
           context.vRouter.to('/detalleExposicion/' + exposiciones.idImagenes);
          });
        },
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                ImageNetwork(
                    imagen: exposiciones.miniatura,
                    widthImage: Utilidades.anchoImagenActuales),
                    Text(
                      exposiciones.fechaInicio +
                          " | " +
                          exposiciones.fechaTermino,
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelBold,
                          fontSize: Utilidades.sizeTitle5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: Utilidades.anchoImagenActuales,
                        child: Text(exposiciones.nombre,
                            style: TextStyle(
                                fontFamily: Utilidades.fontHelBold,
                                fontSize: Utilidades.sizeTitle2 - 3)),
                      ),
                    ),
                    SizedBox(
                      width: Utilidades.anchoImagenActuales,
                      child: Text(exposiciones.artista,
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
