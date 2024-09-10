import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/models/especialidades.dart';
import 'package:micrositio_cco/src/screens/micrositio/widgets/appbar.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class EspecialidadesScreen extends StatefulWidget {
  const EspecialidadesScreen({Key? key}) : super(key: key);

  @override
  State<EspecialidadesScreen> createState() => _EspecialidadesScreenState();
}

class _EspecialidadesScreenState extends State<EspecialidadesScreen> {
  List<Especialidades> especialidades = [];

  @override
  void initState() {
    super.initState();
    edadUser1();
  }

  @override
  Widget build(BuildContext context) {
    var imagen = "";
    var texto = "";
    var disciplina = cookie.get('campo').toString();
    switch (disciplina) {
      case "CULTURA PARA NIÑOS Y NIÑAS":
        setState(() {
          Utilidades.idJefeRegistro = "JEMGG";
          Utilidades.colorEmail = "#c42866;";
        });
        imagen = "assets/logos/logo_culturainfantil.png";
        texto = "CULTURA PARA NIÑOS Y NIÑAS";
        especialidades = [
          Especialidades(
              id: "1", nombre: "MULTIDISCIPLINARIO ARTISTICO INICIAL"),
          Especialidades(id: "2", nombre: "ORGANO ELECTRÓNICO"),
          Especialidades(id: "3", nombre: "INSTRUMENTOS DE VIENTO"),
          Especialidades(id: "4", nombre: "PIANO"),
        ];
        break;
      case "ARTES PLÁSTICAS":
        setState(() {
          Utilidades.colorEmail = "#5662a3;";
          Utilidades.idJefeRegistro = "JEALB";
        });
        imagen = "assets/logos/logo_artesplasticas.png";
        texto = "ARTES PLÁSTICAS";
        especialidades = [
          Especialidades(id: "1", nombre: "DIBUJO"),
          Especialidades(id: "2", nombre: "PINTURA"),
          Especialidades(id: "3", nombre: "MODELADO"),
        ];
        break;
      case "DANZA":
        setState(() {
          Utilidades.colorEmail = "#53a0d4;";
          Utilidades.idJefeRegistro = "JEALB";
        });
        imagen = "assets/logos/logo_danza.png";
        texto = "DANZA";
        especialidades = [
          Especialidades(
              id: "1", nombre: " BAILES POPULARES         (DE SALÓN)"),
          Especialidades(id: "2", nombre: "DANZA CONTEMPORÁNEA "),
          Especialidades(id: "3", nombre: "DANZA CLASICA"),
          Especialidades(id: "4", nombre: "DANZA MEXICANA"),
        ];
        break;
      case "MÚSICA":
        setState(() {
          Utilidades.colorEmail = "#d7ba1c;";
          Utilidades.idJefeRegistro = "JENCB";
        });
        imagen = "assets/logos/logo_musica.png";
        texto = "MÚSICA";
        especialidades = [
          Especialidades(id: "1", nombre: "GUITARRA CLÁSICA"),
          Especialidades(id: "2", nombre: "GUITAR POPULAR"),
          Especialidades(id: "3", nombre: "UKELELE"),
          Especialidades(id: "4", nombre: "GUITARRA ELÉCTRICA"),
          Especialidades(id: "5", nombre: "TECLADO"),
          Especialidades(id: "6", nombre: "MUSICA LATINOAMERICANA"),
          Especialidades(id: "7", nombre: "PIANO"),
          Especialidades(id: "8", nombre: "INSTRUMENTOS DE VIENTO"),
          Especialidades(id: "9", nombre: "VIOLIN"),
        ];
        break;
      case "TEATRO":
        setState(() {
          Utilidades.colorEmail = "#721e65;";
          Utilidades.idJefeRegistro = "JEMGG";
        });
        imagen = "assets/logos/logo_teatro.png";
        texto = "TEATRO";
        especialidades = [
          Especialidades(id: "1", nombre: "TEATRO INFANTIL"),
          Especialidades(id: "2", nombre: "TEATRO JUVENIL"),
          Especialidades(id: "3", nombre: "TEATRO ADULTOS"),
        ];
        break;
      case "ALTERNATIVOS":
        setState(() {
          Utilidades.colorEmail = "#5f8a37;";
          Utilidades.idJefeRegistro = "JEMGG";
        });
        imagen = "assets/logos/logo_alternativos.png";
        texto = "ALTERNATIVOS";
        especialidades = [
          Especialidades(id: "1", nombre: "COCINA"),
          Especialidades(id: "2", nombre: "REPOSTERÍA"),
          Especialidades(id: "3", nombre: "TAHITIANO"),
          Especialidades(id: "4", nombre: "TEJIDO  DE GROCHET"),
        ];
        break;
      default:
    }

    Size size = MediaQuery.of(context).size;
    if (size.width <= 844) {
      Utilidades.responsive = true;
    } else {
      Utilidades.responsive = false;
    }

    if (Utilidades.responsive == false) {
      setState(() {
        Utilidades.sizeContainer = 440;
        Utilidades.leftGeneral = 200;
        Utilidades.rightGeneral = 200;
        Utilidades.fontSizeTitle1 = 30;
        Utilidades.fontSizeTitle2 = 20;
        Utilidades.fontSizeTitle3 = 16;
        Utilidades.sizeContainer = 1;
      });
    } else {
      setState(() {
        Utilidades.leftGeneral = 20;
        Utilidades.rightGeneral = 20;
        Utilidades.fontSizeTitle1 = 20;
        Utilidades.fontSizeTitle2 = 15;
        Utilidades.fontSizeTitle3 = 12;
        Utilidades.sizeContainer = 1;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Utilidades.responsive == true
            ? const Size.fromHeight(30.0)
            : const Size.fromHeight(40.0),
        child: const CustomAppbar(true, "/homeBenefit"),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            left: Utilidades.leftGeneral, right: Utilidades.rightGeneral),
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Image.asset(imagen),
          ),
          Center(
              child: Text(
            texto,
            style: TextStyle(
                fontFamily: Utilidades.fontHelBold,
                fontSize: Utilidades.fontSizeTitle3),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 25),
            child: Center(
                child: Text("CUATRIMESTRE MARZO - JUNIO DE 2023",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle2))),
          ),
          Text("SECCIONES",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelBold,
                  fontSize: Utilidades.fontSizeTitle3,
                  color: const Color(0xff9D2449))),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 2,
            width: size.width - 400,
            color: Colors.black,
          ),
          ...especialidades.map(buildSingleText).toList(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    context.vRouter.to('/homeBenefit');
                  },
                  child: const Icon(
                    Icons.keyboard_return,
                    color: Color(0xff9D2449),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                      onTap: () {
                        context.vRouter.to('/homeBenefit');
                      },
                      child: Text(
                        "Regresar",
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontSize: Utilidades.fontSizeTitle3,
                            color: const Color(0xff9D2449)),
                      ))),
            ],
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  void edadUser1() async {
    var data = {
      "consulta": "getEdad",
      "correo": cookie.get('correo').toString(),
    };
    var dio = Dio();

    var res = await dio.get(
        "https://casadelaculturaoaxaca.com/api/benefit/fast_query",
        queryParameters: data);

    setState(() {
      Utilidades.edadUserString = res.data;
      Utilidades.edadUserInt = int.parse(Utilidades.edadUserString);
    });
  }

  Widget buildSingleText(Especialidades taller) =>
      buildText(especialidades: taller);

  Widget buildText({required Especialidades especialidades}) => InkWell(
        hoverColor:
            Color.fromARGB(255, Utilidades.r, Utilidades.g, Utilidades.b)
                .withOpacity(0.4),
        onTap: () {
          setState(() {
            cookie.set('seccion', especialidades.nombre,
                maxAge: const Duration(hours: 2));
            context.vRouter.to('/talleres');
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    especialidades.nombre,
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelBold,
                        fontSize: Utilidades.fontSizeTitle3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
