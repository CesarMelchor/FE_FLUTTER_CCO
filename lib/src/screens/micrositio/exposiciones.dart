import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/actuales.dart';
import 'package:micrositio_cco/src/screens/micrositio/anteriores.dart';
import 'package:micrositio_cco/src/screens/micrositio/virtuales.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';


class ExposicionesScreen extends StatefulWidget {
  const ExposicionesScreen({Key? key}) : super(key: key);

  @override
  State<ExposicionesScreen> createState() => _ExposicionesScreenState();
}

class _ExposicionesScreenState extends State<ExposicionesScreen> with TickerProviderStateMixin {
  late TabController _tabControllerExposiciones;
  @override
  void initState() {
    _tabControllerExposiciones = TabController(length: 3, vsync: this);
    super.initState();
  }
  
  @override
  void dispose() {
    _tabControllerExposiciones.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    
    int subindex = int.parse(context.vRouter.pathParameters['sub2'].toString());

    _tabControllerExposiciones.index = subindex;
    return Scaffold(
body: Column(
      children: <Widget>[
        Row(
          children: [
            Container(width: 45,),
            Expanded(
              child: TabBar(
                indicatorWeight: 5,
                indicatorColor: Utilidades.rosa,
                isScrollable: true,
                controller: _tabControllerExposiciones,
                labelStyle: const TextStyle(color: Colors.black),
                unselectedLabelColor: Colors.black,
                labelColor: Utilidades.rosa,
                tabs: [
                  Tab(
                    child: Text(
                      "Actuales",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Anteriores",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Virtuales",
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
            controller: _tabControllerExposiciones,
            children: const [
              ActualesScreen(),
              AnterioresScreen(),
              VirtualesScreen(),
            ],
          ),
        ),
      ],
    )
    );
  }

  

}
