import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/profil/profile_controller.dart';
import 'package:linafoot/utils/loader.dart';

import '../login/login_controller.dart';
import 'nouveau_utilisateur.dart';
import 'profil_mdp_oublie.dart';
import 'profil_utilisateur.dart';

class LoginUtilisateur extends StatelessWidget {
  //
  //
  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final noms = TextEditingController();
  final mdp = TextEditingController();
  final mdp2 = TextEditingController();
  //
  String codePays = "+243";
  //
  RxBool vue = true.obs;
  var box = GetStorage();

  LoginController loginController = Get.find();
  //

  //
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Loader.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Connexion",
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
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: ExactAssetImage("assets/mylinafoot.jpg"),
                            fit: BoxFit.cover,
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
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
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //
                          Loader.loading();
                          String codee = await getCode();
                          print("Le code 2: $codee");
                          //243 $telephone
                          Map rep = await loginController.loginUtilisateur(
                              "243${telephone.text}", codee);
                          //
                          if (rep['status'] == 'SENT') {
                            //
                            TextEditingController codeSEND =
                                TextEditingController();
                            //
                            Get.dialog(
                              Material(
                                color: Colors.transparent,
                                child: Center(
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 300,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            controller: codeSEND,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              prefixIcon:
                                                  const Icon(Icons.numbers),
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
                                                    print(
                                                        "code: ${codeSEND.text}");
                                                    //
                                                    if (codeSEND.text ==
                                                        codee) {
                                                      //
                                                      Map utilisateur = {
                                                        "nomUtilisateur": "",
                                                        "province": "",
                                                        "pays": "",
                                                        "telephone":
                                                            "243${telephone.text}"
                                                      };
                                                      //
                                                      box.write("utilisateur",
                                                          utilisateur);
                                                      //
                                                      Get.back();
                                                      Get.back();
                                                      Get.to(ProfilUtilisateur(
                                                          utilisateur));
                                                    } else {
                                                      //
                                                      Get.snackbar("Oups",
                                                          "Le code est incorrect");
                                                    }
                                                  },
                                                  style: ButtonStyle(
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      const Size(
                                                        double.maxFinite,
                                                        45,
                                                      ),
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      Color.fromARGB(
                                                          255, 0, 90, 23),
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
                                                        MaterialStateProperty
                                                            .all(
                                                      const Size(
                                                        double.maxFinite,
                                                        45,
                                                      ),
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Loader
                                                                .backgroundColor),
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
                              ),
                            );
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
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
                        height: 20,
                      ),
                    ],
                  ),
                  //)
                ),
              ),
            ),
          ),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     text: "Power by\n",
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: "SkyTechnologie",
          //         style: TextStyle(
          //           color: Colors.grey.shade700,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  //
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  //
  //
  Future<String> getCode() async {
    //
    var r = Random();
    //
    String codee = "";
    //
    for (int t = 0; t < 7; t++) {
      codee = "$codee${r.nextInt(9)}";
    }
    print("Le code: $codee");
    return codee;
  }
  /**
   * Bandundu
Baraka
Beni
Boende
Boma
Bukavu
Bunia
Buta
Butembo
Gbadolite
Gemena
Goma
Inongo
Isiro
Kabinda
Kalemie
Kamina
Kananga
Kenge
Kikwit
Kindu
Kisangani
Kinshasa
Kolwezi
Likasi
Lisala
Lubumbashi
Lusambo
Matadi
Mbandaka
Mbujimayi
Muene-Ditu
Tshikapa
Uvira
Zongo
   */
}
