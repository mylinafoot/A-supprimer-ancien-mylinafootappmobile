import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';
import 'package:linafoot/utils/loader.dart';

import '../formulaire_officier_3/remplacement.dart';

class FormulaireOffice4 extends StatelessWidget {
  //
  PageController controller;
  //
  int local;
  //
  var box = GetStorage();
  //
  Map match;
  //
  OfficierController officierController = Get.find();
  //
  FormulaireOffice4(this.controller, this.match, this.local);
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
            "Remplacements equipes B",
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
                  Get.to(Remplacement("Equipe B"));
                  //
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.joueurRemplacantB.length,
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
                                  "${officierController.joueurRemplacantB[i]['entrant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['entrant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantB
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
                                  "${officierController.joueurRemplacantB[i]['sortant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['sortant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantB
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text("Minute:"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['minute']}"),
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
                                if (local == 2) {
                                  //Pour le commissaire...
                                  //match['idMatch'] = match['id'];
                                  //match['typeRapport'] = 1;
                                  //
                                  Map rap = {
                                    "idMatch": match['match'],
                                    "typeRapport": 3,
                                    "date": match['date'],
                                    "commissaire": match['commissaire'],
                                    "heure": match['heure'],
                                    "categorie": match['categorie'],
                                    "terrainNeutre": false,
                                    "arbitreAssitant1":
                                        match['arbitreAssitant1'],
                                    "match": match['match'],
                                    "journee": match['journee'],
                                    "arbitreAssitant2":
                                        match['arbitreAssitant2'],
                                    "stade": match['stade'],
                                    "arbitreCentrale": match['arbitreCentrale'],
                                    "arbitreProtocolaire":
                                        match['arbitreProtocolaire'],
                                    "saison": "",
                                    "idCalendrier": match['idCalendrier'],
                                    "quiRecoit": match['quiRecoit'],
                                    "idEquipeB": match['idEquipeB'],
                                    "officierRapporteur":
                                        match['officierRapporteur'],
                                    "idEquipeA": match['idEquipeA'],
                                    "nomEquipeA": match['nomEquipeA'],
                                    "nombreDePlaces": match['nombreDePlaces'],
                                    "nomEquipeB": match['nomEquipeB'],
                                    "jouer": true,
                                    "rapport": {
                                      "heure": officierController.heure.value,
                                      "date": officierController.date.value,
                                      "stade": officierController.stade.value,
                                      "equipeA":
                                          officierController.equipeA.value,
                                      "equipeB":
                                          officierController.equipeB.value,
                                      "resultatMitemps": officierController
                                          .resultatMitemps.value,
                                      "resultatFinal": officierController
                                          .resultatFinal.value,
                                      "arbitreCentral": officierController
                                          .arbitreCentral.value,
                                      "arbitreAssistant1": officierController
                                          .arbitreAssistant1.value,
                                      "arbitreAssistant2": officierController
                                          .arbitreAssistant2.value,
                                      "arbitreProtocolaire": officierController
                                          .arbitreProtocolaire.value,
                                      //__________________________________________
                                      "meteo": officierController
                                          .arbitreProtocolaire.value,
                                      //
                                      "joueurRemplacantA": officierController
                                          .joueurRemplacantA.value,
                                      //
                                      "joueurRemplacantB": officierController
                                          .joueurRemplacantB.value,
                                      //
                                      //__________________________________________
                                      "scoreMitemps":
                                          officierController.scoreMitemps.value,
                                      "scoreFin":
                                          officierController.scoreFin.value,
                                      //
                                      "nmatch":
                                          officierController.nMatch.value.text,
                                      "jouea":
                                          officierController.jouea.value.text,
                                      "nombreSpectateur": officierController
                                          .nombreSpectateur.value.text,
                                      //
                                      "avertissementsJoueursGeneralA":
                                          officierController
                                              .avertissementsJoueursGeneralA
                                              .value,
                                      "expulssionsJoueursGeneralA":
                                          officierController
                                              .expulssionsJoueursGeneralA.value,
                                      "butsJoueursGeneralA": officierController
                                          .butsJoueursGeneralA.value,
                                      //
                                      "avertissementsJoueursGeneralB":
                                          officierController
                                              .avertissementsJoueursGeneralB
                                              .value,
                                      "expulssionsJoueursGeneralB":
                                          officierController
                                              .expulssionsJoueursGeneralB.value,
                                      //
                                      "butsJoueursGeneralB": officierController
                                          .butsJoueursGeneralB.value,
                                      //__________________________________________
                                      //officierController.officierEquipeA
                                      "officierEquipeA": officierController
                                          .officierEquipeA.value,
                                      //
                                      "officierEquipeB": officierController
                                          .officierEquipeB.value,
                                      //__________________________________________
                                      //
                                    },
                                  };
                                  //
                                  //
                                  officierController.envoyerRapport(rap);
                                } else {
                                  //
                                  match['rapport'] = {
                                    "heure": officierController.heure.value,
                                    "date": officierController.date.value,
                                    "stade": officierController.stade.value,
                                    "equipeA": officierController.equipeA.value,
                                    "equipeB": officierController.equipeB.value,
                                    "resultatMitemps": officierController
                                        .resultatMitemps.value,
                                    "resultatFinal":
                                        officierController.resultatFinal.value,
                                    "arbitreCentral":
                                        officierController.arbitreCentral.value,
                                    "arbitreAssistant1": officierController
                                        .arbitreAssistant1.value,
                                    "arbitreAssistant2": officierController
                                        .arbitreAssistant2.value,
                                    "arbitreProtocolaire": officierController
                                        .arbitreProtocolaire.value,
                                    //__________________________________________
                                    "meteo": officierController
                                        .arbitreProtocolaire.value,
                                    //
                                    "joueurRemplacantA": officierController
                                        .joueurRemplacantA.value,
                                    //
                                    "joueurRemplacantB": officierController
                                        .joueurRemplacantB.value,
                                    //
                                    //__________________________________________
                                    "scoreMitemps":
                                        officierController.scoreMitemps.value,
                                    "scoreFin":
                                        officierController.scoreFin.value,
                                    //
                                    "nmatch":
                                        officierController.nMatch.value.text,
                                    "jouea":
                                        officierController.jouea.value.text,
                                    "nombreSpectateur": officierController
                                        .nombreSpectateur.value.text,
                                    //
                                    "avertissementsJoueursGeneralA":
                                        officierController
                                            .avertissementsJoueursGeneralA
                                            .value,
                                    "expulssionsJoueursGeneralA":
                                        officierController
                                            .expulssionsJoueursGeneralA.value,
                                    "butsJoueursGeneralA": officierController
                                        .butsJoueursGeneralA.value,
                                    //
                                    "avertissementsJoueursGeneralB":
                                        officierController
                                            .avertissementsJoueursGeneralB
                                            .value,
                                    "expulssionsJoueursGeneralB":
                                        officierController
                                            .expulssionsJoueursGeneralB.value,
                                    //
                                    "butsJoueursGeneralB": officierController
                                        .butsJoueursGeneralB.value,
                                    //__________________________________________
                                    //officierController.officierEquipeA
                                    "officierEquipeA": officierController
                                        .officierEquipeA.value,
                                    //
                                    "officierEquipeB": officierController
                                        .officierEquipeB.value,
                                    //__________________________________________
                                    //
                                  };
                                  //
                                  match['jouer'] = true;
                                  //
                                  box.write("rapport${match['match']}", match);
                                  //
                                  Get.offAll(Accueil());
                                  Get.snackbar(
                                    "Rapport",
                                    "Votre rapport a été enregistré en local",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                  Get.back();
                                }
                                //
                              },
                              child: local == 2
                                  ? const Text("Enoyer le rapport")
                                  : const Text("Enregistrer"),
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
                child: local == 2
                    ? const Text(
                        "Envoyer",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
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
