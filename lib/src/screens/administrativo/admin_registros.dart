import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrositio_cco/src/models/beneficiario.dart';
import 'package:micrositio_cco/src/models/credenciales.dart';
import 'package:micrositio_cco/src/models/registros.dart';
import 'package:micrositio_cco/src/utils/global_functions.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';
import 'package:dio/dio.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:micrositio_cco/src/utils/mobile.dart'
    if (dart.library.html) 'package:micrositio_cco/src/utils/web.dart';

class RegistrosAdminScreen extends StatefulWidget {
  const RegistrosAdminScreen({Key? key}) : super(key: key);

  @override
  State<RegistrosAdminScreen> createState() => RegistrosAdminScreenState();
}

class RegistrosAdminScreenState extends State<RegistrosAdminScreen> {
  late final Future? myFuture = generateListRegistros();
  late Response response;
  var dio = Dio();

  TextEditingController nombre = TextEditingController();
  TextEditingController paterno = TextEditingController();
  TextEditingController materno = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController curp = TextEditingController();
  TextEditingController tipo = TextEditingController(text: '');
  TextEditingController personal = TextEditingController();
  TextEditingController folio = TextEditingController();
  TextEditingController enviado = TextEditingController();
  TextEditingController comprobante = TextEditingController();
  TextEditingController reimpresion = TextEditingController();
  TextEditingController sefin = TextEditingController();
  TextEditingController observaciones = TextEditingController();
  TextEditingController acceso = TextEditingController();
  TextEditingController concluido = TextEditingController();
  TextEditingController texto = TextEditingController();

  final List<String> tipoRe = <String>['', 'NUEVO INGRESO', 'REINSCRIPCION'];

  final List<String> dosRe = <String>['', 'SI', 'NO'];

  final List<String> registro = <String>['', 'Normal', 'Extemporáneo'];

  final List<String> comprobanteRe = <String>[
    '',
    'SIN INICIAR',
    'RECIBIDO',
    'CORREGIR',
    'RECORDATORIO'
  ];

  final List<String> sefinRe = <String>[
    '',
    'SIN INICIAR',
    'ACREDITADO',
    'REVISION',
    'VENCIDA'
  ];

  String paternoV = "";
  String maternoV = "";
  String nombresV = "";
  String correoV = "";
  String fechaV = "";
  String edadV = "";
  String curpV = "";
  String tipoV = "";
  String folioV = "";
  String enviadoV = "";
  String comprobanteV = "";
  String reimpresionV = "";
  String sefinV = "";
  String observacionesV = "";
  String accesoV = "";
  String concluidoV = "";
  String personalV = "";
  String textoV = "";
  String enviadoBValue = "";
  String comprobanteBValue = "";
  String sefinBValue = "";
  String aulaBValue = "";
  String concluidoBValue = "";

  String idDelete = "";
  int registrosCount = 0;
  String url = "";
  String idDa = "";
  String idReg = "";
  int total = 0;

  List<Registros> registros = [];
  late final List<Registros> registrosOriginales;
  List<Registros> registrosView = [];
  List<Registros> registrosViewPag = [];

  ScrollController scroll2 = ScrollController();
  ScrollController scrol1 = ScrollController();

  int primerElemento = 0;
  int ultimoElemento = 14;
  late dynamic l;
  int longitud = 0;
  String valor = "";
  String benefit = "";

  void searchRegisterCampos(String opcion, String nombre) {
    registrosView = registrosOriginales;

    String input = "";
    dynamic registerMail;

    final resultados = registrosView.where((element) {
      switch (opcion) {
        case 'env':
          registerMail = element.enviado.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'com':
          registerMail = element.comprobante.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'sef':
          registerMail = element.sefin.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'reg':
          registerMail = element.tipoRegistro.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'con':
          registerMail = element.concluido.toLowerCase();
          input = nombre.toLowerCase();
          break;
        default:
          registrosView = registrosOriginales;
      }

      return registerMail.contains(input);
    }).toList();

    setState(() {
      total = resultados.length;
      comprobante.text = '';
      sefin.text = '';
    });

    if (resultados.length < 15) {
      registrosView = resultados;
    } else {
      setState(() {
        registrosViewPag = resultados;
      });

      lista(resultados, 0, 14);
    }
  }

  Credenciales credencial = Credenciales(
      paterno: "",
      materno: "",
      nombreUser: "",
      curpUser: "",
      taller: "",
      clave: "",
      edad: "",
      pRes: "",
      mRes: "",
      nomRes: "",
      telRes: "",
      sangre: "");

  Future generateCredencial(correo, taller) async {
    final consult = {
      "consulta": "credencial",
      'correo': correo,
      'taller': taller
    };
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/benefit/fast_query',
        queryParameters: consult);
    final result = response.data;

    credencial = Credenciales.fromJson(result);

    if (int.parse(credencial.edad) < 18) {
      _createPDFMenor(
          "Credencial_responsable.png",
          credencial.clave,
          credencial.nombreUser,
          credencial.paterno,
          credencial.materno,
          credencial.curpUser,
          credencial.taller,
          credencial.pRes,
          credencial.mRes,
          credencial.nomRes);
    } else {
      _createPDF(
          "credencial.png",
          credencial.clave,
          credencial.nombreUser,
          credencial.paterno,
          credencial.materno,
          credencial.curpUser,
          credencial.taller);
    }

    return credencial;
  }

  void searchRegister(String nombre) {
    
    registrosView = registrosOriginales;
    registrosViewPag = registrosOriginales;

    String input = "";
    dynamic registerMail;

    final resultados = registrosView.where((element) {
      switch (personalV) {
        case 'ID':
          registerMail = element.id.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'PATERNO':
          registerMail = element.apellidoPaterno.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'MATERNO':
          registerMail = element.apellidoMaterno.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'NOMBRE':
          registerMail = element.nombres.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'CORREO':
          registerMail = element.correo.toLowerCase();
          input = nombre.toLowerCase();
          break;
        case 'TALLER':
          registerMail = element.claveTaller.toLowerCase();
          input = nombre.toLowerCase();
          break;
        default:
          registrosView = registrosOriginales;
      }

      return registerMail.contains(input);
    }).toList();

    registrosView = resultados;

    setState(() {
      total = registrosView.length;
      registrosViewPag = resultados;
    });

    if (registrosView.length < 15) {
    } else {
      lista(resultados, 0, 14);
    }
  }

  void lista(lista, primero, ultimo) {
    l = lista.getRange(primero, ultimo);
    setState(() {
      registrosView = l.toList();
    });
  }

  Future generateListRegistros() async {
    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/registros",
        queryParameters: {"tipo": "admin"});
    final result = response.data;
    Iterable list = result['registros'];
    registros =
        list.map<Registros>((json) => Registros.fromJson(json)).toList();
    lista(registros, primerElemento, ultimoElemento);
    setState(() {
      total = registros.length;
    });
    registrosOriginales = registros;
    return registros;
  }

  ejecutaUpdate(idReg, idDa, nom, pat, mat, mail, fecha, edadd, currp, tipo,
      fol, env, compro, reim, sef, aul, conclu, obser) async {
    var resultado = await updateData(idReg, idDa, nom, pat, mat, mail, fecha,
        edadd, currp, tipo, fol, env, compro, reim, sef, aul, conclu, obser);

    if (resultado == true) {
      AchievementView(
        context,
        title: "Datos guardados",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    } else {
      AchievementView(
        context,
        title: "Error al actualizar, intenta más tarde.",
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        color: Colors.amber,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
  }

  Future<bool> updateData(idReg, idDa, nom, pat, mat, mail, fecha, edadd, currp,
      tipo, fol, env, compro, reim, sef, aul, conclu, obser) async {
    var data = {
      "idReg": idReg,
      "idDa": idDa,
      "nom": nom,
      "pat": pat,
      "mat": mat,
      "mail": mail,
      "fecha": fecha,
      "edadd": edadd,
      "currp": currp,
      "tipo": tipo,
      "fol": fol,
      "env": env,
      "compro": compro,
      "reim": reim,
      "sef": sef,
      "aul": aul,
      "conclu": conclu,
      "obser": obser,
      "consulta": "updateRegistro"
    };

    late bool respuesta;

    response = await dio.get(
        "https://casadelaculturaoaxaca.com/api/control_escolar/fast_query",
        queryParameters: data);

    if (response.statusCode == 200) {
      respuesta = true;
    } else {
      respuesta = false;
    }
    return respuesta;
  }

  final List<String> options = <String>[
    '',
    'ID',
    'PATERNO',
    'MATERNO',
    'NOMBRE',
    'CORREO',
    'TALLER',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthLeft = (size.width / 3) * 2;
    double widthRight = size.width / 3;
    double widthForm = ((size.width / 3) - 50);

    return FutureBuilder(
        future: myFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widthLeft,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height / 9.8,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Total: " + total.toString()),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 110,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "Texto: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: personal.text,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            personalV = value!;
                                          },
                                          items: options
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextFormField(
                                        controller: texto,
                                        onChanged: (value) {
                                          setState(() {
                                            textoV = value;
                                            enviadoBValue = '';
                                            comprobanteBValue = '';
                                            sefinBValue = '';
                                            aulaBValue = '';
                                            concluidoBValue = '';
                                          });
                                          searchRegister(value);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Este campo no puede estar vacío";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Texto",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 80,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "Enviado: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: enviadoBValue,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            enviadoBValue = value!;
                                            searchRegisterCampos('env', value);

                                            setState(() {
                                              comprobanteBValue = '';
                                              sefinBValue = '';
                                              aulaBValue = '';
                                              concluidoBValue = '';
                                            });
                                          },
                                          items: dosRe
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 120,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "Comprobante: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: comprobanteBValue,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            comprobanteBValue = value!;
                                            searchRegisterCampos('com', value);
                                            setState(() {
                                              enviadoBValue = '';
                                              sefinBValue = '';
                                              aulaBValue = '';
                                              concluidoBValue = '';
                                            });
                                          },
                                          items: comprobanteRe
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 120,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "SEFIN: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: sefinBValue,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            sefinBValue = value!;
                                            searchRegisterCampos('sef', value);
                                            setState(() {
                                              enviadoBValue = '';
                                              comprobanteBValue = '';
                                              aulaBValue = '';
                                              concluidoBValue = '';
                                            });
                                          },
                                          items: sefinRe
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 80,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "Registro: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: aulaBValue,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            aulaBValue = value!;
                                            searchRegisterCampos('reg', value);
                                            setState(() {
                                              enviadoBValue = '';
                                              comprobanteBValue = '';
                                              sefinBValue = '';
                                              concluidoBValue = '';
                                            });
                                          },
                                          items: registro
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      width: 80,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              labelText: "Concluido: ",
                                              focusedBorder: Utilidades.form1,
                                              enabledBorder:
                                                  Utilidades.form1_1),
                                          value: concluidoBValue,
                                          autofocus: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_sharp),
                                          isExpanded: true,
                                          onChanged: (String? value) {
                                            concluidoBValue = value!;
                                            searchRegisterCampos('con', value);
                                            setState(() {
                                              enviadoBValue = '';
                                              comprobanteBValue = '';
                                              sefinBValue = '';
                                              aulaBValue = '';
                                            });
                                          },
                                          items: dosRe
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height / 1.45,
                            child: SingleChildScrollView(
                                controller: scrol1,
                                child: Column(
                                  children: [
                                    ...registrosView
                                        .map(buildSingleTextHorizontal)
                                        .toList(),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: size.height / 13.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (primerElemento == 0) {
                                            } else {
                                              ultimoElemento =
                                                  ultimoElemento - 14;
                                              primerElemento =
                                                  ultimoElemento - 14;
                                              if (primerElemento < 0) {
                                                primerElemento = 0;
                                                ultimoElemento = 14;
                                              }
                                              lista(
                                                  registrosOriginales,
                                                  primerElemento,
                                                  ultimoElemento);
                                              scrol1.jumpTo(0);
                                            }
                                          });
                                        },
                                        child: const Text("Anterior")),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            primerElemento =
                                                primerElemento + 14;
                                            ultimoElemento =
                                                ultimoElemento + 14;
                                            if (ultimoElemento > total) {
                                              ultimoElemento = total;
                                            }
                                            lista(registrosOriginales,
                                                primerElemento, ultimoElemento);
                                            scrol1.jumpTo(0);
                                          });
                                        },
                                        child: const Text("Siguiente"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: widthRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 15),
                        child: SingleChildScrollView(
                          controller: scroll2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: widthForm / 1.4,
                                      child: TextFormField(
                                        inputFormatters: [
                                          UpperCaseTextFormatter(),
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9a-zA-ZñÑ ]"))
                                        ],
                                        controller: nombre,
                                        onChanged: (value) {
                                          setState(() {
                                            nombresV = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Este campo no puede estar vacío";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Nombre",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _searchBenefitB(context, benefit);
                                        },
                                        child: const Icon(
                                          Icons.search_outlined,
                                          size: 40,
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ ]"))
                                      ],
                                      controller: paterno,
                                      onChanged: (value) {
                                        setState(() {
                                          paternoV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Apellido paterno: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ ]"))
                                      ],
                                      controller: materno,
                                      onChanged: (value) {
                                        setState(() {
                                          maternoV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Apellido materno: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: correo,
                                onChanged: (value) {
                                  setState(() {
                                    correoV = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Este campo no puede estar vacío";
                                  }
                                  if (!value.contains('@gmail.com')) {
                                    return "Debe tener el formato correcto";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Correo electrónico: ",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ-]"))
                                      ],
                                      controller: fecha,
                                      onChanged: (value) {
                                        setState(() {
                                          fechaV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Fecha de nacimiento: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ]"))
                                      ],
                                      controller: edad,
                                      onChanged: (value) {
                                        setState(() {
                                          edadV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Edad: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 1.2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ]"))
                                      ],
                                      controller: curp,
                                      onChanged: (value) {
                                        setState(() {
                                          curpV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "CURP: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        GlobalFunctions.launchURL(url);
                                      },
                                      child: Image.asset(
                                          "assets/images/btn_descarga.png"))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            labelText:
                                                "Tipo de reinscripción: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: tipo.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          tipoV = value!;
                                        },
                                        items: tipoRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        UpperCaseTextFormatter(),
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9a-zA-ZñÑ]"))
                                      ],
                                      controller: folio,
                                      onChanged: (value) {
                                        setState(() {
                                          folioV = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Este campo no puede estar vacío";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Folio: ",
                                          focusedBorder: Utilidades.form1,
                                          enabledBorder: Utilidades.form1_1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            labelText: "Enviado: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: enviado.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          enviadoV = value!;
                                        },
                                        items: dosRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.black),
                                        decoration: InputDecoration(
                                            labelText: "Comprobante: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: comprobante.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          comprobanteV = value!;
                                        },
                                        items: comprobanteRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            labelText: "Reimpresión: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: reimpresion.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          reimpresionV = value!;
                                        },
                                        items: dosRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.black),
                                        decoration: InputDecoration(
                                            labelText: "SEFIN: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: sefin.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          sefinV = value!;
                                        },
                                        items: sefinRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            labelText: "Aula: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: acceso.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          accesoV = value!;
                                        },
                                        items: dosRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: widthForm / 3.2,
                                    child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            labelText: "Concluido: ",
                                            focusedBorder: Utilidades.form1,
                                            enabledBorder: Utilidades.form1_1),
                                        value: concluido.text,
                                        autofocus: true,
                                        focusColor: Colors.transparent,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                        isExpanded: true,
                                        onChanged: (String? value) {
                                          concluidoV = value!;
                                        },
                                        items: dosRe
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  UpperCaseTextFormatter(),
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9a-zA-ZñÑ ]"))
                                ],
                                controller: observaciones,
                                onChanged: (value) {
                                  setState(() {
                                    observacionesV = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Este campo no puede estar vacío";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Observaciones: ",
                                    focusedBorder: Utilidades.form1,
                                    enabledBorder: Utilidades.form1_1),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: OutlinedButton(
                                    onPressed: () {
                                      ejecutaUpdate(
                                          idReg,
                                          idDa,
                                          nombresV,
                                          paternoV,
                                          maternoV,
                                          correoV,
                                          fechaV,
                                          edadV,
                                          curpV,
                                          tipoV,
                                          folioV,
                                          enviadoV,
                                          comprobanteV,
                                          reimpresionV,
                                          sefinV,
                                          accesoV,
                                          concluidoV,
                                          observacionesV);
                                    },
                                    child: const Text("Actualizar")),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Image.asset(
                    "assets/logos/Logo_cco_2a.gif",
                    height: 100,
                  ),
                );
        });
  }

  _searchBenefitB(
    BuildContext context,
    id,
  ) async {
    var resultado = await obtainDataB(id);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("INFORMACIÓN DE USUARIO",
                style: TextStyle(color: Color(0xff9D2449))),
            insetPadding: EdgeInsets.symmetric(
                horizontal: Utilidades.alertHorizontal1,
                vertical: Utilidades.alertVertical1),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText("ID: " + resultado.id),
                  SelectableText(
                      "APELLIDO PATERNO : " + resultado.apellidoPaterno),
                  SelectableText(
                      "APELLIDO MATERNO : " + resultado.apellidoMaterno),
                  SelectableText("NOMBRES : " + resultado.nombres),
                  SelectableText(
                      "FECHA DE NACIMIENTO : " + resultado.fechaNacimiento),
                  SelectableText("EDAD : " + resultado.edad),
                  SelectableText("GENERO : " + resultado.genero),
                  SelectableText("ENTIDAD : " + resultado.entidad),
                  SelectableText("CURP : " + resultado.curp),
                  SelectableText("ESTADO CIVIL : " + resultado.estadoCivil),
                  SelectableText("CALLE : " + resultado.calle),
                  SelectableText("NUMERO EXTERIOR : " + resultado.numE),
                  SelectableText("NUMERO INTERIOR : " + resultado.numI),
                  SelectableText("VIALIDAD : " + resultado.vialidad),
                  SelectableText("COLONIA : " + resultado.colonia),
                  SelectableText("ASENTAMIENTO : " + resultado.asentamiento),
                  SelectableText("CODIGO POSTAL : " + resultado.cp),
                  SelectableText("MUNICIPIO : " + resultado.municipio),
                  SelectableText("OTRO ESTADO : " + resultado.otroEstado),
                  SelectableText("TIPO DE SANGRE : " + resultado.tipoSangre),
                  SelectableText("DISCAPACIDAD : " + resultado.discapacidad),
                  SelectableText(
                      "DETALLE DE DISCAPACIDAD : " + resultado.desDiscapacidad),
                  SelectableText("ALERGIA : " + resultado.alergia),
                  SelectableText(
                      "DETALLE DE ALERGIAS : " + resultado.desAlergia),
                  SelectableText(
                      "TIPO DE INSCRIPCION : " + resultado.tipoInscripcion),
                  SelectableText("TELEFONO MOVIL : " + resultado.telMovil),
                  SelectableText("TELEFONO FIJO : " + resultado.telFijo),
                  SelectableText("AUTORIZACION DE USO DE IMAGEN : " +
                      resultado.autorizacion),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                        child: Text(
                      "DATOS DEL RESPONSABLE O TUTOR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  SelectableText("APELLIDO PATERNO : " + resultado.pRes),
                  SelectableText("APELLIDO MATERNO : " + resultado.mRes),
                  SelectableText("NOMBRES : " + resultado.nomRes),
                  SelectableText("TELEFONO MOVIL : " + resultado.telMRes),
                  SelectableText("TELEFONO FIJO : " + resultado.telFRes),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.pop(context);
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

  Future<Beneficiarios> obtainDataB(id) async {
    var data = {"id": id, "consulta": "dataBenefit"};
    final response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/control_escolar/fast_query',
        queryParameters: data);
    if (response.statusCode == 200) {
      return Beneficiarios.fromJson(response.data);
    } else {
      throw Exception('Error al realizar la consulta.');
    }
  }

  void elimina(id) async {
    response = await dio.get(
        'https://casadelaculturaoaxaca.com/api/control_escolar/fast_query',
        queryParameters: {
          "consulta": "deleteRegistro",
          'id': id});
    if (response.data == "OK") {
      AchievementView(
        context,
        title: "Registro eliminado",
        subTitle: "El registro fue eliminado correctamente.",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        color: Colors.green,
        textStyleTitle: const TextStyle(color: Colors.white),
        textStyleSubTitle: const TextStyle(color: Colors.white),
        alignment: Alignment.centerRight,
        duration: const Duration(seconds: 5),
        isCircle: true,
      ).show();
    }
  }

  _dialogConfirm(BuildContext context, id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 230,
            width: 400,
            child: AlertDialog(
              title: const Text("Confirmación",
                  style: TextStyle(color: Color(0xff9D2449))),
              insetPadding: EdgeInsets.symmetric(
                  horizontal: Utilidades.alertHorizontal1,
                  vertical: Utilidades.alertVertical2),
              content: const Text(
                "¿Desea eliminar este registro?",
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: const Text("SI"),
                        onPressed: () {
                          elimina(id);
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                          child: const Text("NO"),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
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

  Widget buildSingleTextHorizontal(Registros registros) =>
      buildTextHorizontal(registros: registros);

  Widget buildTextHorizontal({required Registros registros}) => Column(
        children: [
          Column(
            children: [
              Card(
                elevation: 1,
                child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      setState(() {
                        benefit = registros.beneficiario;
                        idDa = registros.beneficiario;
                        idReg = registros.id;
                        nombre.text = registros.nombres;
                        paterno.text = registros.apellidoPaterno;
                        materno.text = registros.apellidoMaterno;
                        correo.text = registros.correo;
                        fecha.text = registros.fechaNacimiento;
                        edad.text = registros.edad;
                        curp.text = registros.curp;
                        tipo.text = registros.tipoInscripcion;
                        folio.text = registros.folio;
                        enviado.text = registros.enviado;
                        comprobante.text = registros.comprobante;
                        sefin.text = registros.sefin;
                        reimpresion.text = registros.reimpresion;
                        acceso.text = registros.accesoAula;
                        concluido.text = registros.concluido;
                        observaciones.text = registros.observaciones;

                        nombresV = registros.nombres;
                        paternoV = registros.apellidoPaterno;
                        maternoV = registros.apellidoMaterno;
                        correoV = registros.correo;
                        fechaV = registros.fechaNacimiento;
                        edadV = registros.edad;
                        curpV = registros.curp;
                        tipoV = registros.tipoInscripcion;
                        folioV = registros.folio;
                        enviadoV = registros.enviado;
                        comprobanteV = registros.comprobante;
                        sefinV = registros.sefin;
                        reimpresionV = registros.reimpresion;
                        accesoV = registros.accesoAula;
                        concluidoV = registros.concluido;
                        observacionesV = registros.observaciones;
                        url = registros.pathPdf;
                      });
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 45,
                    ),
                  ),
                  title: SelectableText("ID: " +
                      registros.id +
                      " -- " +
                      "TALLER : " +
                      registros.claveTaller),
                  subtitle: Row(
                    children: [
                      Text(
                          "NOMBRE : " +
                              registros.nombres +
                              " " +
                              registros.apellidoPaterno +
                              " " +
                              registros.apellidoMaterno +
                              " -- " +
                              "CORREO: " +
                              registros.correo,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: Utilidades.fontHelMedium)),
                      Expanded(child: Container()),
                      Tooltip(
                        message: registros.concluido == 'SI'
                            ? 'Descargar credencial'
                            : 'Credencial no disponible',
                        child: InkWell(
                          onTap: () {
                            if (registros.concluido == 'SI') {
                              generateCredencial(
                                  registros.correo, registros.claveTaller);
                            } else {
                              AchievementView(
                                context,
                                title: "Credencial no disponible",
                                icon: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                                color: Colors.amber,
                                textStyleTitle:
                                    const TextStyle(color: Colors.white),
                                textStyleSubTitle:
                                    const TextStyle(color: Colors.white),
                                alignment: Alignment.centerRight,
                                duration: const Duration(seconds: 5),
                                isCircle: true,
                              ).show();
                            }
                          },
                          child: Icon(
                            Icons.badge,
                            size: 35,
                            color: registros.concluido == 'NO'
                                ? Colors.grey
                                : Utilidades.rosa,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  trailing: InkWell(
                      onTap: () {
                        _dialogConfirm(context, registros.id);
                      },
                      child: Tooltip(
                        message: "Eliminar registro.",
                        child: Icon(
                          Icons.delete,
                          color: Utilidades.rosa,
                          size: 45,
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

Future<void> _createPDF(
    String image, String clave, nombre, paterno, materno, curp, taller) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawImage(PdfBitmap(await _readImageData(image)),
      const Rect.fromLTWH(4, 10, 500, 420));

  page.graphics.drawImage(PdfBitmap(await _readImageData("firma.png")),
      const Rect.fromLTWH(110, 285, 80, 40));

  page.graphics.drawString(nombre,
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(145, 136, 0, 0));

  page.graphics.drawString(paterno + " " + materno,
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(145, 157, 0, 0));

  page.graphics.drawString(curp,
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(150, 196, 0, 0));

  page.graphics.drawString(taller,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.regular),
      bounds: const Rect.fromLTWH(59, 225, 184, 0));

  page.graphics.drawString('SEPTIEMBRE - DICIEMBRE 2022',
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(65, 272, 0, 0));

  List<int> bytes = await document.save();
  document.dispose();
  saveAndLaunchFile(bytes, "Credencial_CCO_" + clave + ".pdf");
}

Future<void> _createPDFMenor(String image, String clave, nombre, paterno,
    materno, curp, taller, pRes, mRes, nomRes) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawImage(PdfBitmap(await _readImageData(image)),
      const Rect.fromLTWH(4, 10, 500, 420));

  page.graphics.drawImage(PdfBitmap(await _readImageData("firma.png")),
      const Rect.fromLTWH(110, 285, 80, 40));

  page.graphics.drawString(nombre,
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(145, 136, 0, 0));

  page.graphics.drawString(paterno + " " + materno,
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(145, 157, 0, 0));

  page.graphics.drawString(curp,
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(150, 196, 0, 0));

  page.graphics.drawString(taller,
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.regular),
      bounds: const Rect.fromLTWH(59, 225, 184, 0));

  page.graphics.drawString('SEPTIEMBRE - DICIEMBRE 2022',
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(65, 272, 0, 0));

  page.graphics.drawString(nomRes + " " + pRes + " " + mRes,
      PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(266, 178, 184, 0));

  List<int> bytes = await document.save();
  document.dispose();
  saveAndLaunchFile(bytes, "Credencial_CCO_" + clave + ".pdf");
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load("assets/images/$name");
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
