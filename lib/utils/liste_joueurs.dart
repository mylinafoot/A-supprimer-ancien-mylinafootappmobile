import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';
import 'package:linafoot/pages/rapports/rapport_controller.dart';
import 'package:svg_flutter/svg.dart';

class ListJoueurs extends StatelessWidget {
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  OfficierController officierController = Get.find();
  //
  String des;
  //
  RxList equipes = [].obs;
  //
  ListJoueurs(this.des, int equipe) {
    //
    if (equipe == 1) {
      //
      equipes.value = RapportController.joueurEquipeA;
    } else {
      //
      equipes.value = RapportController.joueurEquipeB;
    }
  }
  //
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
            child: Obx(
              () => ListView(
                children: List.generate(equipes.length, (index) {
                  //
                  Map equipe = equipes[index];
                  //
                  if ("${equipe['nom']}"
                      .toLowerCase()
                      .contains(mot.value.toLowerCase())) {
                    //
                    return ListTile(
                      onTap: () {
                        //ListJoueurs
                        if ("Avertissements joueurs" == des) {
                          commissaireController.avertissementsJoueurs.clear();
                          commissaireController.avertissementsJoueurs
                              .add(equipe);
                          //
                          arbitreController.avertissementsJoueurs.clear();
                          arbitreController.avertissementsJoueurs.add(equipe);
                          //
                          officierController.avertissementsJoueurs.clear();
                          officierController.avertissementsJoueurs.add(equipe);
                        }
                        //
                        if ("Buts joueurs" == des) {
                          commissaireController.butsJoueurs.clear();
                          commissaireController.butsJoueurs.add(equipe);
                          //
                          arbitreController.butsJoueurs.clear();
                          arbitreController.butsJoueurs.add(equipe);
                          //
                          officierController.butsJoueurs.clear();
                          officierController.butsJoueurs.add(equipe);
                        }
                        //
                        if ("Expulsions joueurs" == des) {
                          commissaireController.expulssionsJoueurs.clear();
                          commissaireController.expulssionsJoueurs.add(equipe);
                          //
                          arbitreController.expulssionsJoueurs.clear();
                          arbitreController.expulssionsJoueurs.add(equipe);
                          //
                          officierController.expulssionsJoueurs.clear();
                          officierController.expulssionsJoueurs.add(equipe);
                        }
                        if ("autre A" == des) {
                          //joueurEqupeA
                          arbitreController.joueurEqupeA.add(equipe);
                          //
                          //officierController.joueurEqupeA.add(equipe);
                        }
                        if ("autre B" == des) {
                          //joueurEqupeA
                          arbitreController.joueurEqupeB.add(equipe);
                          //
                          //officierController.joueurEqupeB.add(equipe);
                        }
                        //
                        if ("autre A r" == des) {
                          //joueurEqupeA
                          arbitreController.joueurEquipeRemplacantA.add(equipe);
                          //
                          //officierController.joueurEquipeRemplacantA.add(equipe);
                        }
                        if ("autre B r" == des) {
                          //joueurEqupeA
                          arbitreController.joueurEquipeRemplacantB.add(equipe);
                          //

                          //officierController.joueurEquipeRemplacantB.add(equipe);
                        }
                        //
                        if ("entrant" == des) {
                          //joueurEqupeA
                          arbitreController.joueurRemplacantEntrant.value =
                              equipe;
                          //
                          officierController.joueurRemplacantEntrant.value =
                              equipe;
                        }
                        if ("sortant" == des) {
                          //joueurEqupeA
                          arbitreController.joueurRemplacantSortant.value =
                              equipe;
                          //
                          officierController.joueurRemplacantSortant.value =
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
                      title: Text(
                          "${equipe['nom']} ${equipe['postnom'] ?? ''} ${equipe['prenom'] ?? ''}"),
                      subtitle: Text("${equipe['numero']}"),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
