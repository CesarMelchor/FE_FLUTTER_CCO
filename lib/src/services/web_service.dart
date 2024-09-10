import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:micrositio_cco/src/models/actividades.dart';
import 'package:micrositio_cco/src/models/beneficiario.dart';
import 'package:micrositio_cco/src/models/credenciales.dart';
import 'package:micrositio_cco/src/models/episodios.dart';
import 'package:micrositio_cco/src/models/exposiciones.dart';
import 'package:micrositio_cco/src/models/images.dart';
import 'package:micrositio_cco/src/models/aniversarios.dart';
import 'package:micrositio_cco/src/models/registros.dart';
import 'package:micrositio_cco/src/models/talleres.dart';
import 'package:micrositio_cco/src/utils/utilidades.dart';

class WebService {
  var dio = Dio();

//Consulta de imagenes de banners
  Future<List<Imagenes>> fetchListImagenes(carrusel) async {
    final consult = jsonEncode({'carrusel': carrusel});
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/carrusels");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['imagenes'];
      return list.map((imagen) => Imagenes.fromJson(imagen)).toList();
    } else {
      throw Exception("Error al obtener imagenes");
    }
  }

//Consulta de imagenes de banners
  Future<List<Imagenes>> fetchListImagenesCarrusels(carrusel) async {
    final consult = jsonEncode({'carrusel': carrusel});
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/home/images_aniversarios");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['imagenes'];
      return list.map((imagen) => Imagenes.fromJson(imagen)).toList();
    } else {
      throw Exception("Error al obtener imagenes");
    }
  }

//Consulta de información de los episodios
  Future<List<Episodios>> fetchListEpisodios() async {
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/episodios");
    final response = await dio.postUri(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['epis'];
      return list.map((episodio) => Episodios.fromJson(episodio)).toList();
    } else {
      throw Exception("Error al obtener imagenes");
    }
  }

//Consulta de información de las exposiciones
  Future<List<Exposiciones>> fetchListExposiciones() async {
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/exposiciones");
    final response = await dio.postUri(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['expos'];
      return list
          .map((exposicion) => Exposiciones.fromJson(exposicion))
          .toList();
    } else {
      throw Exception("Error al obtener exposiciones");
    }
  }

  Future<List<Exposiciones>> fetchListExposicionesAnteriores() async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/home/exposicionesAnteriores");
    final response = await dio.postUri(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['expos'];
      return list
          .map((exposicion) => Exposiciones.fromJson(exposicion))
          .toList();
    } else {
      throw Exception("Error al obtener exposiciones");
    }
  }

  Future<List<Exposiciones>> fetchListExposicionesVirtuales() async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/home/exposicionesVirtuales");
    final response = await dio.postUri(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['expos'];
      return list
          .map((exposicion) => Exposiciones.fromJson(exposicion))
          .toList();
    } else {
      throw Exception("Error al obtener exposiciones");
    }
  }

//Consulta de información de la exposicion
  Future<List<Exposiciones>> fetchListExposicion(id) async {
    final consult = jsonEncode({'id': id});
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/exposicion");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['expo'];
      return list
          .map((exposicion) => Exposiciones.fromJson(exposicion))
          .toList();
    } else {
      throw Exception("Error al obtener exposiciones");
    }
  }

  //Consulta de las imagenes correspondientes a las exposiciones
  Future<List<Imagenes>> fetchListExposicionesCarrousel(id) async {
    final consult = jsonEncode({'carrusel': id});
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/carrusels");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['imagenes'];
      return list.map((imagen) => Imagenes.fromJson(imagen)).toList();
    } else {
      throw Exception("Error al obtener imagenes");
    }
  }

//Consulta de información de los aniversarios
  Future<List<Aniversarios>> fetchListAniversarios() async {
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/aniversarios");
    final response = await dio.postUri(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['aniversarios'];
      return list
          .map((aniversario) => Aniversarios.fromJson(aniversario))
          .toList();
    } else {
      throw Exception("Error al obtener lista de aniversarios");
    }
  }

//Consulta de información de la programación de actividades
  Future<List<Actividades>> fetchListActividades(id) async {
    final consult = jsonEncode({'id': id});
    final url =
        Uri.parse("https://casadelaculturaoaxaca.com/api/home/actividades");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['actividades'];
      return list.map((actividad) => Actividades.fromJson(actividad)).toList();
    } else {
      throw Exception("Error al obtener lista de actividades.");
    }
  }


//Consulta de información de los talleres
  Future<List<Talleres>> fetchListTalleres(especialidad) async {
    final consult = jsonEncode({'especialidad': especialidad});
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/inscripciones/talleres");
    final response = await dio.postUri(
      url,
      data: consult,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['talleres'];
      return list.map((taller) => Talleres.fromJson(taller)).toList();
    } else {
      throw Exception("Error al obtener lista de talleres.");
    }
  }

//Consulta de información de los talleres
  Future<List<Talleres>> fetchListTalleresAll() async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/administrativo/talleresAll");
    final response = await dio.postUri(
      url,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['talleres'];
      return list.map((taller) => Talleres.fromJson(taller)).toList();
    } else {
      throw Exception("Error al obtener lista de talleres.");
    }
  }

//Consulta de información de las listas de trabajo de administrador
  Future<List<Registros>> fetchListListaTrabajoAdmin() async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/administrativo/lista_trabajo_admin");
    final response = await dio.postUri(
      url,
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['lista'];
      return list.map((registro) => Registros.fromJson(registro)).toList();
    } else {
      throw Exception("Error al obtener lista de trabajo.");
    }
  }

  //Consulta de información de las listas de trabajo de administrador
  Future<List<Beneficiarios>> fetchListBeneficiarios(id) async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/administrativo/data_benificiario");

    final consult = jsonEncode({'id': id});
    final response = await dio.postUri(url, data: consult);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['lista'];
      return list
          .map((beneficiario) => Beneficiarios.fromJson(beneficiario))
          .toList();
    } else {
      throw Exception("Error al obtener la información del beneficiario.");
    }
  }

  //Consulta de información de las listas de trabajo de administrador
  Future<List<Credenciales>> fetchListCredenciales(correo) async {
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/inscripciones/credencial");

    final consult = jsonEncode({'correo': correo});
    final response = await dio.postUri(url, data: consult);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['credenciales'];
      return list
          .map((credencial) => Credenciales.fromJson(credencial))
          .toList();
    } else {
      throw Exception("Error al obtener la información de las credenciales.");
    }
  }

  //Consulta de información de los registros filtrados por clave de jefe de equipo
  Future<List<Registros>> fetchListRegistrosJefes(idJefe, clave) async {
    String tipo = "jefe";
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/administrativo/filtro_clave");
    final consult = jsonEncode({'id': idJefe, 'clave': clave, 'tipo': tipo});
    final response = await dio.postUri(url, data: consult);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['registros'];
      return list.map((registro) => Registros.fromJson(registro)).toList();
    } else {
      throw Exception("Error al obtener los registros.");
    }
  }

   //Consulta de información de los registros de jefe de equipo
  Future<List<Registros>> fetchListRegistrosJefesFull(idJefe) async {
    final url = Uri.parse(Utilidades.dataTrabajoJefe);
    final consult = jsonEncode({'id': idJefe});
    final response = await dio.postUri(url, data: consult);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['registros'];
      return list.map((registro) => Registros.fromJson(registro)).toList();
    } else {
      throw Exception("Error al obtener los registros.");
    }
  }


  //Consulta de información de los registros filtrados por clave de usuarios de apoyo
  Future<List<Registros>> fetchListRegistrosUsuarios(idUsuario, clave) async {
    String tipo = "usuario";
    final url = Uri.parse(
        "https://casadelaculturaoaxaca.com/api/administrativo/filtro_clave");
    final consult = jsonEncode({'id': idUsuario, 'clave': clave, 'tipo': tipo});
    final response = await dio.postUri(url, data: consult);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['registros'];
      return list.map((registro) => Registros.fromJson(registro)).toList();
    } else {
      throw Exception("Error al obtener los registros.");
    }
  }
}
