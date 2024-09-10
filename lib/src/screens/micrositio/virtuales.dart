import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/virtuales.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class VirtualesScreen extends StatefulWidget {
  const VirtualesScreen({Key? key}) : super(key: key);

  @override
  State<VirtualesScreen> createState() => _VirtualesScreenState();
}

class _VirtualesScreenState extends State<VirtualesScreen>
    with SingleTickerProviderStateMixin {
  List<Virtuales> virtuales = [];

  late Response response;
  var dio = Dio();

  Future generateListExposiciones() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getExposVirtuales'
        });
    final result = response.data;
    Iterable list = result['exposiciones'];
    virtuales =
        list.map<Virtuales>((json) => Virtuales.fromJson(json)).toList();

    return virtuales;
  }

  double anchoTotal = 0;
  double altoTotal = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthContainer = 0;
    double heightContainer = 0;

    if (size.width <= 844) {
      setState(() {
        anchoTotal = size.width;
        altoTotal = size.height;
        widthContainer = (anchoTotal / 3) * 2.5;
        heightContainer = (altoTotal / 4) * 1.8;
      });
    } else {
      setState(() {
        anchoTotal = size.width;
        altoTotal = size.height;
        widthContainer = anchoTotal / 4.5;
        heightContainer = altoTotal / 3;
      });
    }
    return Scaffold(
        body: ListView(
          children: [
            FutureBuilder(
      future: generateListExposiciones(),
      builder: (context, snapshot) {
            return snapshot.hasData
                ? Column(
                  children: [
                    const SizedBox(height: 30,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size.width / 10),
                      child: Column(
                        children: [
                          SizedBox(
                             width: size.width - ((size.width / 10) * 2),
                            child: ResponsiveGridList(
                              horizontalGridSpacing: 10,
                              rowMainAxisAlignment: MainAxisAlignment.center,
                              minItemWidth: 200,
                              minItemsPerRow: 1,
                              maxItemsPerRow: 4,
                              listViewBuilderOptions: ListViewBuilderOptions(
                                controller: ScrollController(),
                                shrinkWrap: true
                              ),
                              children: virtuales
                                  .map((item) => SizedBox(
                                        width: widthContainer,
                                        height: heightContainer,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              Utilidades.index = 2;
                                              Utilidades.index3 = 2;
                                            });
                                            context.vRouter.to(
                                                '/detalleVirtual/' + item.numero);
                                          },
                                          child: Column(
                                            children: [
                                              ImageNetwork(
                                                  imagen: item.imagenMiniatura,
                                                  widthImage: widthContainer),
                                              const SizedBox(
                                                height: 9,
                                              ),
                                              SizedBox(
                                                  width: widthContainer,
                                                  child: Text(item.numeroText,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Utilidades.rosa,
                                                          fontFamily: Utilidades
                                                              .fontHelBold,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              1))),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                  width: widthContainer,
                                                  child: Text(item.fecha,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelRegular,
                                                          fontSize: Utilidades
                                                              .sizeTitle5))),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                  width: widthContainer,
                                                  child: Text(item.nombre,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelBold,
                                                          fontSize: Utilidades
                                                                  .sizeTitle4 -
                                                              1))),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                  width: widthContainer,
                                                  child: Text(item.artista,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontFamily: Utilidades
                                                              .fontHelRegular,
                                                          fontSize: Utilidades
                                                              .sizeTitle5))),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
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
          ],
        ));
  }
}
