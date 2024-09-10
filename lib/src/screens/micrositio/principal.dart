import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/carouselhome.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_inicio_1.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/cuerpo_inicio_2.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/footer.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool responsive = false;
    if (size.width <= 844) {
      responsive = true;
    } else {
      responsive = false;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const CarouselHome(),
          const SizedBox(height: 15,),
          const SizedBox(height: 30),
          responsive == false ? const RowScreen1() : const ColumnScreen1(),
          const SizedBox(
            height: 30,
          ),
          const CustomFooter()
        ],
      ),
    );
  }
}
