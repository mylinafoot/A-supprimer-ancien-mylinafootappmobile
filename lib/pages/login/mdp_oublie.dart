import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class MdpOublie extends StatelessWidget {
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

  LoginController loginController = Get.find();
  //
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Mot de passe oublié",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
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
                        height: 100,
                        decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: ExactAssetImage("assets/logo_MIN SANTE.png"),
                            //   fit: BoxFit.cover,
                            // ),
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
                      // const Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "Système de surveillance sanitaire des voyageurs entrant, sortant et circulant dans le sol Congolais",
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 70,
                      ),
                      // TextFormField(
                      //   controller: noms,
                      //   validator: (e) {
                      //     if (e!.isEmpty) {
                      //       return "Veuilliez inserer votre Noms";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     contentPadding:
                      //         const EdgeInsets.symmetric(vertical: 5),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     prefixIcon: const Icon(Icons.person),
                      //     hintText: "Nom complet",
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      TextFormField(
                        controller: telephone,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer votre numéro de téléphone";
                          }
                          if (e.length < 8) {
                            return "Les caratères sont inférieux à 8";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: const Text("Ex: 818140000"),
                          prefixIcon: CountryCodePicker(
                            onChanged: (countryCode) {
                              codePays = countryCode.dialCode!;
                              if (kDebugMode) {
                                print(codePays);
                              }
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'CD',
                            favorite: const ['+243', 'CD'],
                            // optional. Shows only country name and flag
                            showCountryOnly: true,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                            //showFlag: false,
                          ),
                          hintText: "Téléphone",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: mdp,
                          obscureText: masquer.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            if (e.length < 8) {
                              return "Les caratères sont inférieux à 8";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Obx(
                              () => IconButton(
                                icon: vue.value
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons.lock),
                                onPressed: () {
                                  //
                                  masquer.value = !masquer.value;
                                },
                              ),
                            ),
                            hintText: "Nouveau mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: mdp2,
                          obscureText: masquer.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            if (mdp2.text != mdp.text) {
                              return "Mot de passe incorrect";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Obx(
                              () => IconButton(
                                icon: vue.value
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons.lock),
                                onPressed: () {
                                  //
                                  masquer.value = !masquer.value;
                                },
                              ),
                            ),
                            hintText: "Confirmer mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil());
                            Get.dialog(Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ));
                            // Timer(Duration(seconds: 3), () {
                            //   Get.back();
                            //   Get.off(Accueil());
                            // });
                            Map e = {
                              //"noms": noms.text,
                              "telephone": "$codePays${telephone.text}",
                              "mdp": mdp.text,
                            };
                            Map rep = await loginController.sendCode(
                                "$codePays${telephone.text}", false);
                            if (rep["envoi"]) {
                              //
                              Get.back();
                              //appController.login(e);
                              //loginController.creer(e);
                              TextEditingController textCode =
                                  TextEditingController();
                              Get.dialog(
                                Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "Inserer le code envoyé par SMS",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: TextField(
                                                autofocus: true,
                                                textAlign: TextAlign.center,
                                                controller: textCode,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "Code",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        //
                                                        Get.back();

                                                        Get.dialog(Container(
                                                          height: 40,
                                                          width: 40,
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              const CircularProgressIndicator(),
                                                        ));
                                                        if (rep["code"] ==
                                                            textCode.text) {
                                                          loginController
                                                              .updateMdp(e);
                                                        } else {
                                                          Get.back();
                                                          Get.snackbar("Code",
                                                              "Le code est incorrect.");
                                                        }
                                                      },
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                        Color.fromARGB(
                                                            255, 89, 50, 156),
                                                      )),
                                                      child: const Text(
                                                        "Valider",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                          Colors.red.shade700,
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        "Annuler",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              Get.back();
                              if (rep["code"] == 300 && false) {
                                Get.snackbar(
                                  "Erreur",
                                  "Ce numéro a déjà un compte",
                                  backgroundColor: Colors.red.shade700,
                                  colorText: Colors.white,
                                );
                              } else {
                                Get.snackbar(
                                  "Erreur",
                                  "Ce numéro n'a pas compte",
                                  backgroundColor: Colors.red.shade700,
                                  colorText: Colors.white,
                                );
                              }
                            }
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(
                              double.maxFinite,
                              45,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "Enregistrer",
                            style: TextStyle(
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
}
