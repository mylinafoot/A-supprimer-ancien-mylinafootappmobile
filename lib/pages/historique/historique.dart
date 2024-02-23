import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'historique_controller.dart';

class Historique extends GetView<HistoriqueController> {
  //
  List rencontres = [
    ["AS DAUPHIN NOIR.png", "AS MANIEMA UNION.png"],
    ["Logo_DCMP.png", "CS DON BOSCO.png"],
    ["AS VITA CLUB.png", "AS DAUPHIN NOIR.png"],
    ["LES AIGLES DU CONGO.png", "AS MANIEMA UNION.png"],
    ["FC LUBUMBASHI SPORT.png", "LES AIGLES DU CONGO.png"],
    ["FC Saint Eloi Lupopo.png", "LogoTPM.png"],
    ["TP MAZEMBE.png", "LUPOPO FC.png"],
    ["TP MAZEMBE.png", "AS VITA CLUB.png"],
    [
      "AS DAUPHIN NOIR.png",
      "CS DON BOSCO.png",
      //"LogoTPM.png"
    ],
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      //color: Colors.blue, // Status bar color
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
          ],
        ),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Billé de match"),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: List.generate(
              2,
              (index) {
                //
                List r = rencontres[index];
                //
                return Card(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      //
                      Get.dialog(
                        Center(
                          child: Image.asset(
                            "assets/images.png",
                            // height: Get.size.height / 1.5,
                            // width: Get.size.height / 1.2,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 350,
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Image.asset("assets/${r[0]}"),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  child: Text(
                                    "0 - 0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Image.asset("assets/${r[1]}"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            height: 25,
                            width: double.maxFinite,
                            //color: Colors.black,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.red,
                                  Colors.blue.shade700,
                                  Colors.blue.shade700,
                                  Colors.yellow,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${index + 7}/02/2024",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            height: 25,
                            width: double.maxFinite,
                            //color: Colors.red.shade700,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.red,
                                  Colors.blue.shade700,
                                  Colors.blue.shade700,
                                  Colors.yellow,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lieu",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Stade de martyre (kinshasa)",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            height: 25,
                            width: double.maxFinite,
                            //color: Colors.yellow.shade700,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.red,
                                  Colors.blue.shade700,
                                  Colors.blue.shade700,
                                  Colors.yellow,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Place",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "173",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            height: 25,
                            width: double.maxFinite,
                            //color: Colors.blue.shade700,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.red,
                                  Colors.blue.shade700,
                                  Colors.blue.shade700,
                                  Colors.yellow,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Allé",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "7",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            "assets/images.png",
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
