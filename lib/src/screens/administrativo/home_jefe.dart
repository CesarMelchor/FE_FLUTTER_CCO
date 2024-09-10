import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/administrativo/asign_user.dart';
import 'package:micrositio_cco/src/screens/administrativo/jefe_registros.dart';
import 'package:micrositio_cco/src/screens/administrativo/widgets/custom_appbar.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class HomeJefeScreen extends StatefulWidget {
  const HomeJefeScreen({Key? key}) : super(key: key);

  @override
  State<HomeJefeScreen> createState() => _HomeJefeScreenState();
}

class _HomeJefeScreenState extends State<HomeJefeScreen> with TickerProviderStateMixin{
  late TabController _tabControllerHomeJefe;
  @override
  void initState() {
    super.initState();
    _tabControllerHomeJefe = TabController(length: 2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    _tabControllerHomeJefe.index = 0;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: CustomAppbarAdministrativo("/loginAd"),
      ),
body: Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: TabBar(
                indicatorWeight: 5,
                indicatorColor: Utilidades.rosa,
                isScrollable: true,
                controller: _tabControllerHomeJefe,
                labelStyle: const TextStyle(color: Colors.black),
                unselectedLabelColor: Colors.black,
                labelColor: Utilidades.rosa,
                tabs: [
                  Tab(
                    child: Text(
                      "REGISTROS",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  
                  Tab(
                    child: Text(
                      "USUARIOS",
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
            controller: _tabControllerHomeJefe,
            children: const [
              RegistrosJefeScreen(),
              AsignUsuarioScreen()
            ],
          ),
        ),
      ],
    )
    );
  }

  

}
