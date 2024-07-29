import 'dart:async';
import 'package:linafoot/controllers/ControlerPremierParametreInstallation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../acceuil/BottomNavigationBarPage.dart';
import 'DecouvertePage1.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen() {
    initializeDateFormatting('Fr');
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var ctrl = context.read<ControlerPremierParametreInstallation>();

    Timer(const Duration(seconds: 5), () {
      //Ici nous disons : Lors de la première installation de l'application
      //L'utilisateur peut voir les pages bienvenu où l'on explique
      //les avantages de l'application. Après il ne le vera plus.
      //Il passera du splashScreen à la page accueil directement.
      if (ctrl.isFirstTimeBienvenue) { // Vérifiez que isFirstTimeBienvenue existe
        //Get.offAll(() => AccueilPage());
        //Get.offAll(AccueilPage());
        Get.offAll(BottomNavigationBarPage());
      } else {
        Get.offAll(DecouvertePage1());
      }
    });
  }

  void _precacheImages(BuildContext context) {
    precacheImage(AssetImage('assets/mylinafoot.jpg'), context);
    precacheImage(AssetImage('assets/illicocash png.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    _precacheImages(context); // Appel à precacheImage dans build
    return Scaffold(
      //backgroundColor: Loader.backgroundColor,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.37),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.height * 0.12,
              child: Image.asset(
                'assets/mylinafoot.jpg',
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.24),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sponsorisé par:",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.107,
                    decoration: BoxDecoration(
                      //color: Colors.yellow,
                      image: DecorationImage(
                          image: ExactAssetImage("assets/illicocash png.png"),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001)
            /*Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 30,
                  width: 200,
                  child: const Text(
                    "Propriété de la Linafoot, tout droit reservé.",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 30,
                  width: 200,
                  child: const Text(
                    "écrit par EcosysRdc",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}

//#DD0707