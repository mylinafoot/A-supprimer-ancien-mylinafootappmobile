import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/pages/login/login.dart';
import 'package:linafoot/utils/loader.dart';

import 'choix.dart';
import 'live/direct3.dart';
import 'statistique/statistique.dart';

class Splash extends StatelessWidget {
  Splash() {
    //
    initializeDateFormatting('Fr');
    //
    Timer(const Duration(seconds: 2), () {
      //
      //Get.offAll(Choix());
      //Get.offAll(Login());
      //Get.offAll(const Direct3());
      Get.offAll(Accueil());
    });
  }
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(140),
              ),
              child: Image.asset(
                'assets/mylinafoot.jpg',
                //'assets/LOGO LINAFOOT RDC.png',
                width: 200,
                height: 200,
              ),
            ),
            Container(
              height: 180,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sponsorisé par:",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 200,
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
            const SizedBox(
              height: 10,
            ),
            Column(
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
            ),
          ],
        ),
      ),
    );
  }
}

//#DD0707