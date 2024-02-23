import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/soumettre.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'evaluation.dart';

class FormulaireCom7 extends StatelessWidget {
  //
  var box = GetStorage();
  //
  Map match;
  //
  PageController controller;
  //
  TextEditingController commentaire = TextEditingController();
  //
  CommissaireController commissaireController = Get.find();
  //
  RxInt difficulte = 1.obs;
  List difficultes = [
    "Match facile",
    "Match difficile",
    "Match très difficile",
  ];
  //
  FormulaireCom7(this.controller, this.match);

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitres assistants",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          //height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //commissaireController
                  Get.to(Evaluation("Evaluation des arbitres assistants"));
                },
                leading: Icon(Icons.person),
                title: Text("Ajouter"),
                //subtitle: Text(""),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.evaluationArbitreAssistant.length,
                    (index) {
                      //
                      Map e = commissaireController
                          .evaluationArbitreAssistant[index];
                      //
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text(e['arbitre']['nom']),
                        subtitle: Text(e['evaluation']),
                        trailing: IconButton(
                          onPressed: () {
                            //
                            commissaireController.evaluationArbitreAssistant
                                .removeAt(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitres de reserve",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          //height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //commissaireController
                  Get.to(Evaluation("Evaluation des arbitres de reserve"));
                },
                leading: Icon(Icons.person),
                title: Text("Ajouter"),
                //subtitle: Text(""),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.evaluationArbitreReserve.length,
                    (index) {
                      //
                      Map e =
                          commissaireController.evaluationArbitreReserve[index];
                      //
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text(e['arbitre']['nom']),
                        subtitle: Text(e['evaluation']),
                        trailing: IconButton(
                          onPressed: () {
                            //
                            commissaireController.evaluationArbitreAssistant
                                .removeAt(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Evaluation",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          //height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton(
                onChanged: (e) {
                  //
                  difficulte.value = e as int;
                  //
                },
                value: difficulte.value,
                items: List.generate(
                  difficultes.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${difficultes[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //

        //
        const SizedBox(
          height: 10,
        ),
        TextField(
          maxLines: 4,
          controller: commentaire,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        //
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
                Get.dialog(
                  Center(
                    child: Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Enregistrer le rapport de ce match en local ?",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //
                                Get.back();
                                Loader.loading();
                                //
                                match['rapport'] = {};
                                //
                                box.write("rapport${match['match']}", match);
                                //
                              },
                              child: Text("Enregistrer"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
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
                  "Enregistrer",
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
