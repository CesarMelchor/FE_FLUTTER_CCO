import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/inscripciones/credencial.dart';
import 'package:micrositio_cco/src/screens/inscripciones/disciplina.dart';
import 'package:micrositio_cco/src/screens/inscripciones/widgets/appbart.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class HomeBeneficiarioScreen extends StatefulWidget {
  const HomeBeneficiarioScreen({Key? key}) : super(key: key);

  @override
  State<HomeBeneficiarioScreen> createState() => _HomeBeneficiarioScreenState();
}

class _HomeBeneficiarioScreenState extends State<HomeBeneficiarioScreen> with TickerProviderStateMixin{
  late TabController _tabControllerHomeBeneficiario;
  @override
  void initState() {
    super.initState();
    _tabControllerHomeBeneficiario = TabController(length: 2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    bool responsive = false;

    if (size.width <= 844) {
      setState(() {
        responsive = true;
      });
    } else {
      setState(() {
        responsive == false;
      });
    }

    if (responsive == false) {
      setState(() {
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
      });
    } else {
      setState(() {
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
      });
    }
    _tabControllerHomeBeneficiario.index = 0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
          child: const CustomAppbarLogout("/inscripciones"),
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
                controller: _tabControllerHomeBeneficiario,
                labelStyle: const TextStyle(color: Colors.black),
                unselectedLabelColor: Colors.black,
                labelColor: Utilidades.rosa,
                tabs: [
                  Tab(
                    child: Text(
                      "INSCRIPCIONES",
                      style: TextStyle(
                          fontFamily: Utilidades.fontHelMedium,
                          fontSize: Utilidades.sizeTitle4,
                          color: Utilidades.grisFooter),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "CREDENCIAL",
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
            controller: _tabControllerHomeBeneficiario,
            children: const [
              DisciplinaScreen(),
              CredencialScreen(),
            ],
          ),
        ),
      ],
    )
    );
  }

  

}
