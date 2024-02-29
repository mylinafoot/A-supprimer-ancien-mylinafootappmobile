import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';
import 'package:svg_flutter/svg.dart';

class ListStades extends StatelessWidget {
  //
  ListStades();
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  OfficierController officierController = Get.find();
  //
  /**
   * 1. Tata Raphaël 
2. Kindu Joseph Kabila 
3. Kibasa Maliba (L'shi) 
4. Goma : Stade de L'unité 
5. L'shi : KAMALONDO (T P Mazembe).
   */
  RxList equipes = [
    {"nom": "Tata Raphaël", "province": "Kinshasa", "categorie": "A2"},
    {"nom": "Kindu Joseph Kabila", "province": "Kundi", "categorie": "A2"},
    {
      "nom": "Kibasa Maliba (L'shi)",
      "province": "Lubumbashi",
      "categorie": "A3"
    },
    {"nom": "Goma : Stade de L'unité", "province": "Goma", "categorie": "A2"},
    {
      "nom": "L'shi : KAMALONDO (T P Mazembe)",
      "province": "Lubumbashi",
      "categorie": "A1"
    },
  ].obs;
  //
  RxString mot = "".obs;

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: (t) {
                //
                mot.value = t;
                //
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: List.generate(equipes.length, (index) {
                //
                Map equipe = equipes[index];
                //
                if ("${equipe['nom']}".contains(mot.value)) {
                  //
                  return ListTile(
                    onTap: () {
                      //
                      commissaireController.stade.value = equipe;
                      arbitreController.stade.value = equipe;
                      officierController.stade.value = equipe;
                      Get.back();
                      // if (des == "Equipe A") {}
                      // //
                      // if (des == "Equipe B") {}
                      // //
                      // if (des == "Choix Equipe A") {}

                      // if (des == "Choix Equipe B") {}
                    },
                    leading: SvgPicture.asset(
                      'assets/IcBaselineSportsSoccer.svg',
                      width: 25,
                      height: 25,
                      color: Colors.blue,
                      semanticsLabel: 'GalaPortrait1.svg',
                    ),
                    title: Text("${equipe['nom']}"),
                    subtitle: Text("${equipe['province']}"),
                  );
                } else {
                  return Container();
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
