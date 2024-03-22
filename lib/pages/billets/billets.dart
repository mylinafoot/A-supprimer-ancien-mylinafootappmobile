import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
          print("match: $match");
          //
          /*
          //
          {
    "date": "3-3-2024",
    "heure": "18:30",
    "qrcode": "2024315164648630253",
    "journee": 1,
    "telephone": "00243850000069",
    "montant": 3000.0,
    "stade": "Kindu Joseph Kabila",
    "devise": "CDF",
    "nombrePlace": 1,
    "qrCode": "20243151646486302530",
    "id": 1,
    "place": "Pourtour",
    "nomEquipeA": "AS DON BOSCO",
    "nomEquipeB": "AS DON BOSCO"
  }
          //
          
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
              Get.dialog(
                Center(
                  child: Card(
                    elevation: 1,
                    child: Container(
                      color: Colors.white,
                      height: Get.size.height / 1.1,
                      width: Get.size.width / 1.1,
                      child: Center(
                        child: QrImageView(
                          data: '${match['qrCode']}',
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            //
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: QrImageView(
                        data: '${match['qrCode']}',
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
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
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${match['date']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${match['nomEquipeA']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "vs",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${match['nomEquipeB']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${match['stade']}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${match['heure']}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
