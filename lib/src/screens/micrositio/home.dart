import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/aniversario.dart';
import 'package:micrositio_cco/src/screens/micrositio/cartelera_home.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios.dart';
import 'package:micrositio_cco/src/screens/micrositio/exposiciones.dart';
import 'package:micrositio_cco/src/screens/micrositio/inicio.dart';
import 'package:micrositio_cco/src/screens/micrositio/inscripciones.dart';
import 'package:micrositio_cco/src/screens/micrositio/podcast.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';
import 'package:splash_view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SplashView(
          backgroundImageDecoration: const BackgroundImageDecoration(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/listones.png")),
          backgroundColor: Colors.white,
          logo: Image.asset(
            "assets/logos/logo_cco_2a.gif",
            width: size.width / 3.5,
          ),
          done: Done(
            const HomeScreen(),
            animationDuration: const Duration(milliseconds: 700),
          )),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = int.parse(context.vRouter.pathParameters['id'].toString());

    Size size = MediaQuery.of(context).size;
    double _width = size.width / 5.8;
    _tabController.index = index;
    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(40.0)
            : const Size.fromHeight(40.0),
        child: AppBar(
            iconTheme: const IconThemeData(color: Color(0xff9D2449)),
            backgroundColor: const Color(0xfff6f1f6),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                responsive == false
                    ? Text("Micrositio de la Casa de la Cultura Oaxaqueña",
                        style: TextStyle(
                          color: const Color(0xff666666),
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle4,
                        ))
                    : Container(
                        width: 1,
                      ),
                responsive == true
                    ? Expanded(child: Container())
                    : Container(
                        width: 25,
                      ),
                const Image(
                  width: 15,
                  image: Svg('assets/svg/telefono.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 5),
                  child: InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(Utilidades.urlPhone);
                    },
                    child: Text("951 516 11 54",
                        style: TextStyle(
                          color: const Color(0xff666666),
                          fontFamily: Utilidades.fontHelRegular,
                          fontSize: Utilidades.sizeTitle4,
                        )),
                  ),
                ),
                InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(Utilidades.urlMail);
                    },
                    child: const Image(
                      width: 25,
                      image: Svg('assets/svg/mail.svg'),
                    )),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Síguenos",
                      style: TextStyle(
                        color: const Color(0xff666666),
                        fontFamily: Utilidades.fontHelRegular,
                        fontSize: Utilidades.sizeTitle4,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlFacebook);
                      },
                      child: const Image(
                        width: 20,
                        image: Svg('assets/svg/facebook.svg'),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlInstagram);
                      },
                      child: const Image(
                        width: 20,
                        image: Svg('assets/svg/instagram.svg'),
                      )),
                ),
                InkWell(
                    onTap: () {
                      GlobalFunctions.launchURL(Utilidades.urlTwitter);
                    },
                    child: const Image(
                      width: 20,
                      image: Svg('assets/svg/twitter.svg'),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: _width),
                  child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(Utilidades.urlYoutube);
                      },
                      child: const Image(
                        width: 20,
                        image: Svg('assets/svg/youtube.svg'),
                      )),
                ),
              ],
            )),
      ),
      body: Column(
        children: <Widget>[
          responsive == false
              ? Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        if (_tabController.index > 0) {
                          _tabController.animateTo(_tabController.index - 1);
                        }
                      },
                    ),
                    Expanded(
                      child: TabBar(
                        indicatorWeight: 5,
                        indicatorColor: Utilidades.rosa,
                        isScrollable: true,
                        controller: _tabController,
                        labelStyle: const TextStyle(color: Colors.black),
                        unselectedLabelColor: Colors.black,
                        labelColor: Utilidades.rosa,
                        tabs: [
                          Tab(
                            child: Text(
                              "INICIO",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "ESPACIOS",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "EXPOSICIONES",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "CARTELERA",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "ANIVERSARIO",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "PODCAST",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "INSCRIPCIONES",
                              style: TextStyle(
                                  fontFamily: Utilidades.fontHelMedium,
                                  fontSize: Utilidades.sizeTitle3_A,
                                  color: Utilidades.grisFooter),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        if (_tabController.index + 1 < 10) {
                          _tabController.animateTo(_tabController.index + 1);
                        }
                      },
                    ),
                  ],
                )
              : TabBar(
                  indicatorWeight: 5,
                  indicatorColor: Utilidades.rosa,
                  isScrollable: true,
                  controller: _tabController,
                  labelStyle: const TextStyle(color: Colors.black),
                  unselectedLabelColor: Colors.black,
                  labelColor: Utilidades.rosa,
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.dashboard),
                    ),
                    Tab(
                      icon: Icon(Icons.category),
                    ),
                    Tab(
                      icon: Icon(Icons.event_available),
                    ),
                    Tab(
                      icon: Icon(Icons.celebration),
                    ),
                    Tab(
                      icon: Icon(Icons.podcasts),
                    ),
                    Tab(
                      icon: Icon(Icons.school),
                    )
                  ],
                ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                InicioScreen(),
                Espacios(),
                ExposicionesScreen(),
                CarteleraHomeScreen(),
                AniversarioScreen(),
                Podcast(),
                Inscripciones(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
