import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/imageNetwork.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      children: [
        DrawerHeader(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 70),
          child: ImageNetwork(
              imagen: Utilidades.preImages + "LogoHorizontal_CCO.png",
              widthImage: 50),
        )),
        ExpansionTile(
          title:
              const Text("INICIO", style: TextStyle(color: Color(0xff9D2449))),
          children: [
            ListTile(
              title: const Text("Home",
                  style: TextStyle(color: Color(0xff9D2449))),
              onTap: () {
                setState(() {
                  Utilidades.index = 0;
                  Utilidades.index2 = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Acerca",
                  style: TextStyle(color: Color(0xff9D2449))),
              onTap: () {
                setState(() {
                  Utilidades.index = 0;
                  Utilidades.index2 = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Visita",
                  style: TextStyle(color: Color(0xff9D2449))),
              onTap: () {
                setState(() {
                  Utilidades.index = 0;
                  Utilidades.index2 = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
        ListTile(
          title: const Text("ESPACIOS",
              style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 1;
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("EXPOSICIONES",
              style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 2;
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          title: const Text("CARTELERA",
              style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 3;
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("ANIVERSARIO",
              style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 4;
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          title:
              const Text("PODCAST", style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 5;
            });
            Navigator.pop(context);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text("INSCRIPCIONES",
              style: TextStyle(color: Color(0xff9D2449))),
          onTap: () {
            setState(() {
              Utilidades.index = 6;
            });
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
