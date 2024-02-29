import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';

import 'remplacement.dart';

class FormulaireOffice3 extends StatelessWidget {
  //
  PageController controller;
  //
  OfficierController officierController = Get.find();
  //
  FormulaireOffice3(this.controller);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Remplacements equipes A",
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
                  Get.to(Remplacement("Equipe A"));
                  //
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.joueurRemplacantA.length,
                    (i) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              onTap: () {
                                //
                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              title: Text(
                                  "${officierController.joueurRemplacantA[i]['entrant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['entrant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantA
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                //
                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              title: Text(
                                  "${officierController.joueurRemplacantA[i]['sortant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['sortant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantA
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text("Minute:"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['minute']}"),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
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
                  "Suivant 3/4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
