import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linafoot/pages/live/live_controller.dart';
import 'package:linafoot/pages/programme/programme_controller.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:linafoot/utils/paiement.dart';
import 'package:linafoot/utils/requete.dart';

class AfficheProgrammeWidget extends GetView<LiveController> {
  //
  String? idCalendrier;
  AfficheProgrammeWidget(this.idCalendrier);
  //
  ProgrammeController programmeController = Get.find();
  //
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    //
    return FutureBuilder(
      future: programmeController.getAfficher(idCalendrier!),
      builder: (c, t) {
        //
        if (t.hasData) {
          List matchs = t.data as List;
          return ListView(
            //padding: EdgeInsets.all(10),
            children: List.generate(
              matchs.length,
              (index) {
                //
                List directs = box.read("directs") ?? [];

                //
                bool suivre = false;
                //
                Map match = matchs[index];
                programmeController.journee.value = match['journee'];

                //
                directs.forEach((element) {
                  //
                  if (element['id'] == match['id']) {
                    suivre = true;
                  }
                });
                //
                List ds = match['date'].split("-");
                //
                DateTime date = DateTime(
                    int.parse(ds[2]), int.parse(ds[1]), int.parse(ds[0]));
                //
                var d = DateFormat.yMMMEd().format(date);
                //
                return Card(
                  color: Color(0xFFF0F0F0),
                  child: Container(
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.only(left: 0, right: 0),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: double.maxFinite,
                    child: InkWell(
                      onTap: () {
                        //
                        Get.to(Paiement(match, "Acheter le billet"));
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
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    width: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.005,
                                  ),
                                  Text(
                                    "${match['nomEquipeA']}",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF3A3838),
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
                                  suivre
                                      ? Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(
                                              Icons.play_circle,
                                              color: Colors.green.shade900,
                                              size: 25,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "JOURNEE ${match['journee']}",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3A3838),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFD9D9D9)),
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$d ${match['heure']}",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF3A3838),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${match['stade']}",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Linafoot",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 6,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    width: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${match['nomEquipeB']}", //nomEquipeA
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF3A3838),
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
            height: 40,
            width: 40,
            child: Loader.loadingW(),
          ),
        );
      },
    );
  }
}
