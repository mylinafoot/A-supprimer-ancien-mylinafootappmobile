import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/arbitre/formulaire_arb_5/action_match.dart';
import 'package:svg_flutter/svg_flutter.dart';

class FormulaireArb5 extends StatelessWidget {
  //
  PageController controller;
  //
  ArbitreController arbitreController = Get.find();
  //
  FormulaireArb5(this.controller);

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Avertissements joueurs",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  Get.to(ActionMatch("Avertissements joueurs"));
                },
                title: const Text("Ajouter"),
                //carte.svg
                trailing: SvgPicture.asset(
                  'assets/carte.svg',
                  width: 30,
                  height: 30,
                  semanticsLabel: 'carte.svg',
                  color: Colors.yellow.shade700,
                ),
                //const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    arbitreController.avertissementsJoueursGeneral.length,
                    (index) {
                      Map infos =
                          arbitreController.avertissementsJoueursGeneral[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.yellow.shade700,
                        ),
                        title: Text("${infos['equipe']['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            arbitreController.avertissementsJoueursGeneral
                                .removeAt(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Expulsions joueurs",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  Get.to(ActionMatch("Expulsions joueurs"));
                },
                title: const Text("Ajouter"),
                trailing: SvgPicture.asset(
                  'assets/carte.svg',
                  width: 30,
                  height: 30,
                  semanticsLabel: 'carte.svg',
                  color: Colors.red.shade700,
                ),
                //const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    arbitreController.expulssionsJoueursGeneral.length,
                    (index) {
                      Map infos =
                          arbitreController.expulssionsJoueursGeneral[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.red.shade700,
                        ),
                        title: Text("${infos['equipe']['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            arbitreController.expulssionsJoueursGeneral
                                .removeAt(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Buts joueurs",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  Get.to(ActionMatch("Buts joueurs"));
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    arbitreController.butsJoueursGeneral.length,
                    (index) {
                      Map infos = arbitreController.butsJoueursGeneral[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcBaselineSportsSoccer.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcBaselineSportsSoccer.svg',
                        ),
                        title: Text("${infos['equipe']['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            arbitreController.butsJoueursGeneral
                                .removeAt(index);
                            //
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Text(
        //     "Arbitre protocolaire",
        //     style: textStyle,
        //   ),
        // ),
        // Container(
        //   //height: 70,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(
        //       color: Colors.grey.shade600,
        //     ),
        //   ),
        //   child: Column(
        //     children: [
        //       ListTile(
        //         onTap: () {
        //           //
        //         },
        //         title: const Text("Ajouter"),
        //         trailing: const Icon(Icons.add),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           //
        //         },
        //         leading: SvgPicture.asset(
        //           'assets/IcTwotoneSports.svg',
        //           width: 25,
        //           height: 25,
        //           semanticsLabel: 'IcTwotoneSports.svg',
        //         ),
        //         title: const Text("TELESI KIBOMA PATRICK"),
        //         subtitle: const Text("A3"),
        //         trailing: const Icon(
        //           Icons.delete,
        //           color: Colors.red,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // //
        const SizedBox(
          height: 20,
        ),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //
                controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                //
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                height: 50,
                width: 100,
                child: const Text(
                  "Retour",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                //
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                height: 50,
                width: 100,
                child: const Text(
                  "Suivant 7/9",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
