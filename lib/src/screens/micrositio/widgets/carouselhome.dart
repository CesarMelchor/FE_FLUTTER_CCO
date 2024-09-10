import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetWorkCarrusel.dart';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:vrouter/vrouter.dart';



class CarouselHome extends StatefulWidget {
  const CarouselHome({Key? key}) : super(key: key);

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  late final Future? myFuture = generateListImagenes();
  List<Imagenes> imagenes = [];
  late Response response;
  var dio = Dio();

  Future generateListImagenes() async {
    
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/public/fast_query',
        queryParameters: {
          'consulta' : 'getImagesHome'
        });
    final result = response.data;
    Iterable list = result['imagenes'];
    var imas = list.map<Imagenes>((json) => Imagenes.fromJson(json)).toList();
    setState(() {
      imagenes = imas;
    });
    return imas;
  }

  CarouselController buttonCarouselController2 = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imagenes
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                            if (item.descripcion == 'Externo') {
                          GlobalFunctions.launchURL(item.pathlink);
                            } 
                            if (item.descripcion == 'Interno') {
                            context.vRouter.to(item.pathlink);
                            }
                        },
                        child: ImageNetworkCarrusel(
                          imagen: item.pathimagen,
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    return FutureBuilder(
      future: myFuture,
      builder: ((context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController2,
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 6 / 2,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 6)),
                    items: imageSliders,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () {
                            buttonCarouselController2.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              buttonCarouselController2.nextPage(
                                  duration: const Duration(milliseconds: 300),
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
      }),
    );
  }
}
