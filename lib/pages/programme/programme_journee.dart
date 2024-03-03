import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linafoot/utils/paiement.dart';
import 'package:linafoot/utils/requete.dart';
import 'programme_controller.dart';

class ProgrammeJournee extends GetView<ProgrammeController> {
  int jr;
  String idCalendrier, categorie;
  //
  ProgrammeController programmeController = Get.find();
  //

  ProgrammeJournee(this.idCalendrier, this.categorie, this.jr, {super.key}) {
    print(
        "response jr $idCalendrier: $idCalendrier, categorie: $categorie, jr: $jr, key: $key");
    controller.getAllMatchsDeLaJournee(idCalendrier, categorie, "$jr");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      children: [
        FutureBuilder(
          future: controller.getAllMatchsDeLaJournee2(
              idCalendrier, categorie, "$jr"),
          builder: (c, t) {
            if (t.hasData) {
              List matchs = t.data as List;
              return Column(
                children: List.generate(
                  matchs.length,
                  (index) {
                    Map match = matchs[index];
                    //
                    List ds = match['date'].split("-");
                    //
                    DateTime date = DateTime(
                        int.parse(ds[2]), int.parse(ds[1]), int.parse(ds[0]));
                    //
                    var d = DateFormat.yMMMEd().format(date);
                    //
                    return Card(
                      //color: Colors.white,
                      color: Colors.black,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 120,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                //
                                Get.to(Paiement(match));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              //color: Colors.red,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "JOURNEE ${match['journee']}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey.shade400),
                                            child: Column(children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "$d ${match['date']}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey.shade700,
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
                                                    color: Colors.black,
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
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              //color: Colors.red,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (t.hasError) {
              return Container();
            }
            return Center(
              child: Container(
                width: 40,
                height: 40,
                child: const CircularProgressIndicator(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
  //
}
