import 'package:flutter/material.dart';

class Utilidades {
  static bool aviso1 = false;
  static bool aviso2 = false;
  static String primerApellido = "";
  static String fechaAlta = "";
  static String mesBeneficio = "";
  static String peridoBeneficio = "";
  static String segundoApellido = "";
  static String nombre = "";
  static String fechaNacimiento = "";
  static String edad = "";
  static String genero = "";
  static double leftGeneral = 200;
  static double rightGeneral = 200;
  static double fontSizeTitle1 = 30;
  static double fontSizeTitle2 = 20;
  static double fontSizeTitle3 = 16;
  static double widthCredencial = 0;
  static double widthTextCredencial = 0;
  static double widthHorizontal = 0;
  static double radiusForm = 20;
  static String imagenRuta = "";
  static String nombreMail = "";
  static String imagenMail = "";
  static String colorMail = "";
  static String tallerMail = "";
  static String claveMail = "";
  static int edadObtenida = 0;
  static String idBeneficiario = "";
  static String mesAdmin = "";
  static String diaInicioAdmin = "";
  static String diaFinAdmin = "";
  static String idJefeRegistro = "";
  static String filtroClave = "";
  static int tagJefe = 0;
  static int tagUsuario = 0;
  static String diaNaci = "";
  static String mesNaciString = "";
  static String mesNaciNumber = "";
  static String annioNaci = "";

  static String inscripciones =
      "https://casadelaculturaoaxaca.com/api/inscripciones/inscripciones";
  static String dataTrabajo =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_trabajo_admin";
  static String dataTrabajoJefe =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_trabajo_jefes";
  static String searchJefe =
      "https://casadelaculturaoaxaca.com/api/administrativo/search_jefe";
  static String dataTrabajoUsuario =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_trabajo_usuarios";

  static String dataTrabajoAdminSI =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_admin_si";
  static String idEvento = "";
  static double anchoEvento = 0;
  static String dataTrabajoJefeSI =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_jefe_si";
  static String dataTrabajoUsuarioSI =
      "https://casadelaculturaoaxaca.com/api/administrativo/lista_usuario_si";

  static String dataFiltroClave =
      "https://casadelaculturaoaxaca.com/api/administrativo/filtro_clave";

  static String edadUsuario =
      "https://casadelaculturaoaxaca.com/api/administrativo/edad";
  static String clave =
      "https://casadelaculturaoaxaca.com/api/inscripciones/getClave";
  static List datta = [];

  static bool form1check1 = false;
  static bool form1check2 = false;

  static bool form2check1 = false;
  static bool form2check2 = false;

  static bool form3check1 = false;
  static bool form3check2 = false;

  static bool form4check1_1 = false;
  static bool form4check1_2 = false;
  static bool form4check2_1 = false;
  static bool form4check2_2 = false;
  static bool form4check3_1 = false;
  static bool form4check3_2 = false;

  static bool form6check1 = false;
  static bool form6check2 = false;

  static bool form4Validator1 = false;
  static bool form4Validator2 = false;
  static List listToSearch = [
    {'name': 'Amir', 'class': 12},
    {'name': 'Raza', 'class': 11},
    {'name': 'Praksh', 'class': 10},
    {'name': 'Nikhil', 'class': 9},
    {'name': 'Sandeep', 'class': 8},
    {'name': 'Tazeem', 'class': 7},
    {'name': 'Najaf', 'class': 6},
    {'name': 'Izhar', 'class': 5},
  ];
  static List<String> sangre = [
    "O negativo.",
    "O positivo.",
    "A negativo.",
    'A positivo.',
    "B negativo.",
    "B positivo.",
    "AB negativo.",
    'AB positivo.'
  ];

   static List<String> meses = [
    "ENERO",
    "FEBRERO",
    "MARZO",
    "ABRIL",
    "MAYO",
    "JUNIO",
    "JULIO",
    "AGOSTO",
    "SEPTIEMBRE",
    "OCTUBRE",
    "NOVIEMBRE",
    "DICIEMBRE",
  ];

  static List<String> municipio = [
    "Abejones",
    "Acatlán de Pérez Figueroa",
    "Asunción Cacalotepec",
    "Asunción Cuyotepeji",
    "Asunción Ixtaltepec",
    "Asunción Nochixtlán",
    "Asunción Ocotlán",
    "Asunción Tlacolulita",
    "Ayotzintepec",
    "El Barrio de la Soledad",
    "Calihualá",
    "Candelaria Loxicha",
    "Ciénega de Zimatlán",
    "Ciudad Ixtepec",
    "Coatecas Altas",
    "Coicoyán de las Flores",
    "La Compañía",
    "Concepción Buenavista",
    "Concepción Pápalo",
    "Constancia del Rosario",
    "Cosolapa",
    "Cosoltepec",
    "Cuilápam de Guerrero",
    "Cuyamecalco Villa de Zaragoza",
    "Chahuites",
    "Chalcatongo de Hidalgo",
    "Chiquihuitlán de Benito Juárez",
    "Heroica Ciudad de Ejutla de Crespo",
    "Eloxochitlán de Flores Magón",
    "El Espinal",
    "Tamazulápam del Espíritu Santo",
    "Fresnillo de Trujano",
    "Guadalupe Etla",
    "Guadalupe de Ramírez",
    "Guelatao de Juárez",
    "Guevea de Humboldt",
    "Mesones Hidalgo",
    "Villa Hidalgo",
    "Heroica Ciudad de Huajuapan de León",
    "Huautepec",
    "Huautla de Jiménez",
    "Ixtlán de Juárez",
    "Heroica Ciudad de Juchitán de Zaragoza",
    "Loma Bonita",
    "Magdalena Apasco",
    "Magdalena Jaltepec",
    "Santa Magdalena Jicotlán",
    "Magdalena Mixtepec",
    "Magdalena Ocotlán",
    "Magdalena Peñasco",
    "Magdalena Teitipac",
    "Magdalena Tequisistlán",
    "Magdalena Tlacotepec",
    "Magdalena Zahuatlán",
    "Mariscala de Juárez",
    "Mártires de Tacubaya",
    "Matías Romero Avendaño",
    "Mazatlán Villa de Flores",
    "Miahuatlán de Porfirio Díaz",
    "Mixistlán de la Reforma",
    "Monjas",
    "Natividad",
    "Nazareno Etla",
    "Nejapa de Madero",
    "Ixpantepec Nieves",
    "Santiago Niltepec",
    "Oaxaca de Juárez",
    "Ocotlán de Morelos",
    "La Pe",
    "Pinotepa de Don Luis",
    "Pluma Hidalgo",
    "San José del Progreso",
    "Putla Villa de Guerrero",
    "Santa Catarina Quioquitani",
    "Reforma de Pineda",
    "La Reforma",
    "Reyes Etla",
    "Rojas de Cuauhtémoc",
    "Salina Cruz",
    "San Agustín Amatengo",
    "San Agustín Atenango",
    "San Agustín Chayuco",
    "San Agustín de las Juntas",
    "San Agustín Etla",
    "San Agustín Loxicha",
    "San Agustín Tlacotepec",
    "San Agustín Yatareni",
    "San Andrés Cabecera Nueva",
    "San Andrés Dinicuiti",
    "San Andrés Huaxpaltepec",
    "San Andrés Huayapam",
    "San Andrés Ixtlahuaca",
    "San Andrés Lagunas",
    "San Andrés Nuxiño",
    "San Andrés Paxtlán",
    "San Andrés Sinaxtla",
    "San Andrés Solaga",
    "San Andrés Teotilálpam",
    "San Andrés Tepetlapa",
    "San Andrés Yaá",
    "San Andrés Zabache",
    "San Andrés Zautla",
    "San Antonino Castillo Velasco",
    "San Antonino el Alto",
    "San Antonino Monte Verde",
    "San Antonio Acutla",
    "San Antonio de la Cal",
    "San Antonio Huitepec",
    "San Antonio Nanahuatipam",
    "San Antonio Sinicahua",
    "San Antonio Tepetlapa",
    "San Baltazar Chichicápam",
    "San Baltazar Loxicha",
    "San Baltazar Yatzachi el Bajo",
    "San Bartolo Coyotepec",
    "San Bartolomé Ayautla",
    "San Bartolomé Loxicha",
    "San Bartolomé Quialana",
    "San Bartolomé Yucuañe",
    "San Bartolomé Zoogocho",
    "San Bartolo Soyaltepec",
    "San Bartolo Yautepec",
    "San Bernardo Mixtepec",
    "San Blas Atempa",
    "San Carlos Yautepec",
    "San Cristóbal Amatlán",
    "San Cristóbal Amoltepec",
    "San Cristóbal Lachirioag",
    "San Cristóbal Suchixtlahuaca",
    "San Dionisio del Mar",
    "San Dionisio Ocotepec",
    "San Dionisio Ocotlán",
    "San Esteban Atatlahuca",
    "San Felipe Jalapa de Díaz",
    "San Felipe Tejalapam",
    "San Felipe Usila",
    "San Francisco Cahuacúa",
    "San Francisco Cajonos",
    "San Francisco Chapulapa",
    "San Francisco Chindúa",
    "San Francisco del Mar",
    "San Francisco Huehuetlán",
    "San Francisco Ixhuatán",
    "San Francisco Jaltepetongo",
    "San Francisco Lachigoló",
    "San Francisco Logueche",
    "San Francisco Nuxaño",
    "San Francisco Ozolotepec",
    "San Francisco Sola",
    "San Francisco Telixtlahuaca",
    "San Francisco Teopan",
    "San Francisco Tlapancingo",
    "San Gabriel Mixtepec",
    "San Ildefonso Amatlán",
    "San Ildefonso Sola",
    "San Ildefonso Villa Alta",
    "San Jacinto Amilpas",
    "San Jacinto Tlacotepec",
    "San Jerónimo Coatlán",
    "San Jerónimo Silacayoapilla",
    "San Jerónimo Sosola",
    "San Jerónimo Taviche",
    "San Jerónimo Tecoatl",
    "San Jorge Nuchita",
    "San José Ayuquila",
    "San José Chiltepec",
    "San José del Peñasco",
    "San José Estancia Grande",
    "San José Independencia",
    "San José Lachiguirí",
    "San José Tenango",
    "San Juan Achiutla",
    "San Juan Atepec",
    "Ánimas Trujano",
    "San Juan Bautista Atatlahuca",
    "San Juan Bautista Coixtlahuaca",
    "San Juan Bautista Cuicatlán",
    "San Juan Bautista Guelache",
    "San Juan Bautista Jayacatlán",
    "San Juan Bautista Lo de Soto",
    "San Juan Bautista Suchitepec",
    "San Juan Bautista Tlacoatzintepec",
    "San Juan Bautista Tlachichilco",
    "San Juan Bautista Tuxtepec",
    "San Juan Cacahuatepec",
    "San Juan Cieneguilla",
    "San Juan Coatzospam",
    "San Juan Colorado",
    "San Juan Comaltepec",
    "San Juan Cotzocón",
    "San Juan Chicomezúchil",
    "San Juan Chilateca",
    "San Juan del Estado",
    "San Juan del Río",
    "San Juan Diuxi",
    "San Juan Evangelista Analco",
    "San Juan Guelavía",
    "San Juan Guichicovi",
    "San Juan Ihualtepec",
    "San Juan Juquila Mixes",
    "San Juan Juquila Vijanos",
    "San Juan Lachao",
    "San Juan Lachigalla",
    "San Juan Lajarcia",
    "San Juan Lalana",
    "San Juan de los Cués",
    "San Juan Mazatlán",
    "San Juan Mixtepec -Distrito 08-",
    "San Juan Mixtepec -Distrito 26-",
    "San Juan Ñumí",
    "San Juan Ozolotepec",
    "San Juan Petlapa",
    "San Juan Quiahije",
    "San Juan Quiotepec",
    "San Juan Sayultepec",
    "San Juan Tabaá",
    "San Juan Tamazola",
    "San Juan Teita",
    "San Juan Teitipac",
    "San Juan Tepeuxila",
    "San Juan Teposcolula",
    "San Juan Yaeé",
    "San Juan Yatzona",
    "San Juan Yucuita",
    "San Lorenzo",
    "San Lorenzo Albarradas",
    "San Lorenzo Cacaotepec",
    "San Lorenzo Cuaunecuiltitla",
    "San Lorenzo Texmelucan",
    "San Lorenzo Victoria",
    "San Lucas Camotlán",
    "San Lucas Ojitlán",
    "San Lucas Quiaviní",
    "San Lucas Zoquiápam",
    "San Luis Amatlán",
    "San Marcial Ozolotepec",
    "San Marcos Arteaga",
    "San Martín de los Cansecos",
    "San Martín Huamelúlpam",
    "San Martín Itunyoso",
    "San Martín Lachilá",
    "San Martín Peras",
    "San Martín Tilcajete",
    "San Martín Toxpalan",
    "San Martín Zacatepec",
    "San Mateo Cajonos",
    "Capulálpam de Méndez",
    "San Mateo del Mar",
    "San Mateo Yoloxochitlán",
    "San Mateo Etlatongo",
    "San Mateo Nejapam",
    "San Mateo Peñasco",
    "San Mateo Piñas",
    "San Mateo Río Hondo",
    "San Mateo Sindihui",
    "San Mateo Tlapiltepec",
    "San Melchor Betaza",
    "San Miguel Achiutla",
    "San Miguel Ahuehuetitlán",
    "San Miguel Aloápam",
    "San Miguel Amatitlán",
    "San Miguel Amatlán",
    "San Miguel Coatlán",
    "San Miguel Chicahua",
    "San Miguel Chimalapa",
    "San Miguel del Puerto",
    "San Miguel del Río",
    "San Miguel Ejutla",
    "San Miguel el Grande",
    "San Miguel Huautla",
    "San Miguel Mixtepec",
    "San Miguel Panixtlahuaca",
    "San Miguel Peras",
    "San Miguel Piedras",
    "San Miguel Quetzaltepec",
    "San Miguel Santa Flor",
    "Villa Sola de Vega",
    "San Miguel Soyaltepec",
    "San Miguel Suchixtepec",
    "Villa Talea de Castro",
    "San Miguel Tecomatlán",
    "San Miguel Tenango",
    "San Miguel Tequixtepec",
    "San Miguel Tilquiápam",
    "San Miguel Tlacamama",
    "San Miguel Tlacotepec",
    "San Miguel Tulancingo",
    "San Miguel Yotao",
    "San Nicolás",
    "San Nicolás Hidalgo",
    "San Pablo Coatlán",
    "San Pablo Cuatro Venados",
    "San Pablo Etla",
    "San Pablo Huitzo",
    "San Pablo Huixtepec",
    "San Pablo Macuiltianguis",
    "San Pablo Tijaltepec",
    "San Pablo Villa de Mitla",
    "San Pablo Yaganiza",
    "San Pedro Amuzgos",
    "San Pedro Apóstol",
    "San Pedro Atoyac",
    "San Pedro Cajonos",
    "San Pedro Coxcaltepec Cántaros",
    "San Pedro Comitancillo",
    "San Pedro el Alto",
    "San Pedro Huamelula",
    "San Pedro Huilotepec",
    "San Pedro Ixcatlán",
    "San Pedro Ixtlahuaca",
    "San Pedro Jaltepetongo",
    "San Pedro Jicayán",
    "San Pedro Jocotipac",
    "San Pedro Juchatengo",
    "San Pedro Mártir",
    "San Pedro Mártir Quiechapa",
    "San Pedro Mártir Yucuxaco",
    "San Pedro Mixtepec -Distrito 22-",
    "San Pedro Mixtepec -Distrito 26-",
    "San Pedro Molinos",
    "San Pedro Nopala",
    "San Pedro Ocopetatillo",
    "San Pedro Ocotepec",
    "San Pedro Pochutla",
    "San Pedro Quiatoni",
    "San Pedro Sochiapam",
    "San Pedro Tapanatepec",
    "San Pedro Taviche",
    "San Pedro Teozacoalco",
    "San Pedro Teutila",
    "San Pedro Tidaá",
    "San Pedro Topiltepec",
    "San Pedro Totolapa",
    "Villa de Tututepec de Melchor Ocampo",
    "San Pedro Yaneri",
    "San Pedro Yólox",
    "San Pedro y San Pablo Ayutla",
    "Villa de Etla",
    "San Pedro y San Pablo Teposcolula",
    "San Pedro y San Pablo Tequixtepec",
    "San Pedro Yucunama",
    "San Raymundo Jalpan",
    "San Sebastián Abasolo",
    "San Sebastián Coatlán",
    "San Sebastián Ixcapa",
    "San Sebastián Nicananduta",
    "San Sebastián Río Hondo",
    "San Sebastián Tecomaxtlahuaca",
    "San Sebastián Teitipac",
    "San Sebastián Tutla",
    "San Simón Almolongas",
    "San Simón Zahuatlán",
    "Santa Ana",
    "Santa Ana Ateixtlahuaca",
    "Santa Ana Cuauhtémoc",
    "Santa Ana del Valle",
    "Santa Ana Tavela",
    "Santa Ana Tlapacoyan",
    "Santa Ana Yareni",
    "Santa Ana Zegache",
    "Santa Catalina Quieri",
    "Santa Catarina Cuixtla",
    "Santa Catarina Ixtepeji",
    "Santa Catarina Juquila",
    "Santa Catarina Lachatao",
    "Santa Catarina Loxicha",
    "Santa Catarina Mechoacán",
    "Santa Catarina Minas",
    "Santa Catarina Quiané",
    "Santa Catarina Tayata",
    "Santa Catarina Ticuá",
    "Santa Catarina Yosonotú",
    "Santa Catarina Zapoquila",
    "Santa Cruz Acatepec",
    "Santa Cruz Amilpas",
    "Santa Cruz de Bravo",
    "Santa Cruz Itundujia",
    "Santa Cruz Mixtepec",
    "Santa Cruz Nundaco",
    "Santa Cruz Papalutla",
    "Santa Cruz Tacache de Mina",
    "Santa Cruz Tacahua",
    "Santa Cruz Tayata",
    "Santa Cruz Xitla",
    "Santa Cruz Xoxocotlán",
    "Santa Cruz Zenzontepec",
    "Santa Gertrudis",
    "Santa Inés del Monte",
    "Santa Inés Yatzeche",
    "Santa Lucía del Camino",
    "Santa Lucía Miahuatlán",
    "Santa Lucía Monteverde",
    "Santa Lucía Ocotlán",
    "Santa María Alotepec",
    "Santa María Apazco",
    "Santa María la Asunción",
    "Heroica Ciudad de Tlaxiaco",
    "Ayoquezco de Aldama",
    "Santa María Atzompa",
    "Santa María Camotlán",
    "Santa María Colotepec",
    "Santa María Cortijo",
    "Santa María Coyotepec",
    "Santa María Chachoápam",
    "Villa de Chilapa de Díaz",
    "Santa María Chilchotla",
    "Santa María Chimalapa",
    "Santa María del Rosario",
    "Santa María del Tule",
    "Santa María Ecatepec",
    "Santa María Guelacé",
    "Santa María Guienagati",
    "Santa María Huatulco",
    "Santa María Huazolotitlán",
    "Santa María Ipalapa",
    "Santa María Ixcatlán",
    "Santa María Jacatepec",
    "Santa María Jalapa del Marqués",
    "Santa María Jaltianguis",
    "Santa María Lachixío",
    "Santa María Mixtequilla",
    "Santa María Nativitas",
    "Santa María Nduayaco",
    "Santa María Ozolotepec",
    "Santa María Pápalo",
    "Santa María Peñoles",
    "Santa María Petapa",
    "Santa María Quiegolani",
    "Santa María Sola",
    "Santa María Tataltepec",
    "Santa María Tecomavaca",
    "Santa María Temaxcalapa",
    "Santa María Temaxcaltepec",
    "Santa María Teopoxco",
    "Santa María Tepantlali",
    "Santa María Texcatitlán",
    "Santa María Tlahuitoltepec",
    "Santa María Tlalixtac",
    "Santa María Tonameca",
    "Santa María Totolapilla",
    "Santa María Xadani",
    "Santa María Yalina",
    "Santa María Yavesía",
    "Santa María Yolotepec",
    "Santa María Yosoyúa",
    "Santa María Yucuhiti",
    "Santa María Zacatepec",
    "Santa María Zaniza",
    "Santa María Zoquitlán",
    "Santiago Amoltepec",
    "Santiago Apoala",
    "Santiago Apóstol",
    "Santiago Astata",
    "Santiago Atitlán",
    "Santiago Ayuquililla",
    "Santiago Cacaloxtepec",
    "Santiago Camotlán",
    "Santiago Comaltepec",
    "Santiago Chazumba",
    "Santiago Choápam",
    "Santiago del Río",
    "Santiago Huajolotitlán",
    "Santiago Huauclilla",
    "Santiago Ihuitlán Plumas",
    "Santiago Ixcuintepec",
    "Santiago Ixtayutla",
    "Santiago Jamiltepec",
    "Santiago Jocotepec",
    "Santiago Juxtlahuaca",
    "Santiago Lachiguiri",
    "Santiago Lalopa",
    "Santiago Laollaga",
    "Santiago Laxopa",
    "Santiago Llano Grande",
    "Santiago Matatlán",
    "Santiago Miltepec",
    "Santiago Minas",
    "Santiago Nacaltepec",
    "Santiago Nejapilla",
    "Santiago Nundiche",
    "Santiago Nuyoó",
    "Santiago Pinotepa Nacional",
    "Santiago Suchilquitongo",
    "Santiago Tamazola",
    "Santiago Tapextla",
    "Villa Tejúpam de la Unión",
    "Santiago Tenango",
    "Santiago Tepetlapa",
    "Santiago Tetepec",
    "Santiago Texcalcingo",
    "Santiago Textitlán",
    "Santiago Tilantongo",
    "Santiago Tillo",
    "Santiago Tlazoyaltepec",
    "Santiago Xanica",
    "Santiago Xiacuí",
    "Santiago Yaitepec",
    "Santiago Yaveo",
    "Santiago Yolomécatl",
    "Santiago Yosondúa",
    "Santiago Yucuyachi",
    "Santiago Zacatepec",
    "Santiago Zoochila",
    "Nuevo Zoquiapam",
    "Santo Domingo Ingenio",
    "Santo Domingo Albarradas",
    "Santo Domingo Armenta",
    "Santo Domingo Chihuitán",
    "Santo Domingo de Morelos",
    "Santo Domingo Ixcatlán",
    "Santo Domingo Nuxaá",
    "Santo Domingo Ozolotepec",
    "Santo Domingo Petapa",
    "Santo Domingo Roayaga",
    "Santo Domingo Tehuantepec",
    "Santo Domingo Teojomulco",
    "Santo Domingo Tepuxtepec",
    "Santo Domingo Tlatayapam",
    "Santo Domingo Tomaltepec",
    "Santo Domingo Tonalá",
    "Santo Domingo Tonaltepec",
    "Santo Domingo Xagacía",
    "Santo Domingo Yanhuitlán",
    "Santo Domingo Yodohino",
    "Santo Domingo Zanatepec",
    "Santos Reyes Nopala",
    "Santos Reyes Pápalo",
    "Santos Reyes Tepejillo",
    "Santos Reyes Yucuná",
    "Santo Tomás Jalieza",
    "Santo Tomás Mazaltepec",
    "Santo Tomás Ocotepec",
    "Santo Tomás Tamazulapan",
    "San Vicente Coatlán",
    "San Vicente Lachixío",
    "San Vicente Nuñú",
    "Silacayoápam",
    "Sitio de Xitlapehua",
    "Soledad Etla",
    "Villa de Tamazulapam del Progreso",
    "Tanetze de Zaragoza",
    "Taniche",
    "Tataltepec de Valdés",
    "Teococuilco de Marcos Pérez",
    "Teotitlán de Flores Magón",
    "Teotitlán del Valle",
    "Teotongo",
    "Tepelmeme Villa de Morelos",
    "Tezoatlán de Segura y Luna",
    "San Jerónimo Tlacochahuaya",
    "Tlacolula de Matamoros",
    "Tlacotepec Plumas",
    "Tlalixtac de Cabrera",
    "Totontepec Villa de Morelos",
    "Trinidad Zaachila",
    "La Trinidad Vista Hermosa",
    "Unión Hidalgo",
    "Valerio Trujano",
    "San Juan Bautista Valle Nacional",
    "Villa Díaz Ordaz",
    "Yaxe",
    "Magdalena Yodocono de Porfirio Díaz",
    "Yogana",
    "Yutanduchi de Guerrero",
    "Villa de Zaachila",
    "San Mateo Yacutindoo",
    "Zapotitlán Lagunas",
    "Zapotitlán Palmas",
    "Santa Inés de Zaragoza",
    "Zimatlán de Álvarez",
    "Otro"
  ];
  static List<String> asentamiento = [
    "Aeropuerto",
    "Ampliación",
    "Barrio",
    'Cantón',
    "Aeropuerto",
    "Ciudad",
    "Ciudad Industrial",
    'Colonia',
    "Condominio",
    "Conjunto Habitacional",
    "Corredor Industrial",
    'Coto',
    'Cuartel',
    "Ejido",
    "Exhacienda",
    "Fracción",
    'Fraccionamiento',
    "Granja",
    "Hacienda",
    "Ingenio",
    'Manzana',
    "Paraje",
    "Parque Industrial",
    "Privada",
    'Prolongación',
    'Pueblo',
    "Puerto",
    "Ranchería",
    "Rancho",
    'Región',
    'Residencial',
    "Rinconada",
    "Sección",
    "Sector",
    'Supermanzana',
    'Unidad',
    "Unidad Habitacional",
    "Villa",
    "Zona Federal",
    'Zona Industrial',
    'Zona Militar',
    "Zona Comercial",
    "Zona Naval",
    "Localidad",
  ];
  static List<String> vialidad = [
    "Calle",
    "Diagonal",
    "Eje Vial",
    "Pasaje",
    'Peatonal',
    "Periférico",
    "Privada",
    "Prolongación",
    'Retorno',
    "Viaducto"
  ];
  static List<String> entidades = [
    "Aguascalientes",
    "Baja California",
    "Baja California Sur",
    'Campeche',
    "Coahuila de Zaragoza",
    "Colima",
    "Chiapas",
    "Chihuahua",
    "Ciudad de México",
    "Durango",
    "Guanajuato",
    "Guerrero",
    "Hidalgo",
    "Jalisco",
    "Estado de México",
    "Michoacán de Ocampo",
    "Morelos",
    "Nayarit",
    "Nuevo León",
    "Oaxaca",
    "Puebla",
    "Queretaro",
    "Quintana Roo",
    "San Luis Potosi",
    "Sinaloa",
    "Sonora",
    "Tabasco",
    "Tamaulipas",
    "Tlaxcala",
    "Veracruz de Ignacio de la Llave",
    "Yucatán",
    "Zacatecas",
    "Extranjero",
  ];

  static String entidadFederativa = "Seleccionar";
  static String tipoVialidad = "Seleccionar";
  static String tipoAsentamiento = "Seleccionar";
  static String selectMunicipio = "Seleccionar";
  static String tipoSangre = "Seleccionar";
  static String curp = "";
  static String calle = "";
  static String numeroExterior = "";
  static String numeroInterior = "";
  static String colonia = "";
  static String otroEstado = "";
  static String codigoPostal = "";
  static String discapacidad = "";
  static String dDiscapacidad = "";
  static String dAlergia = "";
  static String alergia = "";
  static String telefonoMovil = "";
  static String telefonoFijo = "";
  static String paternoResponsable = "";
  static String maternoResponsable = "";
  static String nombreResponsable = "";
  static String fijoResponsable = "";
  static String movilResponsable = "";
  static String userEmail = "";
  static var nameFile = '';
  static var file = '';
  static String estadoCivil = '';
  static String tipoInscripcion = '';
  static String autoImagen = 'SI';

  static int r = 0;
  static int g = 0;
  static int b = 0;
  static String tallerClave = "";
  static String tallerImagen = "";
  static String dataUsuario =
      "https://casadelaculturaoaxaca.com/api/inscripciones/data";

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xff9D2449),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static ButtonStyle buttonGenerate = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xff9D2449),
    minimumSize: const Size(88, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static ButtonStyle buttonUpdate = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 197, 197, 197),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle botonConfirmEliminar = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static ButtonStyle botonCancelEliminar = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.red,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static double alertHorizontal1 = 0;
  static double alertVertical1 = 0;
  static double alertVertical2 = 0;

  static var rosa = const Color(0xff9D2449);
  static var grisFooter = const Color(0xff666666);
  static var reproduccion = false;
  static double widthTablet = 844;
  static bool responsive = false;
  static int index = 0;
  static int index2 = 0;
  static String colorEmail = "";
  static double sizeContainer = 240;
  static String edadUser =
      "https://casadelaculturaoaxaca.com/api/inscripciones/edad";
  static String edadUserString = "";
  static int edadUserInt = 0;
  static double widthDivider = 0;
  static int edadClaveMax = 0;
  static int edadClaveMin = 0;
  static String especialidad = "";
  static String tipoUsuario = "";
  static double width = 0;
  static int index3 = 0;
  static double anchoCarruselAniversario = 0;
  static String idCarruselAniversario = "";
  static String numAniversario = "";
  static String cabAniversario = "";
  static String encAniversario = "";
  static String exposicion = "";
  static String textoAniversario = "";
  static String idCarruselExposicion = "";
  static double anchoTituloActuales = 0;
  static double anchoImagenActuales = 0;
  static double anchoImagenExposicion = 0;
  static double anchoTextdetalleExposicion = 0;
  static double anchoTextdetalleActi = 0;
  static String preImages = "https://casadelaculturaoaxaca.com/images/";
  static String rutaaudio = "";
  static const urlFacebook =
      'https://www.facebook.com/casadelaculturaoaxaquena/';
  static const urlTwitter =
      "https://twitter.com/CCO_GobOax?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor";
  static const urlInstagram =
      "https://www.instagram.com/casadelaculturaoaxaquena/?hl=es-la";
  static const urlYoutube = "https://www.youtube.com/@casadelaculturaoaxaquena";
  static const urlMail =
      "mailto:casaculturaoax@gmail.com?subject=Micrositio&body=";
  static const urlPhone = "tel:951 516 11 54";
  static const urlSpotify =
      "https://open.spotify.com/show/2jAHPDy9sBBP0lyPkkUmVz";
  static const urlGoogle =
      "https://www.google.com/podcasts?feed=aHR0cHM6Ly9hbmNob3IuZm0vcy81OTdmODAyNC9wb2RjYXN0L3Jzcw==";
  static const urlApple =
      "https://podcasts.apple.com/mx/podcast/CCO-cultural/id1566072266";

  static String fontHelBlack = "HelveticaBlack";
  static String fontHelBold = "HelveticaBold";
  static String fontHelMedium = "HelveticaMedium";
  static String fontHelLight = "HelveticaLight";
  static String fontHelItalica = "HelveticaItalic";
  static String fontHelRegular = "HelveticaRegular";

  static double sizeTitle1 = 50;
  static double sizeTitle2 = 30;
  static double sizeTitle3 = 16;
  static double sizeTitle3_2 = 16;
  // ignore: non_constant_identifier_names
  static double sizeTitle3_A = 14;
  static double sizeTitle4 = 14;
  static double sizeTitle5 = 10;
  static double sizeTitle6 = 8;
  static double sizeTitle7 = 6;

  static String passLogin = "";
  static String passSesion = "";
  static String correoRestored = "";
  static String correoRegistro = "";
  static String correoRegistro2 = "";
  static String passRegistro = "";
  static bool responsiveIns = false;

  static OutlineInputBorder form1 = const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff9D2449)),
      borderRadius: BorderRadius.all(Radius.circular(5)));

  static OutlineInputBorder form1_1 = const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(237, 158, 158, 158)),
      borderRadius: BorderRadius.all(Radius.circular(5)));

  static ButtonStyle raisedButtonStyl2 = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xff9D2449),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  static ButtonStyle color1 = OutlinedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: Colors.white);
  static ButtonStyle color2 = OutlinedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: rosa);

  static bool bio = true;
  static bool sala = false;
  static bool obra = false;
  static bool video = false;

  static List<Entry> data = <Entry>[
    Entry("INICIO", 0,
        <Entry>[Entry("Home", 10), Entry("Acerca", 11), Entry("Visita", 12)]),
    Entry("ESPACIOS", 1),
    Entry("EXPOSICIONES", 2),
    Entry("CARTELERA", 3),
    Entry("ANIVERSARIO", 4),
    Entry("PODCAST", 6),
    Entry("INSCRIPCIONES", 7),
  ];
}

class Entry {
  late final String title;
  late final int opcion;
  final List<Entry> children;
  Entry(this.title, this.opcion, [this.children = const <Entry>[]]);
}
