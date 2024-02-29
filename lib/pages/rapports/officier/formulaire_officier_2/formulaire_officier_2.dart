import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'action_match.dart';

class FormulaireOffice2 extends StatelessWidget {
  //
  PageController controller;
  //
  OfficierController officierController = Get.find();
  //
  FormulaireOffice2(this.controller);

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
            "Avertissements joueurs equipe A",
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
                  Get.to(ActionMatch("Avertissements joueurs", 1));
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
                    officierController.avertissementsJoueursGeneralA.length,
                    (index) {
                      Map infos = officierController
                          .avertissementsJoueursGeneralA[index];
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
                        title: Text("${officierController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.avertissementsJoueursGeneralA
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
            "Expulsions joueurs equipe A",
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
                  Get.to(ActionMatch("Expulsions joueurs", 1));
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
                    officierController.expulssionsJoueursGeneralA.length,
                    (index) {
                      Map infos =
                          officierController.expulssionsJoueursGeneralA[index];
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
                        title: Text("${officierController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.expulssionsJoueursGeneralA
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
            "Buts joueurs equipe A",
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
                  Get.to(ActionMatch("Buts joueurs", 1));
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.butsJoueursGeneralA.length,
                    (index) {
                      Map infos = officierController.butsJoueursGeneralA[index];
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
                        title: Text("${officierController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.butsJoueursGeneralA
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
        //_________________________________________________
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Avertissements joueurs equipe B",
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
                  Get.to(ActionMatch("Avertissements joueurs", 2));
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
                    officierController.avertissementsJoueursGeneralB.length,
                    (index) {
                      Map infos = officierController
                          .avertissementsJoueursGeneralB[index];
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
                        title: Text("${officierController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.avertissementsJoueursGeneralB
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
            "Expulsions joueurs equipe B",
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
                  Get.to(ActionMatch("Expulsions joueurs", 2));
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
                    officierController.expulssionsJoueursGeneralB.length,
                    (index) {
                      Map infos =
                          officierController.expulssionsJoueursGeneralB[index];
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
                        title: Text("${officierController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.expulssionsJoueursGeneralB
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
            "Buts joueurs equipe B",
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
                  Get.to(ActionMatch("Buts joueurs", 2));
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.butsJoueursGeneralB.length,
                    (index) {
                      Map infos = officierController.butsJoueursGeneralB[index];
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
                        title: Text("${officierController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            officierController.butsJoueursGeneralB
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
                  "Suivant 2/4",
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
