import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/administrativo/usuario_generico_registros.dart';
import 'package:micrositio_cco/src/screens/administrativo/widgets/custom_appbar.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class HomeGeneralScreen extends StatefulWidget {
  const HomeGeneralScreen({Key? key}) : super(key: key);

  @override
  State<HomeGeneralScreen> createState() => _HomeGeneralScreenState();
}

class _HomeGeneralScreenState extends State<HomeGeneralScreen> with TickerProviderStateMixin{
  late TabController _tabControllerHomeUser;
  @override
  void initState() {
    super.initState();
    _tabControllerHomeUser = TabController(length: 1, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    _tabControllerHomeUser.index = 0;
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
                controller: _tabControllerHomeUser,
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
            controller: _tabControllerHomeUser,
            children: const [
              RegistrosGenericosScreen()
            ],
          ),
        ),
      ],
    )
    );
  }


}
