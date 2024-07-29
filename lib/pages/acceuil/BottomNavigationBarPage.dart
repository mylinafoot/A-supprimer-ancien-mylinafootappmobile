import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/live/direct.dart';
import 'package:linafoot/pages/programme/programme.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../actus/actus.dart';
import '../plus.dart';
import 'AccueilPage.dart';

class BottomNavigationBarPage extends StatelessWidget {
  //Choix//Historique//Programme//Live//Statistique//

  //
  Rx vue = Rx(AccueilPage());
  //
  BottomNavigationBarPage({super.key}) {
    //
    _controller = PersistentTabController(initialIndex: 0);
  }
  //
  late PersistentTabController _controller;

  //
  RxInt currentIndex = 0.obs;
  //
  List rencontres = [
    ["AS DAUPHIN NOIR.png", "AS MANIEMA UNION.png"],
  ];
  //
  List vues = [
    {"titre": "Accueil", "icon": "IcBaselineSportsSoccer.svg"},
    {"titre": "Match en direct", "icon": "IonSocialYoutubeOutline.svg"},
    {"titre": "Calendrier", "icon": "GalaEditor.svg"},
    {"titre": "Achat billet", "icon": "MakiSoccer11.svg"},
    {"titre": "Admin", "icon": "GalaPortrait1.svg"},
    //{"titre": "A propos", "icon": "IonHelpOutline.svg"},
  ];

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      body: Stack(
        children: [
          Obx(() => vue.value)
        ],
      ),
      bottomNavigationBar: Obx(
            () => Theme( // Ajout du Theme local
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFFFF5050), // Couleur de fond FF5050
            //primaryColor: Colors.white, // Couleur des éléments sélectionnés (optionnel)
          ),
          child: BottomNavigationBar(
            onTap: (e) {
              //
              currentIndex.value = e;
              //
              if (e == 0) {
                vue.value = AccueilPage();
              }
              if (e == 1) {
                vue.value = Programme();
              }
              // if (e == 2) {
              //   vue.value = Statistique();
              // }
              if (e == 2) {
                vue.value = Direct();
              }
              if (e == 3) {
                vue.value = Actualites();
              }
              // if (e == 5) {
              //   vue.value = Sababalar();
              // }
              if (e == 4) {
                vue.value = Plus();
              }
            },
            currentIndex: currentIndex.value,
            unselectedItemColor: Colors.white38,
            selectedItemColor: Loader.backgroundColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Accueil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "Calendrier"),
              //BottomNavigationBarItem(
              //  icon: Icon(CupertinoIcons.chart_pie), label: "Classements"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle), label: "Direct"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.language), label: "Actualité"),
              //BottomNavigationBarItem(icon: Icon(Icons.games), label: "Jeux"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: "Plus"),
            ],
          ),
        ),
      ),
    );
  }
}
