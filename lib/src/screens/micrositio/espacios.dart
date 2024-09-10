import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_espacios_1.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_espacios_2.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';

class Espacios extends StatefulWidget {
  const Espacios({Key? key}) : super(key: key);

  @override
  State<Espacios> createState() => _EspaciosState();
}

class _EspaciosState extends State<Espacios> {
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
        responsive = false;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          responsive == false ? const RowEspacios1() : const ColumnEspacios1(),
          const SizedBox(
            height: 30,
          ),
          const CustomFooter()
        ],
      ),
    );
  }
}
