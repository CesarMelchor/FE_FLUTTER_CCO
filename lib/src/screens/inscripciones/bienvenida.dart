import 'package:flutter/material.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width <= 844) {
      setState(() {
        Utilidades.responsive = true;
      });
    } else {
      setState(() {
        Utilidades.responsive = false;
      });
    }
    if (Utilidades.responsive == false) {
      setState(() {
        Utilidades.alertHorizontal1 = 400;
        Utilidades.alertVertical2 = 200;
        Utilidades.alertVertical1 = 100;
      });
    } else {
      setState(() {
        Utilidades.alertHorizontal1 = 40;
        Utilidades.alertVertical2 = 120;
        Utilidades.alertVertical1 = 50;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9D2449),
        leading: IconButton(
            onPressed: () {
              _buildAlertDialogConfirm(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Text("Salir"),
      ),
      body: Center(
          child: InkWell(
              onTap: () {
                _buildAlertDialog1(context);
              },
              child: Utilidades.responsive == true
                  ? Image.asset("assets/images/pc_comenzar.png")
                  : Image.asset("assets/images/cel_comenzar.png"))),
    );
  }

  _buildAlertDialogConfirm(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 70),
            child: AlertDialog(
              title: const Text("¿Estás seguro que deseas salir?"),
              actions: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: const Text("Aceptar"),
                        onPressed: () {
                          cookie.remove('correo');
                          context.vRouter.to('/inscripciones');
                        }),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        child: const Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }

  _buildAlertDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("BIENVENIDO (A)",
                style: TextStyle(color: Color(0xff9D2449))),
            insetPadding: EdgeInsets.symmetric(
                horizontal: Utilidades.alertHorizontal1,
                vertical: Utilidades.alertVertical1),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Agradecemos su interés por formar parte de la comunidad de la  Casa de la Cultura Oaxaqueña ",
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "A continuación se requisitarán los datos indispensables para la inscripción en los talleres artísticos. Una vez validados sus datos, se remitirá por correo electrónico la línea de captura correspondiente. Tome en cuenta que en caso de detectar algún error se descartará su solicitud y perderá la oportunidad de inscripción.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "Por favor, considere que la dirección de correo electrónico con la cual se registró anteriormente será la cuenta en la que recibirá notificaciones respecto a este trámite y con la que se registrará en el aula virtual.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                    child: const Text("Siguiente"),
                    onPressed: () {
                      Navigator.pop(context);
                      _buildAlertDialog2(context);
                    }),
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }

  _buildAlertDialog2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            width: 400,
            child: AlertDialog(
              title: const Text(
                "IMPORTANTE",
                style: TextStyle(color: Color(0xff9D2449)),
              ),
              insetPadding: EdgeInsets.symmetric(
                  horizontal: Utilidades.alertHorizontal1,
                  vertical: Utilidades.alertVertical2),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Los datos personales que recolecte la Casa de la Cultura Oaxaqueña, se regirán conforme a su Aviso de Privacidad; independientemente a las políticas de privacidad y confidencialidad de las plataformas digitales gratuitas (Google Classroom, Zoom y Lichess)que se utilicen para hacer su registro en línea, gestión y desarrollo de los talleres.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                      child: const Text("Siguiente"),
                      onPressed: () {
                        Navigator.pop(context);
                        _buildAlertDialog3(context);
                      }),
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }

  _buildAlertDialog3(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 230,
            width: 400,
            child: AlertDialog(
              title: const Text("AVISO DE PRIVACIDAD",
                  style: TextStyle(color: Color(0xff9D2449))),
              insetPadding: EdgeInsets.symmetric(
                  horizontal: Utilidades.alertHorizontal1,
                  vertical: Utilidades.alertVertical2),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Antes de iniciar su proceso de inscripción, le invitamos a consultar el aviso de privacidad con respecto al manejo de la información que se obtendrá a través del presente formato en el siguiente enlace:",
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        GlobalFunctions.launchURL(
                            "https://www.oaxaca.gob.mx/cco/wp-content/uploads/sites/31/2023/03/aviso_privacidad.pdf");
                      },
                      child: Text(
                        "AVISO DE PRIVACIDAD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: Utilidades.fontHelBold,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff9D2449)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "¿ACEPTA EL ACUERDO DE PRIVACIDAD?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: Utilidades.fontHelBold),
                    ),
                  ),
                  const Text(
                    "En caso de no aceptarlo, no podrá realizar su proceso de inscripción.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: const Text("SI"),
                        onPressed: () {
                          Navigator.pop(context);
                          context.vRouter.to('/formulario1');
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                          child: const Text("NO"),
                          onPressed: () {
                            setState(() {
                              context.vRouter.to('/inscripciones');
                            });
                          }),
                    ),
                  ],
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        barrierColor: Colors.white70,
        barrierDismissible: false);
  }
}
