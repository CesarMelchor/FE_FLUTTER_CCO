import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/administrativo/admin_listas.dart';
import 'package:micrositio_cco/src/screens/administrativo/admin_registros.dart';
import 'package:micrositio_cco/src/screens/administrativo/asign_jefe.dart';
import 'package:micrositio_cco/src/screens/administrativo/extemporaneo.dart';
import 'package:micrositio_cco/src/screens/administrativo/periodos.dart';
import 'package:micrositio_cco/src/screens/administrativo/reporte_copeval.dart';
import 'package:micrositio_cco/src/screens/administrativo/widgets/custom_appbar.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> with TickerProviderStateMixin{
  late TabController _tabControllerHomeAdmin;
  late final String title;


  @override
  void initState() {
    super.initState();
    _tabControllerHomeAdmin = TabController(length: 6, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    _tabControllerHomeAdmin.index = 0;
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
                indicatorColor: const Color.fromARGB(255, 189, 189, 189),
                isScrollable: true,
                controller: _tabControllerHomeAdmin,
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
                      "LISTAS DE TALLERES",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "REPORTES",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "EXTEMPORÁNEOS",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "PERIODOS",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "JEFES",
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
            controller: _tabControllerHomeAdmin,
            children: const [
              RegistrosAdminScreen(),
              AdminListasScreen(),
              ReporteCopevalScreen(),
              ExtemporaneoScreen(),
              PeriodoScreen(),
              AsignJefeScreen()
            ],
          ),
        ),
      ],
    )
    );
  }


}
