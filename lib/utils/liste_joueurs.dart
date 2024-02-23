import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:svg_flutter/svg.dart';

class ListJoueurs extends StatelessWidget {
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  //
  String des;
  ListJoueurs(this.des);
  //
  RxList equipes = [
    {
      "nom": "Kalala Nzimbula Pierre",
      "equipe": "TP MAZEMBE",
      "categorie": "A1"
    },
    {
      "nom": "Nzimbula Kalala André",
      "equipe": "TP MAZEMBEv",
      "categorie": "A1"
    },
    {"nom": "Kalubi Nzimbula Annee", "equipe": "TP MAZEMBE", "categorie": "A2"},
    {"nom": "Nzita Lukasa Agé", "equipe": "TP MAZEMBE", "categorie": "A1"},
    {"nom": "Mokilo Mokamba Jack", "equipe": "AS V.CLUB", "categorie": "A3"},
    {"nom": "Mokilo Nzimbula Arise", "equipe": "AS V.CLUB", "categorie": "A3"},
    {"nom": "Kalala Mbaka Arsene", "equipe": "AS V.CLUB", "categorie": "A1"},
    {
      "nom": "Mokamba Nzimbula Patou",
      "equipe": "DCMP MOTEMA PEMBE",
      "categorie": "A2"
    },
    {
      "nom": "Kalala Nzimbula Pierre",
      "equipe": "DCMP MOTEMA PEMBE",
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
                      //ListJoueurs
                      if ("Avertissements joueurs" == des) {
                        commissaireController.avertissementsJoueurs.clear();
                        commissaireController.avertissementsJoueurs.add(equipe);
                        //
                        arbitreController.avertissementsJoueurs.clear();
                        arbitreController.avertissementsJoueurs.add(equipe);
                      }
                      //
                      if ("Buts joueurs" == des) {
                        commissaireController.butsJoueurs.clear();
                        commissaireController.butsJoueurs.add(equipe);
                        //
                        arbitreController.butsJoueurs.clear();
                        arbitreController.butsJoueurs.add(equipe);
                      }
                      //
                      if ("Expulsions joueurs" == des) {
                        commissaireController.expulssionsJoueurs.clear();
                        commissaireController.expulssionsJoueurs.add(equipe);
                        //
                        arbitreController.expulssionsJoueurs.clear();
                        arbitreController.expulssionsJoueurs.add(equipe);
                      }
                      if ("autre A" == des) {
                        //joueurEqupeA
                        arbitreController.joueurEqupeA.add(equipe);
                      }
                      if ("autre B" == des) {
                        //joueurEqupeA
                        arbitreController.joueurEqupeB.add(equipe);
                      }
                      //
                      if ("autre A r" == des) {
                        //joueurEqupeA
                        arbitreController.joueurEquipeRemplacantA.add(equipe);
                      }
                      if ("autre B r" == des) {
                        //joueurEqupeA
                        arbitreController.joueurEquipeRemplacantB.add(equipe);
                      }
                      //
                      if ("entrant" == des) {
                        //joueurEqupeA
                        arbitreController.joueurRemplacantEntrant.value =
                            equipe;
                      }
                      if ("sortant" == des) {
                        //joueurEqupeA
                        arbitreController.joueurRemplacantSortant.value =
                            equipe;
                      }
                      //
                      Get.back();
                      //
                    },
                    leading: SvgPicture.asset(
                      'assets/MakiSoccer11.svg',
                      width: 25,
                      height: 25,
                      color: Colors.blue,
                      semanticsLabel: 'MakiSoccer11.svg',
                    ),
                    title: Text("${equipe['nom']}"),
                    subtitle: Text("${equipe['equipe']}"),
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
