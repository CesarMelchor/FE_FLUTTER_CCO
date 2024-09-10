import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/episodios.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_podcast_1.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_podcast_2.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:dio/dio.dart';
import 'package:vrouter/vrouter.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> with SingleTickerProviderStateMixin {
  List<Episodios> episodios = [];

  late Response response;
  var dio = Dio();

  Future postEpisodios() async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getEpisodios',
        });
    final result = response.data;
    Iterable list = result['episodios'];
    episodios =
        list.map<Episodios>((json) => Episodios.fromJson(json)).toList();

    return episodios;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 5.8;
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
          FutureBuilder(
            future: postEpisodios(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Column(
                      children: [
                        ImageNetwork(
                            imagen:
                                "https://casadelaculturaoaxaca.com/images/head_farolito.png",
                            widthImage: size.width),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: _width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              responsive == false
                                  ? const RowPodcast1()
                                  : const ColumnPodcast1(),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Un espacio para toda la familia donde el arte y la cultura convergen, realizado por Casa de la Cultura Oaxaqueña.",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelRegular,
                                    fontSize: Utilidades.sizeTitle3_2),
                              ),
                              Container(
                                height: 30,
                              ),
                              Text(
                                "Un podcast para toda la familia.",
                                style: TextStyle(
                                    fontFamily: Utilidades.fontHelRegular,
                                    fontSize: Utilidades.sizeTitle3),
                              ),
                              Container(
                                height: 50,
                              ),
                              SizedBox(
                                width: size.width - ((size.width / 10) * 2),
                                child: ResponsiveGridList(
                                  horizontalGridSpacing: 100,
                                  rowMainAxisAlignment: MainAxisAlignment.center,
                                  minItemWidth: 200,
                                  minItemsPerRow: 1,
                                  maxItemsPerRow: 4,
                                  listViewBuilderOptions: ListViewBuilderOptions(
                                    controller: ScrollController(),
                                    shrinkWrap: true
                                  ),
                                  children: episodios
                                      .map((item) => SizedBox(
                                            width: 220,
                                            height: 350,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Utilidades.index = 5;
                                                          context.vRouter
                                                              .to('/episodio/' + item.id);
                                                        });
                                                      },
                                                      child: ImageNetwork(
                                                          imagen: item.rutaimagen,
                                                          widthImage: 220)),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                    width: 220,
                                                    child: Text(
                                                      "Episodio " + item.id,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              Utilidades.fontHelBold,
                                                          fontSize:
                                                              Utilidades.sizeTitle3),
                                                    )),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                    width: 220,
                                                    child: Text(item.titulo,
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                            fontFamily: Utilidades
                                                                .fontHelRegular,
                                                            fontSize: Utilidades
                                                                .sizeTitle3))),
                                                SizedBox(
                                                  width: 220,
                                                  child: Text(
                                                    item.descripcion,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                            const Color(0xff666666),
                                                        fontFamily:
                                                            Utilidades.fontHelRegular,
                                                        fontSize:
                                                            Utilidades.sizeTitle4),
                                                    maxLines: 2,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
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
      ),
    );
  }
}
