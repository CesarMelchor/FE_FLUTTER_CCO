import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetWorkCarrusel.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:dio/dio.dart';

class CarouselPodcast extends StatefulWidget {
  const CarouselPodcast(this.carrusel, {Key? key}) : super(key: key);
  final String carrusel;

  @override
  State<CarouselPodcast> createState() => _CarouselPodcastState();
}

class _CarouselPodcastState extends State<CarouselPodcast>
    with SingleTickerProviderStateMixin {
  late Response response;
  var dio = Dio();
  String numero = "";

  List<Imagenes> imagenes = [];

  Future postImagenes(carrusel) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getImagesbyId',
          'id' : carrusel
        });
    final result = response.data;
    Iterable list = result['imagenes'];

    var imas = list.map<Imagenes>((json) => Imagenes.fromJson(json)).toList();
    setState(() {
      imagenes = imas;
    });
    return imas;
  }

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    late final Future? myFuture = postImagenes(widget.carrusel);

    Size size = MediaQuery.of(context).size;
    bool vacio = false;

    if (imagenes.isEmpty) {
      setState(() {
        vacio = true;
      });
    } else {
      setState(() {
        vacio = false;
      });
    }

    final List<Widget> imageSliders = imagenes
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            GlobalFunctions.launchURL(item.pathimagen);
                          },
                          child: ImageNetworkCarrusel(imagen: item.pathimagen)),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: const Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    return FutureBuilder(
      future: myFuture,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  vacio == true
                      ? SizedBox(
                          width: size.width / 2,
                          height: size.height / 1.6,
                          child: const Center(
                              child: Text("Sin contenido disponible")))
                      : CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                              autoPlay: false,
                              aspectRatio: 4.5 / 1.8,
                              enlargeCenterPage: true,
                              autoPlayInterval: const Duration(seconds: 4)),
                          items: imageSliders,
                        ),
                  vacio == true
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                                onPressed: () {
                                  buttonCarouselController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    buttonCarouselController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              )
            : Center(
                child: Image.asset(
                  "assets/logos/Logo_cco_2a.gif",
                  height: 100,
                ),
              );
      },
    );
  }
}
