import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/utils/loader.dart';

class Billet extends StatelessWidget {
  //
  var box = GetStorage();
  //
  RxList billets = [].obs;
  //
  Billet() {
    //
    billets.value = box.read("billets") ?? [];
    //List billets = box.read("billets") ?? [];
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      appBar: AppBar(
        title: Text("Billets"),
        centerTitle: true,
        backgroundColor: Loader.backgroundColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: List.generate(billets.length, (index) {
          //
          Map match = billets[index];
          //
          /*
          
                        "journee": match['journee'],
                        "nomEquipeA": match['nomEquipeA'],
                        "nomEquipeB": match['nomEquipeB'],
                        "date": match['date'],
                        "heure": match['heure'],
                        "stade": match['stade'],
                        "qrcode":qrcode
          */
          return InkWell(
            onTap: () {
              //
            },
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "JOURNEE ${match['journee']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${match['date']}",
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
                              "${match['heure']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade400,
                              ),
                            ),
                          ),
                        ],
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
