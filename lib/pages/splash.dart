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
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                'assets/mylinafoot.jpg',
                //'assets/LOGO LINAFOOT RDC.png',
                width: 200,
                height: 200,
              ),
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/illicocash png.png',
                //'assets/LOGO LINAFOOT RDC.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//#DD0707