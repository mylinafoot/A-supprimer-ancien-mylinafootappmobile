import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/pages/rapports/rapport_controller.dart';
import 'package:svg_flutter/svg.dart';

class ListArbitre extends StatelessWidget {
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  //
  String des;
  ListArbitre(this.des);
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
                children: List.generate(RapportController.commissaires.length,
                    (index) {
                  //
                  Map equipe = RapportController.commissaires[index];
                  //
                  if ("${equipe['nom']}"
                      .toLowerCase()
                      .contains(mot.value.toLowerCase())) {
                    //
                    return ListTile(
                      onTap: () {
                        //
                        if (des == "Arbitre central") {
                          commissaireController.arbitreCentral.value = equipe;
                          arbitreController.arbitreCentral.value = equipe;
                        }
                        //
                        if (des == "Arbitre assistant 1") {
                          commissaireController.arbitreAssistant1.value =
                              equipe;
                          arbitreController.arbitreAssistant1.value = equipe;
                        }
                        //
                        if (des == "Arbitre assistant 2") {
                          commissaireController.arbitreAssistant2.value =
                              equipe;
                          arbitreController.arbitreAssistant2.value = equipe;
                        }

                        if (des == "Arbitre protocolaire") {
                          commissaireController.arbitreProtocolaire.value =
                              equipe;
                          arbitreController.arbitreProtocolaire.value = equipe;
                        }
                        Get.back();
                      },
                      leading: SvgPicture.asset(
                        'assets/IcBaselineSportsSoccer.svg',
                        width: 25,
                        height: 25,
                        color: Colors.blue,
                        semanticsLabel: 'GalaPortrait1.svg',
                      ),
                      title: Text("${equipe['nom']}"),
                      subtitle: Text("${equipe['league']}"),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
