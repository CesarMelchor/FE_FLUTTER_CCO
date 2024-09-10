import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/acerca.dart';
import 'package:micrositio_cco/src/screens/micrositio/principal.dart';
import 'package:micrositio_cco/src/screens/micrositio/visita.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';


class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen>
    with TickerProviderStateMixin {
  late TabController _tabController2;
  @override
  void initState() {
    _tabController2 = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    int subindex = int.parse(context.vRouter.pathParameters['sub'].toString());
    _tabController2.index = subindex;

    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(width: 45,),
            Expanded(
              child: TabBar(
                indicatorWeight: 5,
                indicatorColor: Utilidades.rosa,
                isScrollable: true,
                controller: _tabController2,
                labelStyle: const TextStyle(color: Colors.black),
                unselectedLabelColor: Colors.black,
                labelColor: Utilidades.rosa,
                tabs: [
                  Tab(
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Acerca",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Visita",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 35,
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController2,
            children: const [
              PrincipalScreen(),
              Acerca(),
              VisitaScreen(),
            ],
          ),
        ),
      ],
    );
 
  }
}
