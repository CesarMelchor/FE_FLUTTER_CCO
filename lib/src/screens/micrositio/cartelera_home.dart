import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/cartelera_anteriores.dart';
import 'package:micrositio_cco/src/screens/micrositio/cartelera_proximos.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:vrouter/vrouter.dart';


class CarteleraHomeScreen extends StatefulWidget {
  const CarteleraHomeScreen({Key? key}) : super(key: key);

  @override
  State<CarteleraHomeScreen> createState() => _CarteleraHomeScreenState();
}

class _CarteleraHomeScreenState extends State<CarteleraHomeScreen> with TickerProviderStateMixin {
  late TabController _tabControllerCartelera;
  @override
  void initState() {
    _tabControllerCartelera = TabController(length: 2, vsync: this);
    super.initState();
  }
  
  @override
  void dispose() {
    _tabControllerCartelera.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    
    int subindex = int.parse(context.vRouter.pathParameters['sub2'].toString());

    _tabControllerCartelera.index = subindex;
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
                controller: _tabControllerCartelera,
                labelStyle: const TextStyle(color: Colors.black),
                unselectedLabelColor: Colors.black,
                labelColor: Utilidades.rosa,
                tabs: [
                  Tab(
                    child: Text(
                      "Próximos",
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
            controller: _tabControllerCartelera,
            children: const [
              CarteleraProximosScreen(),
              CarteleraAnterioresScreen(),
            ],
          ),
        ),
      ],
    )
    );
  }

  

}
