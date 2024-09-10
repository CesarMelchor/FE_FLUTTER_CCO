import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/models/credenciales.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:micrositio_cco/src/utils/mobile.dart'
    if (dart.library.html) 'package:micrositio_cco/src/utils/web.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:dio/dio.dart';

class CredencialScreen extends StatefulWidget {
  const CredencialScreen({Key? key}) : super(key: key);

  @override
  State<CredencialScreen> createState() => _CredencialScreenState();
}

class _CredencialScreenState extends State<CredencialScreen>
    with TickerProviderStateMixin {

  List<Credenciales> credenciales = [];
  late Response response;
  var dio = Dio();

  Future generateCredencial(correo) async {
    
    final consult = {
      "consulta" : "credenciales",
      'correo': correo};
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/benefit/fast_query',
        queryParameters : consult);
    final result = response.data;
    Iterable list = result['credenciales'];

    credenciales = list.map<Credenciales>((json) => Credenciales.fromJson(json)).toList();

    return credenciales;
  }


  @override
  Widget build(BuildContext context) {
    
    late final Future? myFuture = generateCredencial(cookie.get('correo').toString());
    Size size = MediaQuery.of(context).size;
    if (size.width <= 844) {
      Utilidades.widthCredencial = size.width / 6;
      Utilidades.widthTextCredencial = size.width - 700;
      Utilidades.widthHorizontal = 20;
    } else {
      Utilidades.widthCredencial = size.width / 6;
      Utilidades.widthHorizontal = 200;
    }


    return Scaffold(
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return snapshot.hasData ? 
          ListView(
          padding:  EdgeInsets.symmetric(horizontal: Utilidades.widthHorizontal),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "La Casa de la Cultura Oaxaqueña emite esta credencial que te identifica como parte de la institución y cuya vigencia tendrá que ser renovada cada cuatrimestre con la inscripción o reinscripción a tu taller artístico. Contar con la credencial vigente te permite el acceso a las instalaciones de la CCO y a sus servicio. Este documento no representa un documento oficial para trámites o cualquier uso externo a la institución.",
              style: TextStyle(
                  fontFamily: Utilidades.fontHelMedium,
                  fontSize: Utilidades.sizeTitle4),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Instrucciones.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            const SizedBox(
              height: 10,
            ),
            Text("1.- Imprime la credencial en una hoja opalina.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            Text("2.- Recorta la zona punteada del formato.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            Text("3.- Dobla y pega por la mitad para poder usar ",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            Text("4.- Pega una fotografía tamaño infantil en el área indicada.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            Text(
                "5.- Asiste con tu credencial al Departamento de Fomento Artístico de la CCO para acreditarla con el sello de la institución.",
                style: TextStyle(
                    fontFamily: Utilidades.fontHelMedium,
                    fontSize: Utilidades.sizeTitle4)),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Text("DEPARTAMENTO DE FOMENTO ARTÍSTICO",
                    style: TextStyle(
                        fontFamily: Utilidades.fontHelMedium,
                        fontSize: Utilidades.sizeTitle4))),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            credenciales.isEmpty
                ? const Center(
                    child: Text(
                    "No hay credenciales disponibles",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
                : Container(),
            const SizedBox(
              height: 45,
            ),
            ...credenciales.map(buildSingleTextHorizontal).toList(),
          ],
        )
          :
            Center(
                child: Image.asset(
                  "assets/logos/Logo_cco_2a.gif",
                  height: 100,
                ),
              );
        },
      ),
    );
  }

  Widget buildSingleTextHorizontal(Credenciales credenciales) =>
      buildTextHorizontal(credenciales: credenciales);

  Widget buildTextHorizontal({required Credenciales credenciales}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: Utilidades.widthCredencial,
                  child: Text(
                    credenciales.clave,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Expanded(child: Container()),
              ElevatedButton(
                style: Utilidades.raisedButtonStyle2,
                onPressed: () async {
                  if (int.parse(credenciales.edad) >= 18) {
                  _createPDF(
                      "credencial.png",
                      credenciales.clave,
                      credenciales.nombreUser,
                      credenciales.paterno,
                      credenciales.materno,
                      credenciales.curpUser,
                      credenciales.taller);
                  } else if(int.parse(credenciales.edad) < 18){
                    _createPDFMenor(
                      "Credencial_responsable.png",
                      credenciales.clave,
                      credenciales.nombreUser,
                      credenciales.paterno,
                      credenciales.materno,
                      credenciales.curpUser,
                      credenciales.taller,
                      credenciales.pRes,
                      credenciales.mRes,
                      credenciales.nomRes,
                      credenciales.telRes,
                      credenciales.sangre
                                            );
                  }
                },
                child: const Text("Generar"),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 3,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
}

Future<void> _createPDF(
    String image, String clave, nombre, paterno, materno, curp, taller) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

    page.graphics.drawImage(PdfBitmap(await _readImageData(image)),
      const Rect.fromLTWH(4, 10, 500, 420));

  page.graphics.drawImage(PdfBitmap(await _readImageData("firma.png")),
      const Rect.fromLTWH(120, 270, 70, 40));

 page.graphics.drawString(nombre,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(155, 133, 0, 0));

  page.graphics.drawString(paterno + " " + materno,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(155, 152, 0, 0));

  page.graphics.drawString(curp,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(160, 194, 0, 0));

  page.graphics.drawString(taller,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.regular),
      bounds: const Rect.fromLTWH(72, 228, 184, 0));

  page.graphics.drawString('MARZO - JUNIO 2023',
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(115, 268, 0, 0));


  List<int> bytes = await document.save();
  document.dispose();
  saveAndLaunchFile(bytes, "Credencial_CCO_" + clave + ".pdf");
}



Future<void> _createPDFMenor(
    String image, String clave, nombre, paterno, materno, curp, taller, pRes, mRes, nomRes,telRes,sangre) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawImage(PdfBitmap(await _readImageData(image)),
      const Rect.fromLTWH(4, 10, 500, 420));

  page.graphics.drawImage(PdfBitmap(await _readImageData("firma.png")),
      const Rect.fromLTWH(120, 270, 70, 40));

  page.graphics.drawString(nombre,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      brush: PdfBrushes.red,
      bounds: const Rect.fromLTWH(155, 133, 0, 0));

  page.graphics.drawString(paterno + " " + materno,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      brush: PdfBrushes.red,
      bounds: const Rect.fromLTWH(155, 152, 0, 0));

  page.graphics.drawString(curp,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(160, 194, 0, 0));

  page.graphics.drawString(taller,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.regular),
      bounds: const Rect.fromLTWH(72, 228, 184, 0));

  page.graphics.drawString('MARZO - JUNIO 2023',
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(115, 268, 0, 0));

      page.graphics.drawString(nomRes + " " + pRes + " " + mRes,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(275, 167, 184, 0));

         page.graphics.drawString(telRes,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(335, 194, 184, 0));

      page.graphics.drawString(sangre,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(335, 211, 184, 0));

  List<int> bytes = await document.save();
  document.dispose();
  saveAndLaunchFile(bytes, "Credencial_CCO_" + clave + ".pdf");
}



  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load("assets/images/$name");
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
