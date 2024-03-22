import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/utils/paiement_controller.dart';
import 'pages/accueil.dart';
import 'pages/historique/historique_controller.dart';
import 'pages/live/live_controller.dart';
import 'pages/login/login.dart';
import 'pages/login/login_controller.dart';
import 'pages/programme/programme_controller.dart';
import 'pages/rapports/arbitre/arbitre_controller.dart';
import 'pages/rapports/officier/officier_controller.dart';
import 'pages/splash.dart';
import 'utils/paiement.dart';

void main() async {
  //
  LoginController loginController = Get.put(LoginController());
  //
  HistoriqueController historiqueController = Get.put(HistoriqueController());
  //
  ProgrammeController programmeController = Get.put(ProgrammeController());
  //
  LiveController liveController = Get.put(LiveController());
  //
  CommissaireController commissaireController =
      Get.put(CommissaireController());
  //
  ArbitreController arbitreController = Get.put(ArbitreController());
  //
  OfficierController officierController = Get.put(OfficierController());
  //
  PaiementController paiementController = Get.put(PaiementController());
  //
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  //
  await GetStorage.init();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //
  var box = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    //box.erase();
    //
    return GetMaterialApp(
        title: 'Linafoot',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
          colorScheme: const ColorScheme.dark(primary: Colors.red),
          textTheme: const TextTheme(
            titleSmall: TextStyle(fontSize: 10),
          ),
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),

          useMaterial3: true,
          //cardColor: Colors.white,
        ),
        home:
            //Paiement()
            //Login(3),
            Splash()
        //Accueil(),
        );
  }
}
