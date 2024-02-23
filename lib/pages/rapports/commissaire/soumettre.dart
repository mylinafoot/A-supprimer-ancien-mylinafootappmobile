import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Soumettre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linafoot"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    //color: Colors.black,
                    ),
                text: "Rapport du match.\n",
                children: [
                  TextSpan(
                      text:
                          """En soumettant ce formulaire je jure sur mon honneur que les informations soumise sont conforme. """),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                /**
                {
  "date": "27-2-2024",
  "commissaire": 51,
  "heure": "18:30",
  "categorie": "playoff",
  "terrainNeutre": false,
  "arbitreAssitant1": 1,
  "match": 51,
  "journee": 1,
  "arbitreAssitant2": 1,
  "stade": "Kindu Joseph Kabila",
  "arbitreCentrale": 1,
  "arbitreProtocolaire": 1,
  "saison": "",
  "jouer": false,
  "idCalendrier": 1,
  "quiRecoit": null,
  "idEquipeB": 1,
  "idEquipeA": 1,
  "nomEquipeA": "AS MANIEMA UNION",
  "nombreDePlaces": 50000,
  "nomEquipeB": "AS MANIEMA UNION"
}
                 */
                //
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 70,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Soumettre le formulaire",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
