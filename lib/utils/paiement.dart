import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:linafoot/utils/paiement_controller.dart';
import 'package:linafoot/utils/requete.dart';

class Paiement extends StatelessWidget {
  //
  PaiementController paiementController = Get.find();
  //
  Map match;
  Map p = {};
  //
  Paiement(this.match) {
    //
    List ds = match['date'].split("-");
    //
    DateTime date =
        DateTime(int.parse(ds[2]), int.parse(ds[1]), int.parse(ds[0]));
    //
    d = DateFormat.yMMMEd().format(date);
    //
    if (match['prixPourtour'] != null || match['prixPourtour'] > 0) {
      //
      p = {"place": "Pourtour", "prix": match['prixPourtour'], "devise": "CDF"};
      places.add({
        "place": "Pourtour",
        "prix": match['prixPourtour'],
        "devise": "CDF"
      });
      //places.add("Pourtour (${match['prixPourtour']}) CDF");
    }
    //
    if (match['prixPprixTribuneLateralleourtour'] != null ||
        match['prixTribuneLateralle'] > 0) {
      places.add({
        "place": "Tribune Lateralle",
        "prix": match['prixTribuneLateralle'],
        "devise": "CDF"
      });
      //places.add("Tribune Lateralle (${match['prixTribuneLateralle']}) CDF");
    }
    //
    if (match['prixTribuneHonneur'] != null ||
        match['prixTribuneHonneur'] > 0) {
      places.add({
        "place": "Tribune Honneur",
        "prix": match['prixTribuneHonneur'],
        "devise": "CDF"
      });
      //places.add("Tribune Honneur (${match['prixTribuneHonneur']}) CDF");
    }
    //
    if (match['prixTribuneCentrale'] != null ||
        match['prixTribuneCentrale'] > 0) {
      places.add({
        "place": "Tribune Centrale",
        "prix": match['prixTribuneCentrale'],
        "devise": "CDF"
      });
      //places.add("Tribune Centrale (${match['prixTribuneCentrale']}) CDF");
    }
  }

  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final nombrePlace = TextEditingController();
  final typePlace = TextEditingController();
  final opt = TextEditingController();
  //
  List places = [];
  RxInt place = 0.obs;
  //
  RxBool showOTP = false.obs;
  //
  var d;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Loader.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/illicocash.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   "assets/logo_MIN SANTE.png",
                  //   width: 300,
                  //   height: 300,
                  // ),
                  // const SizedBox(
                  //   height: 70,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 1,
                    color: Colors.black,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 100,
                      width: double.maxFinite,
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
                                    height: 50,
                                    width: 50,
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
                                    MainAxisAlignment.spaceEvenly,
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
                                        color: Colors.yellow.shade400,
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
                                    height: 50,
                                    width: 50,
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

                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Téléphone",
                      style: textStyle,
                    ),
                  ),
                  //
                  TextFormField(
                    controller: telephone,
                    //textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    //autofocus: true,
                    //focusNode: FocusNode(skipTraversal: true),
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre numéro de téléphone";
                      } else if (e!.length >= 10) {
                        return "Le numéro n'est pas correct !";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefix: Text(
                        "00243 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.phone_android),
                      // prefixIcon: CountryCodePicker(
                      //   onChanged: (countryCode) {
                      //     codePays = countryCode.dialCode!;
                      //     if (kDebugMode) {
                      //       print(codePays);
                      //     }
                      //   },
                      //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      //   initialSelection: 'CD',
                      //   favorite: ['+243', 'CD'],
                      //   // optional. Shows only country name and flag
                      //   showCountryOnly: true,
                      //   // optional. Shows only country name and flag when popup is closed.
                      //   showOnlyCountryWhenClosed: false,
                      //   // optional. aligns the flag and the Text left
                      //   alignLeft: false,
                      //   //showFlag: false,
                      // ),
                      //hintText: "Téléphone",
                      // hintStyle: TextStyle(
                      //   fontSize: 15,
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Place",
                      style: textStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Obx(
                        () => DropdownButton(
                          onChanged: (e) {
                            //
                            place.value = e as int;
                            p = places[place.value];
                            //
                          },
                          value: place.value,
                          items: List.generate(
                            places.length,
                            (index) => DropdownMenuItem(
                              value: index,
                              child: Text(
                                  "${places[index]['place']} (${places[index]['prix']} ${places[index]['devise']} )"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nombre de place(s)",
                      style: textStyle,
                    ),
                  ),
                  TextFormField(
                    controller: nombrePlace,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    //autofocus: true,
                    //focusNode: FocusNode(skipTraversal: true),
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre numéro de téléphone";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.chair),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Payer en toute sécurité",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      Loader.loading();
                      //
                      Map x = {
                        "id": match['id'],
                        "place": p['place'],
                        "telephone": "00243${telephone.text}",
                        "nombrePlace": nombrePlace.text,
                        "montant": p['prix'],
                        "devise": p['devise'],
                        "qrcode": mdpGenerer(),
                      };
                      //
                      Map reponse = await paiementController.sendOTP(x);
                      //Approuvé
                      if (reponse["respcodedesc"] == "Client introuvable") {
                        //
                        Get.snackbar("Oups",
                            "Vous n'etes pas client ILLICOCASH Veuillez-vous enregistrer dans un shop ILLICOCASH");
                      } else {
                        //
                        TextEditingController otp = TextEditingController();
                        //Get.snackbar("Succès", "Vous-avez reçu un code veuillez ");
                        Get.dialog(Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Card(
                              elevation: 1,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 300,
                                width: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Veuillez inserer le code que vous avez reçu par SMS",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: otp,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        prefixIcon: const Icon(Icons.numbers),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              //
                                              Get.back();
                                              Loader.loading();
                                              //
                                              x['otp'] = otp.text;
                                              x['rrn'] = reponse["rrn"];
                                              //
                                              paiementController
                                                  .payerVerification(x);
                                            },
                                            style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                const Size(
                                                  double.maxFinite,
                                                  45,
                                                ),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color.fromARGB(255, 0, 90, 23),
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.maxFinite,
                                              child: const Text(
                                                "Valider",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              //
                                              Get.back();
                                            },
                                            style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                const Size(
                                                  double.maxFinite,
                                                  45,
                                                ),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Loader.backgroundColor),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.maxFinite,
                                              child: const Text(
                                                "Annuler",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(
                          double.maxFinite,
                          45,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: const Text(
                        "Envoyer",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     //
                  //     Get.to(CreerCompte());
                  //     //
                  //   },
                  //   style: ButtonStyle(
                  //     fixedSize: MaterialStateProperty.all(
                  //       const Size(
                  //         double.maxFinite,
                  //         45,
                  //       ),
                  //     ),
                  //     shape:
                  //         MaterialStateProperty.all(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     )),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(Colors.red),
                  //   ),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     width: double.maxFinite,
                  //     child: const Text(
                  //       "Créer un nouveau compte",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              //)
            ),
          ),
        ),
      ),
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  //
  String mdpGenerer() {
    //
    var r = Random();
    //
    String mdp = "";
    for (int t = 0; t < 15; t++) {
      mdp = "$mdp${r.nextInt(10)}";
    }
    return mdp;
  }
}
