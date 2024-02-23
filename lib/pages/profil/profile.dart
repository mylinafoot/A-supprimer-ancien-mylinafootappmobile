import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire.dart';
import 'package:linafoot/pages/rapports/officier/officier.dart';
import 'package:linafoot/utils/requete.dart';

class Profile extends StatelessWidget {
  List matchs = [];
  //
  var box = GetStorage();
  //
  int type;
  Profile(this.matchs, this.type);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: List.generate(matchs.length, (index) {
          Map match = matchs[index];
          //
          List ds = match['date'].split("-");
          //
          DateTime date =
              DateTime(int.parse(ds[2]), int.parse(ds[1]), int.parse(ds[0]));
          //
          var d = DateFormat.yMMMEd().format(date);
          //
          return Card(
            //color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 175,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: InkWell(
                      onTap: () {
                        //
                        if (!match['jouer']) {
                          //
                          box.write("match${match['match']}", match);
                          //
                          if (type == 1) {
                            Get.to(CommissaireFormulaire(match));
                          }
                          if (type == 2) {
                            Get.to(HarbitreRapport(match));
                          }
                          if (type == 3) {
                            Get.to(OfficierRapport(match));
                          }
                        } else {
                          //
                          Get.snackbar(
                              "Erreur", "Ce match a déjà été rapporté");
                        }
                        //Get.to();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${match['nomEquipeB']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "JOURNEE ${match['journee']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow.shade700,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$d ${match['date']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${match['stade']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "linafoot",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow.shade700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${match['nomEquipeB']}", //nomEquipeA
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.red.shade900,
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        //
                        Map rapport =
                            box.read("rapport${match['match']}") ?? {};
                        if (rapport["match"] != null) {
                          //
                        } else {
                          //
                          Get.snackbar("Désolé",
                              "Aucun rapport n'a été enregistré en local pour ce match.");
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Aperçu du rapport"),
                            Icon(
                              Icons.list_outlined,
                              color: Colors.green.shade900,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
  //
}
