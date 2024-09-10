import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:micrositio_cco/src/screens/administrativo/admin_registros.dart';
import 'package:micrositio_cco/src/screens/administrativo/home_admin.dart';
import 'package:micrositio_cco/src/screens/administrativo/home_general.dart';
import 'package:micrositio_cco/src/screens/administrativo/home_jefe.dart';
import 'package:micrositio_cco/src/screens/administrativo/home_user.dart';
import 'package:micrositio_cco/src/screens/administrativo/login.dart';
import 'package:micrositio_cco/src/screens/administrativo/user_base_listas.dart';
import 'package:micrositio_cco/src/screens/administrativo/usuario_generico_registros.dart';
import 'package:micrositio_cco/src/screens/inscripciones/bienvenida.dart';
import 'package:micrositio_cco/src/screens/inscripciones/contrasennia.dart';
import 'package:micrositio_cco/src/screens/inscripciones/credencial.dart';
import 'package:micrositio_cco/src/screens/inscripciones/disciplina.dart';
import 'package:micrositio_cco/src/screens/inscripciones/especialidades.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion1.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion2.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion3.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion4.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion5.dart';
import 'package:micrositio_cco/src/screens/inscripciones/formulario/identificacion6.dart';
import 'package:micrositio_cco/src/screens/inscripciones/home_beneficiario.dart';
import 'package:micrositio_cco/src/screens/inscripciones/registro.dart';
import 'package:micrositio_cco/src/screens/inscripciones/talleres.dart';
import 'package:micrositio_cco/src/screens/micrositio/aniversario_detalle.dart';
import 'package:micrositio_cco/src/screens/micrositio/detalle_evento.dart';
import 'package:micrositio_cco/src/screens/micrositio/detalle_virtual.dart';
import 'package:micrositio_cco/src/screens/micrositio/episodio_screen.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/alfonso.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/andres.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/arcelia.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/atanasio.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/margarita.dart';
import 'package:micrositio_cco/src/screens/micrositio/espacios/rufino.dart';
import 'package:micrositio_cco/src/screens/micrositio/exposicion_detalle.dart';
import 'package:micrositio_cco/src/screens/micrositio/home.dart';
import 'package:micrositio_cco/src/screens/micrositio/inscripciones.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';



void main() {
  runApp(
                VRouter(
                localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('es'),
                  ],
                  title: 'CCO',
                  debugShowCheckedModeBanner: false,
                  builder: FlutterSmartDialog.init(),
                  initialUrl: '/inscripciones',
                  routes: [
                        VWidget(path: '/home2/:id/:sub/:sub2', widget: const MyApp()),
                        VWidget(path: '/home/:id/:sub/:sub2', widget: const HomeScreen()),
                        VWidget(path: '/rufino', widget: const RufinoTamayoScreen()),
                        VWidget(path: '/inscripciones', widget: const Inscripciones()),
                        VWidget(path: '/alfonso', widget: const AlfonsoRivasScreen()),
                        VWidget(path: '/andres', widget: const AndresHenestrosaScreen()),
                        VWidget(path: '/arcelia', widget: const ArceliaScreen()),
                        VWidget(path: '/atanasio', widget: const AtanasioGarciaScreen()),
                        VWidget(path: '/margarita', widget: const MargaritaMazaScreen()),
                        VWidget(path: '/episodio/:id', widget: const EpisodioScreen()),
                        VWidget(path: '/registro', widget: const RegistroInscripciones()),
                        VWidget(path: '/detalleExposicion/:id', widget: const ExposicionDetalle()),
                        VWidget(path: '/detalleAniversario/:id', widget: const AniversarioDetalleScreen()),
                        VWidget(path: '/aniversario', widget: const AniversarioDetalleScreen()),
                        VWidget(path: '/bienvenida', widget: const Bienvenida()),
                        VWidget(path: '/formulario1', widget: const IdentificacionPage1()),
                        VWidget(path: '/formulario2', widget: const IdentificacionPage2()),
                        VWidget(path: '/formulario3', widget: const IdentificacionPage3()),
                        VWidget(path: '/formulario4', widget: const IdentificacionPage4()),
                        VWidget(path: '/formulario5', widget: const IdentificacionPage5()),
                        VWidget(path: '/formulario6', widget: const IdentificacionPage6()),
                        VWidget(path: '/disciplina', widget: const DisciplinaScreen()),
                        VWidget(path: '/especialidad', widget: const EspecialidadesScreen()),
                        VWidget(path: '/resPassword', widget: const RestoredPassword()),
                        VWidget(path: '/talleres', widget: const TalleresScreen()),
                        VWidget(path: '/loginAd', widget: const LoginAdministrativo()),
                        VWidget(path: '/homeUser', widget: const HomeUserScreen()),
                        VWidget(path: '/adminRegistros', widget: const RegistrosAdminScreen()),
                        VWidget(path: '/homeAdmin', widget: const HomeAdminScreen()),
                        VWidget(path: '/homeGeneral', widget: const HomeGeneralScreen()),
                        VWidget(path: '/general', widget: const RegistrosGenericosScreen()),
                        VWidget(path: '/homeJefe', widget: const HomeJefeScreen()),
                        VWidget(path: '/credencial', widget: const CredencialScreen()),
                        VWidget(path: '/homeBenefit', widget: const HomeBeneficiarioScreen()),
                        VWidget(path: '/registros', widget: const RegistrosAdminScreen()),
                        VWidget(path: '/detalleEvento/:id', widget: const DetalleEventoScreen()),
                        VWidget(path: '/detalleVirtual/:id', widget: const DetalleVirtualScreen()),
                        VWidget(path: '/userCredencial', widget: const UserBaseListasScreen()),
                  ],
            ),
  );
}