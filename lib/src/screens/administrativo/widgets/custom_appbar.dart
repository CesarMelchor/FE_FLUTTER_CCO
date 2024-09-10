// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class CustomAppbarAdministrativo extends StatefulWidget {
  final String ruta;
  const CustomAppbarAdministrativo(this.ruta);

  @override
  State<CustomAppbarAdministrativo> createState() =>
      _CustomAppbarAdministrativoState();
}

class _CustomAppbarAdministrativoState
    extends State<CustomAppbarAdministrativo> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: InkWell(
            onTap: () {
              cookie.remove('correoControl');
              cookie.remove('idControl');
              context.vRouter.to(widget.ruta);
            },
            child: const Icon(Icons.logout_rounded)),
        iconTheme: const IconThemeData(color: Color(0xff9D2449)),
        backgroundColor: const Color(0xfff6f1f6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Salir",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
