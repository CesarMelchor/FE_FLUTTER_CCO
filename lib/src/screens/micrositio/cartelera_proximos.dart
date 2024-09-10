import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/eventos.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:dio/dio.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';


class CarteleraProximosScreen extends StatefulWidget {
  const CarteleraProximosScreen({Key? key}) : super(key: key);

  @override
  State<CarteleraProximosScreen> createState() => _CarteleraProximosScreenState();
}

class _CarteleraProximosScreenState extends State<CarteleraProximosScreen> {
  List<Eventos> eventos = [];

  late Response response;
  var dio = Dio();

  Future generateListEventos() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getEventos',
        });
    final result = response.data;
    Iterable list = result['eventos'];
    eventos = list.map<Eventos>((json) => Eventos.fromJson(json)).toList();

    return eventos;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double ancho = size.width / 10;

    late double anchoTextos;
    if (ancho < 644) {
      anchoTextos = 300;
    } else {
      anchoTextos = size.width / 3.5;
    }

    return Scaffold(
        body: ListView(
          children: [
            FutureBuilder(
      future: generateListEventos(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData
                ? Column(
                  children: [
                  const SizedBox(height: 30,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ancho),
                      child: Column(
                        children: [
                          SizedBox(
                                width: size.width - ((size.width / 10) * 2),
                            child: eventos.isNotEmpty ?
                            ResponsiveGridList(
                              horizontalGridSpacing: 50,
                              verticalGridSpacing: 5,
                              rowMainAxisAlignment: MainAxisAlignment.center,
                              minItemWidth: 300,
                              minItemsPerRow: 1,
                              maxItemsPerRow: 3,
                              listViewBuilderOptions: ListViewBuilderOptions(
                                controller: ScrollController(),
                                shrinkWrap: true
                              ),
                              children: eventos
                                  .map((item) => SizedBox(
                                    height: size.height / 1.5,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                              cookie.set('idEvento', item.id, maxAge: const Duration(days: 1));
                                              Utilidades.idEvento = item.id;
                            context.vRouter.to('/detalleEvento/' + item.id);
                                            });
                                          },
                                          child: ImageNetwork(
                                            imagen: item.portada,
                                            widthImage: anchoTextos,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.tipoEvento,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle3_A,
                                                  color: Utilidades.rosa,
                                                  fontFamily: Utilidades
                                                      .fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.fechaInicio +
                                                  " | " +
                                                  item.horaInicio,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle5,
                                                  fontFamily: Utilidades
                                                      .fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.lugar,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 177, 177, 177),
                                                  fontSize:
                                                      Utilidades.sizeTitle5,
                                                  fontFamily: Utilidades
                                                      .fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.titulo,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle4,
                                                  fontFamily: Utilidades
                                                      .fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.presentador,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle4,
                                                  fontFamily: Utilidades
                                                      .fontHelMedium),
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: anchoTextos,
                                            child: Text(
                                              item.resennia,
                                              textAlign: TextAlign.left,
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontSize:
                                                      Utilidades.sizeTitle4 -
                                                          1,
                                                  fontFamily: Utilidades
                                                      .fontHelRegular),
                                            )),
                                      ],
                                    ),
                                  ))
                                  .toList(),
                            ) : Image.network("https://casadelaculturaoaxaca.com/images/cartelera/eventos_na.png",
                                              width: size.width - (ancho * 2)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
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
          ],
        ));
  }
}
