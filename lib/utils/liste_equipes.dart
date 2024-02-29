import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/pages/rapports/rapport_controller.dart';
import 'package:svg_flutter/svg.dart';

class ListEquipe extends StatelessWidget {
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  //
  String des;
  ListEquipe(this.des) {
    //
  }
  //
  RxList equipes = [].obs;
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
              children:
                  List.generate(RapportController.equipes.length, (index) {
                //
                Map equipe = RapportController.equipes[index];
                //
                if ("${equipe['nom']}".contains(mot.value)) {
                  //
                  return ListTile(
                    onTap: () {
                      //
                      if (des == "Equipe") {
                        commissaireController.equipe.value = equipe;
                        arbitreController.equipe.value = equipe;
                      }
                      //
                      if (des == "Equipe A") {
                        commissaireController.equipeA.value = equipe;
                        arbitreController.equipeA.value = equipe;
                      }
                      //
                      if (des == "Equipe B") {
                        commissaireController.equipeB.value = equipe;
                        arbitreController.equipeB.value = equipe;
                      }
                      //
                      if (des == "Choix Equipe A") {
                        commissaireController.equipeA.value = equipe;
                        arbitreController.equipeA.value = equipe;
                      }

                      if (des == "Choix Equipe B") {
                        commissaireController.equipeB.value = equipe;
                        arbitreController.equipeB.value = equipe;
                      }
                      //
                      Get.back();
                      //
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
